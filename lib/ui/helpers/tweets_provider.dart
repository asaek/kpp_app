import 'package:flutter/material.dart';
import 'package:kyari_app/domain/models/models.dart';

class TwitterSDKKyary with ChangeNotifier {
  List<TweetKyaryObjeto> _tweetsKyary = [];
  List<TweetKyaryObjeto>? get getTweetsKyary => _tweetsKyary;
  set setTweetsKyary(List<TweetKyaryObjeto> dato) {
    _tweetsKyary = List<TweetKyaryObjeto>.from(dato);
  }

  agregandoTweetsKyary(List<TweetKyaryObjeto> dato) {
    _tweetsKyary.addAll(dato);
    notifyListeners();
  }

  // TweetsKyaryApi instanciaTweetsKyaryApi = TweetsKyaryApi();

  late List<PageController> _pageControllerList = [];
  // List<PageController> _pageControllerList =
  //     List.generate(10, (index) => PageController());

  List<PageController> get getPageControllerList => _pageControllerList;
  set setPageControllerList(int dato) {
    _pageControllerList = List.generate(dato, (index) => PageController());
    // notifyListeners();
  }

  late List<int> _slotPageViewList;
  // final List<int> _slotPageViewList = List.generate(10, (index) => 0);

  List<int> get getSlotPageView => _slotPageViewList;
  setSlotPageViewList({required int slot, required int valor}) {
    _slotPageViewList[slot] = valor;
    // print('Aca seteado $_slotPageViewList');
  }

  set setCantidadSlotsPageView(int listaSlots) {
    _slotPageViewList = List.generate(listaSlots, (index) => 0);
  }
}
