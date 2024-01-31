import 'package:flutter/material.dart';
import 'package:kyari_app/data/repositories/tweets_kyary_repo_impl/tweets_kyary_repo_impl.dart';
import 'package:kyari_app/domain/entities/tweet_entitie/tweet_entitie.dart';

class TwitterKyaryProvider with ChangeNotifier {
  final TweetsKyaryRepoImpl _tweetsKyaryRepoImpl;
  TwitterKyaryProvider(this._tweetsKyaryRepoImpl);

  List<TweetKyaryEntitie> _tweetsKyary = [];
  List<TweetKyaryEntitie>? get getTweetsKyary => _tweetsKyary;
  set setTweetsKyary(List<TweetKyaryEntitie> dato) {
    _tweetsKyary = List<TweetKyaryEntitie>.from(dato);
  }

  agregandoTweetsKyary(List<TweetKyaryEntitie> dato) {
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

  Future<List<TweetKyaryEntitie>> getAllTweetsKyary() async {
    final List<TweetKyaryEntitie> tweets =
        await _tweetsKyaryRepoImpl.getTweetsKyary();
    setTweetsKyary = tweets;
    return tweets;
  }
}

// ! ver como consumir la API de twitter no me deja conectarme a ella