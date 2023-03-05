import 'package:flutter/material.dart';

class ControlListViewProvider with ChangeNotifier {
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
}
