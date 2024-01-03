import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/drivers_adapters/drivers_adapters.dart';
import '../../../domain/entities/entities.dart';
import '../../helpers/noticias_propias/noticias_propias_mapper.dart';

class NoticiaPropiaApi implements FirebaseNoticias {
  final String _baseURL = 'kyary-app-default-rtdb.firebaseio.com';
  final NoticiaMapper _noticiaMapper = NoticiaMapper();

  @override
  Future<List<NoticiaPropiaEntitie>> getAllNoticias() async {
    final url = Uri.https(_baseURL, 'noticiasPropias.json');
    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      final Map<String, dynamic> jsonRaw = json.decode(resp.body);
      final List<NoticiaPropiaEntitie> noticias =
          _noticiaMapper.noticiasMapper(jsonRaw);
      return noticias;
    }

    throw Exception('No fue posible conectar a la URL');
  }
}
