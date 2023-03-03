import 'package:flutter/material.dart';
import 'package:kyari_app/domain/models/models.dart';

class TwitterSDKKyary with ChangeNotifier {
  List<TweetKyaryObjeto> _tweetsKyary = [];
  List<TweetKyaryObjeto>? get getTweetsKyary => _tweetsKyary;
  set setTweetsKyary(List<TweetKyaryObjeto> dato) {
    _tweetsKyary = List<TweetKyaryObjeto>.from(dato);
  }

  bool _listViewSeMueve = true;
  bool get getListViewSeMueve => _listViewSeMueve;
  set setListViewSeMueve(bool dato) {
    _listViewSeMueve = dato;
    notifyListeners();
  }

  bool _loadingMoreTweets = false;
  bool get getLoadingMoreTweets => _loadingMoreTweets;
  set setLoadingMoreTweets(bool dato) {
    _loadingMoreTweets = dato;
    notifyListeners();
  }

  // TweetsKyaryApi instanciaTweetsKyaryApi = TweetsKyaryApi();

  late List<PageController> _pageControllerList = [];
  // List.generate(10, (index) => PageController());

  // List<PageController> pageControllerList = List.generate(
  //     instanciaTweetsKyaryApi.getListaTweets.length,
  //     (index) => PageController());

  List<PageController> get getPageControllerList => _pageControllerList;
  set setPageControllerList(List<PageController> dato) {
    _pageControllerList = dato;
    // notifyListeners();
  }

  late List<int> _slotPageViewList;
  // final List<int> _slotPageViewList = List.generate(10, (index) => 0);

  List<int> get getSlotPageView => _slotPageViewList;
  setSlotPageViewList({required int slot, required int valor}) {
    _slotPageViewList[slot] = valor;
    print('Aca seteado $_slotPageViewList');
  }

  set setCantidadSlotsPageView(int cantidadSlots) {
    _slotPageViewList = List.generate(cantidadSlots, (index) => 0);
  }
}
