import 'package:kyari_app/domain/models/Noticias_Propias/gateway/noticia_gateway.dart';
import 'package:kyari_app/domain/models/models.dart';

class GetNoticiaCase {
  final NoticiaPropiaGateway _noticiaPropia;
  GetNoticiaCase(this._noticiaPropia);

  Future<NoticiaPropia> getNoticiaByIDUseCaase(String id) async {
    return _noticiaPropia.getByID(id);
  }

  Future<List<NoticiaPropia>> getAllNoticiaUseCase() async {
    return _noticiaPropia.getAllNoticias();
  }
}
