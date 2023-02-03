import 'package:kyari_app/domain/models/Noticias_Propias/modelo_noticia.dart';

abstract class NoticiaPropiaGateway {
  Future<NoticiaPropiaObjeto> getByID(String id);
  Future<List<NoticiaPropiaObjeto>> getAllNoticias();
}
