import 'package:flutter/material.dart';

import '../../../../data/repositories/firebase_noticias_repo_impl/firebase_noticias_repo_impl.dart';
import '../../../../domain/entities/entities.dart';

// typedef NoticiasStateCallback = Future<NoticiaPropiaEntitie> Function();

class NoticiasPropiasProvider with ChangeNotifier {
  final FirebaseNoticiasRepoImpl _firebaseNoticiasRepoImpl;
  NoticiasPropiasProvider(this._firebaseNoticiasRepoImpl);

  List<NoticiaPropiaEntitie>? _noticiaPropiaEntitie;
  List<NoticiaPropiaEntitie>? get getNoticiasCargadas => _noticiaPropiaEntitie;
  set setNoticiasCargadas(List<NoticiaPropiaEntitie>? noticias) {
    _noticiaPropiaEntitie = noticias;
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

  Future<List<NoticiaPropiaEntitie>> getAllNoticias() async {
    final List<NoticiaPropiaEntitie> noticias =
        await _firebaseNoticiasRepoImpl.getNoticiasPropias();
    setNoticiasCargadas = noticias;
    return getNoticiasCargadas!;
  }
}
