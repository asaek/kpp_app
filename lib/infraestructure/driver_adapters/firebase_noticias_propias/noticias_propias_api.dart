import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kyari_app/domain/models/Noticias_Propias/gateway/noticia_gateway.dart';
import 'package:kyari_app/domain/models/Noticias_Propias/noticia.dart';
import 'package:kyari_app/infraestructure/helpers/maps/noticias_propias_mapper.dart';

class NoticiaPropiaApi extends NoticiaPropiaGateway {
  final String _baseURL = 'kyary-app-default-rtdb.firebaseio.com';
  final NoticiaMapper _noticiaMapper = NoticiaMapper();

  @override
  Future<List<NoticiaPropia>> getAllNoticias() async {
    final url = Uri.https(_baseURL, '.json');
    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      return _noticiaMapper.fromMap(jsonDecode(resp.body));
    }

    throw Exception('no fue posible conectar a la URL');
  }

  @override
  Future<NoticiaPropia> getByID(String id) {
    throw UnimplementedError();
  }
}
