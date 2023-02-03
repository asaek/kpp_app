import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kyari_app/domain/models/Noticias_Propias/gateway/noticia_gateway.dart';
import 'package:kyari_app/domain/models/Noticias_Propias/modelo_noticia.dart';
import 'package:kyari_app/infraestructure/helpers/maps/noticias_propias_mapper.dart';

class NoticiaPropiaApi extends NoticiaPropiaGateway {
  final String _baseURL = 'kyary-app-default-rtdb.firebaseio.com';
  final NoticiaMapper _noticiaMapper = NoticiaMapper();

  @override
  Future<List<NoticiaPropiaObjeto>> getAllNoticias() async {
    final url = Uri.https(_baseURL, 'noticiasPropias.json');
    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      final Map<String, dynamic> jsonRaw = json.decode(resp.body);
      print('Esta es la propiedad:  ${jsonRaw['asaekKpp']['urlImagenes']}');

      return _noticiaMapper.fromMapAll(jsonRaw);
    }

    throw Exception('No fue posible conectar a la URL');
  }

  @override
  Future<NoticiaPropiaObjeto> getByID(String id) {
    throw UnimplementedError();
  }
}
