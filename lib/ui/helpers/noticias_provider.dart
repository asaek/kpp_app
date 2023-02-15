import 'package:flutter/material.dart';
import 'package:kyari_app/domain/models/models.dart';

class NoticiasProvider with ChangeNotifier {
  List<NoticiaPropiaObjeto> _noticiasCargadas = [];
  List<NoticiaPropiaObjeto> get getNoticiasCargadas => _noticiasCargadas;
  set setNoticiasCargadas(List<NoticiaPropiaObjeto> dato) {
    _noticiasCargadas = dato;
    // notifyListeners();
  }

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
    PageController(),
    PageController(),
  ];

  List<PageController> get getPageControllerList => _pageControllerList;

  final List<int> _slotPageViewList = [0, 0, 0, 0];
  List<int> get getSlotPageView => _slotPageViewList;
  setSlotPageViewList({required int slot, required int valor}) {
    _slotPageViewList[slot] = valor;
    print('Aca seteado $_slotPageViewList');
  }

  // addSlotPageViewList(int dato) {
  //   _slotPageViewList.add(dato);
  //   print('se a;adio a la lista $dato');
  // }

  int _slotController = 0;
  int get getSlotController => _slotController;
  set setSlotController(int dato) {
    _slotController = dato;
    print('Seteo controller seleccionado');
  }
}
