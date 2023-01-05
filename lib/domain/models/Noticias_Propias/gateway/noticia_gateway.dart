import 'package:kyari_app/domain/models/Noticias_Propias/noticia.dart';

abstract class NoticiaPropiaGateway {
  Future<NoticiaPropia> getByID(String id);
  Future<List<NoticiaPropia>> getAllNoticias();
}
