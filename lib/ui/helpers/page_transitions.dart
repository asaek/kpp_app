import 'package:flutter/cupertino.dart';

Route crearRuta({
  required Widget haciaA,
}) {
  const double begin = 0.0;
  const double end = 1.0;

  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) =>
        haciaA,
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeIn,
        // curve: Curves.easeInOut,
      );

      // return SlideTransition(
      //   position: Tween<Offset>(begin: Offset(1.0, 1), end: Offset.zero)
      //       .animate(curvedAnimation),
      //   child: child,
      // );

      // return ScaleTransition(
      //   child: child,
      //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
      // );

      // return RotationTransition(
      //   child: child,
      //   turns: Tween<double>(begin: 0.0, end: 5.0).animate(curvedAnimation),
      // );

      return FadeTransition(
        opacity: Tween<double>(begin: begin, end: end).animate(curvedAnimation),
        child: child,
      );

      // return RotationTransition(
      //   child: FadeTransition(
      //     opacity:
      //         Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
      //     child: child,
      //   ),
      //   turns: Tween<double>(begin: 0.0, end: 5.0).animate(curvedAnimation),
      // );
    },
  );
}
