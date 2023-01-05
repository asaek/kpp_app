import 'package:flutter/material.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class TarjetaNoticias extends StatelessWidget {
  // bool touchListview = true;
  final events = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<NoticiasProvider>(
      builder: (context, noticiasProvider, child) {
        // for (var i = 0; i < 3; i++) {
        //   noticiasProvider.addSlotPageViewList(0);
        // }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (widgetListBuilder, animation) => FadeTransition(
            opacity: animation,
            child: widgetListBuilder,
          ),
          child: (noticiasProvider.getCargando == true)
              ? Image.asset(
                  'assets/loadings/kyaryLoading_2.gif',
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              : ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.vertical,
                  physics: (noticiasProvider.getListViewSeMueve)
                      ? const BouncingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final edgesImage = BorderRadius.circular(25);

                    return Padding(
                      padding:
                          // const EdgeInsets.only(right: 5, left: 5, bottom: 15),
                          const EdgeInsets.only(bottom: 15),
                      child: Column(
                        children: [
                          (index == 0)
                              ? const SizedBox(height: 60)
                              : const SizedBox(),
                          Material(
                            color: const Color.fromARGB(255, 255, 163, 194),
                            borderRadius: edgesImage,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    _PinchZoomImage(
                                      index: index,
                                      // pageController:
                                      //     noticiasProvider.getPageController,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FloatingActionButton(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          child: const Icon(
                                            Icons.arrow_back,
                                            color: Colors.pinkAccent,
                                            size: 45,
                                          ),
                                          onPressed: () {
                                            final listaControllers =
                                                noticiasProvider
                                                    .getPageControllerList;
                                            print(
                                                'Pagina actual del controller $index --- ${listaControllers[index].page}');

                                            listaControllers[index]
                                                .previousPage(
                                                    duration: const Duration(
                                                        milliseconds: 200),
                                                    curve: Curves.easeIn);

                                            print('Me precionaste');
                                          },
                                        ),
                                        FloatingActionButton(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          child: const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.pinkAccent,
                                            size: 45,
                                          ),
                                          onPressed: () {
                                            final listaControllers =
                                                noticiasProvider
                                                    .getPageControllerList;

                                            print(
                                                'Pagina actual del controller $index --- ${listaControllers[index].page}');
                                            listaControllers[index].nextPage(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                curve: Curves.easeIn);
                                            print('Me precionaste');
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const Text(
                                  'Titulo de la noticia',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    'Texto de la noticia wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww',
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(right: 10, bottom: 20),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('Fuete we '),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}

class _PinchZoomImage extends StatefulWidget {
  const _PinchZoomImage({
    Key? key,
    required this.index,
    // required this.pageController,
  }) : super(key: key);

  // final PageController pageController;
  final int index;
  @override
  State<_PinchZoomImage> createState() => _PinchZoomImageState();
}

class _PinchZoomImageState extends State<_PinchZoomImage>
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
    // final slotSet =
    //     Provider.of<NoticiasProvider>(context, listen: false).getSlotPageView;

    // Provider.of<NoticiasProvider>(context, listen: false)
    //     .addPageControllerToList(_pageControllerPropio);
    // print('Se agrego PageController');

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
            color: Colors.pinkAccent,
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: PageView.builder(
                itemCount: imagenesTEMPORALES.length,
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
                    imagenesTEMPORALES[
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
