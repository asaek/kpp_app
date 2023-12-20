import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/drivers_adapters/drivers_adapters.dart';
import '../../../domain/entities/entities.dart';
import '../../helpers/mappers/noticias_propias_mapper.dart';

class NoticiaPropiaApi implements FirebaseNoticias {
  final String _baseURL = 'kyary-app-default-rtdb.firebaseio.com';
  final NoticiaMapper _noticiaMapper = NoticiaMapper();

  @override
  Future<List<NoticiaPropiaEntitie>> getAllNoticias() async {
    final url = Uri.https(_baseURL, 'noticiasPropias.json');
    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      final Map<String, dynamic> jsonRaw = json.decode(resp.body);
      // print('Esta es la propiedad:  ${jsonRaw['asaekKpp']['urlImagenes']}');

      return _noticiaMapper.fromMapAll(jsonRaw);
    }

    throw Exception('No fue posible conectar a la URL');
  }
}
