import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/tokens/colores.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class PageViewZOOM extends StatefulWidget {
  const PageViewZOOM({
    Key? key,
    required this.index,
    // required this.pageController,
  }) : super(key: key);

  // final PageController pageController;
  final int index;
  @override
  State<PageViewZOOM> createState() => _PageViewZOOMState();
}

class _PageViewZOOMState extends State<PageViewZOOM>
    with SingleTickerProviderStateMixin {
  final imagenesTEMPORALES = [
    'https://pbs.twimg.com/media/FlTzHPNWAAE3uKr?format=jpg&name=large',
    'https://pbs.twimg.com/media/FlTzHPOXoAcqokd?format=jpg&name=large',
    'https://pbs.twimg.com/media/FlTzHPMWYAIbRpO?format=jpg&name=large'
  ];
  final events = [];
  final edgesImage = BorderRadius.circular(25);

  late AnimationController animationController;
  late TransformationController controllerTransform;
  Animation<Matrix4>? animationMatrix;
  OverlayEntry? entry;
  double scale = 1;
  double maxScale = 5.0;
  double minScale = 1;

  late PageController _pageControllerPropio;

  @override
  void initState() {
    controllerTransform = TransformationController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() => controllerTransform.value = animationMatrix!.value)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          removeOverlay();
        }
      });

    _pageControllerPropio =
        Provider.of<NoticiasProvider>(context, listen: false)
            .getPageControllerList[widget.index];

    super.initState();
  }

  @override
  void dispose() {
    controllerTransform.dispose();
    animationController.dispose();
    // _pageControllerPropio.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<NoticiasProvider>(
        builder: (context, noticiasProvider, child) => SizedBox(
          width: double.infinity,
          height: 400,
          child: Material(
            borderRadius: edgesImage,
            color: Color_All_Interface_X,
            child: Padding(
              padding: const EdgeInsets.all(3),
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
