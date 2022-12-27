import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier {
  bool _isOpenDrawer = false;

  bool getIsOpenDrawer() => _isOpenDrawer;

  set setIsOpenDrawer(bool dato) {
    _isOpenDrawer = dato;
    print(_isOpenDrawer);
    notifyListeners();
  }

  late AnimationController _animationController;
  AnimationController get getAnimationController => _animationController;
  set setAnimationController(AnimationController dato) {
    _animationController = dato;
    // notifyListeners();
  }
}
