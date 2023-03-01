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

  final List<PageController> _pageControllerList =
      List.generate(10, (index) => PageController());

  List<PageController> get getPageControllerList => _pageControllerList;

  final List<int> _slotPageViewList = List.generate(10, (index) => 0);

  List<int> get getSlotPageView => _slotPageViewList;
  setSlotPageViewList({required int slot, required int valor}) {
    _slotPageViewList[slot] = valor;
    print('Aca seteado $_slotPageViewList');
  }
}
