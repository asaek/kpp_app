import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';

typedef NoticiasStateCallback = Future<NoticiasAndErrors> Function({int page});

class NoticiasPropiasProvider with ChangeNotifier {
  Future<List<NoticiaPropiaEntitie>> getAllNoticias() async {
    // final noticias = await _firebaseNoticiasRepoImpl.getAllNoticias();
    // return noticias;
    return [];
  }
}


// ! Reevisar como voy a hacer el llamado del repository y de driver_adaptar 