import 'package:flutter/material.dart';
import 'package:kyari_app/data/models/models.dart';

class BlogPropioProvider with ChangeNotifier {
  List<NoticiaPropiaObjetoModel> _noticiasCargadas = [];
  List<NoticiaPropiaObjetoModel> get getNoticiasCargadas => _noticiasCargadas;
  set setNoticiasCargadas(List<NoticiaPropiaObjetoModel> dato) {
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

  late List<PageController> _pageControllerList;
  List<PageController> get getPageControllerList => _pageControllerList;
  set setPageControllerList(int cantidadControllerList) {
    _pageControllerList =
        List.generate(cantidadControllerList, (index) => PageController());
  }

  late List<int> _slotPageViewList;
  List<int> get getSlotPageView => _slotPageViewList;
  setSlotPageViewList({required int slot, required int valor}) {
    _slotPageViewList[slot] = valor;
  }

  set setCatidadSlotsPageViewList(int listaSlots) {
    _slotPageViewList = List.generate(listaSlots, (index) => 0);
  }

  // addSlotPageViewList(int dato) {
  //   _slotPageViewList.add(dato);
  //   print('se a;adio a la lista $dato');
  // }

  // int _slotController = 0;
  // int get getSlotController => _slotController;
  // set setSlotController(int dato) {
  //   _slotController = dato;
  //   print('Seteo controller seleccionado');
  // }
}
