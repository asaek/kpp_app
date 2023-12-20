import 'package:flutter/material.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class PageViewZOOMNoticias extends StatefulWidget {
  const PageViewZOOMNoticias({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  State<PageViewZOOMNoticias> createState() => _PageViewZOOMNoticiasState();
}

class _PageViewZOOMNoticiasState extends State<PageViewZOOMNoticias>
    with SingleTickerProviderStateMixin {
  final events = [];
  final edgesImage = BorderRadius.circular(10);

  late AnimationController animationController;
  late TransformationController controllerTransform;
  Animation<Matrix4>? animationMatrix;
  OverlayEntry? entry;
  double scale = 1;
  double maxScale = 5.0;
  double minScale = 1;
  final double alturaImagen = 550;
  late PageController _pageControllerPropio;

  @override
  void initState() {
    controllerTransform = TransformationController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() => controllerTransform.value = animationMatrix!.value)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            removeOverlay();
          }
        },
      );

    _pageControllerPropio =
        Provider.of<NoticiasProvider>(context, listen: false)
            .getPageControllerList[widget.index];

    super.initState();
  }

  @override
  void dispose() {
    entry?.remove();
    // _pageControllerPropio.dispose();
    controllerTransform.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<NoticiasProvider>(
        builder: (context, noticiasProvider, child) => SizedBox(
          width: double.infinity,
          height: alturaImagen,
          child: PageView.builder(
            itemCount: noticiasProvider
                .getNoticiasCargadas[widget.index].urlImagenes!.length,
            scrollDirection: Axis.horizontal,
            controller: _pageControllerPropio,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, indexx) {
              noticiasProvider.setSlotPageViewList(
                  slot: widget.index, valor: indexx);
              return buildImage();
            },
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return Builder(builder: (context) {
      // print('SE BUILDEO');
      return InteractiveViewer(
        transformationController: controllerTransform,
        clipBehavior: Clip.none,
        panEnabled: false,
        minScale: minScale,
        maxScale: maxScale,
        onInteractionStart: (details) {
          if (details.pointerCount < 2) return;
          showOverlay(context);
        },
        onInteractionEnd: (details) {
          resetAnimation();
        },
        onInteractionUpdate: (details) {
          if (entry == null) return;

          scale = details.scale;
          entry!.markNeedsBuild();
        },
        child: Consumer<NoticiasProvider>(
          builder: (context, noticiasProvider, child) => Listener(
            onPointerDown: (event) {
              events.add(event);
              print('Un nuevo Toque');
            },
            onPointerUp: (event) {
              events.clear();
              noticiasProvider.setListViewSeMueve = true;
              print('Se destoco jajaja');
            },
            onPointerMove: (event) {
              if (events.length == 2) {
                noticiasProvider.setListViewSeMueve = false;
              }
            },
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: edgesImage,
                child: FadeInImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder:
                      const AssetImage('assets/loadings/kyaryLoading_1.gif'),
                  image: NetworkImage(
                    noticiasProvider
                            .getNoticiasCargadas[widget.index].urlImagenes![
                        noticiasProvider.getSlotPageView[widget.index]],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  void showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    final size = MediaQuery.of(context).size;

    entry = OverlayEntry(
      builder: ((context) {
        final opacity = ((scale - 1) / (maxScale - 1)).clamp(0.0, 1.0);
        print(opacity);
        return Stack(
          children: [
            Positioned.fill(
                child: Opacity(
              opacity: opacity,
              child: Container(
                color: Colors.black,
              ),
            )),
            Positioned(
              left: offset.dx,
              top: offset.dy,
              width: size.width,
              height: alturaImagen,
              child: buildImage(),
            ),
          ],
        );
      }),
    );

    final overlay = Overlay.of(context)!;
    overlay.insert(entry!);
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }

  void resetAnimation() {
    animationMatrix = Matrix4Tween(
      begin: controllerTransform.value,
      end: Matrix4.identity(),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
    animationController.forward(from: 0);
  }
}
