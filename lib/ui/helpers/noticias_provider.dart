import 'package:flutter/material.dart';

class NoticiasProvider with ChangeNotifier {
  bool _cargando = false;
  bool get getCargando => _cargando;
  set setCargando(bool dato) {
    _cargando = dato;
    notifyListeners();
  }

  bool _listViewSeMueve = true;
  bool get getListViewSeMueve => _listViewSeMueve;
  set setListViewSeMueve(bool dato) {
    _listViewSeMueve = dato;
    notifyListeners();
  }

  final List<PageController> _pageControllerList = [
    PageController(),
    PageController(),
    PageController()
  ];

  List<PageController> get getPageControllerList => _pageControllerList;

  addPageControllerToList(PageController dato) {
    _pageControllerList.add(dato);
    print('Se agrego');
  }

  final List<int> _slotPageViewList = [0, 0, 0];
  List<int> get getSlotPageView => _slotPageViewList;
  setSlotPageViewList({required int slot, required int valor}) {
    _slotPageViewList[slot] = valor;
    print('Aca seteado $_slotPageViewList');
  }

  addSlotPageViewList(int dato) {
    _slotPageViewList.add(dato);
    print('se a;adio a la lista $dato');
  }

  int _slotController = 0;
  int get getSlotController => _slotController;
  set setSlotController(int dato) {
    _slotController = dato;
    print('Seteo controller seleccionado');
  }

  nextPageController() {
    // _slotPageView = _slotPageView + 1;

    // _pageController.animateToPage(_slotPageView,
    //     duration: const Duration(milliseconds: 200), curve: Curves.easeIn);

    // _pageController.nextPage(
    //     duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
