import 'package:kyari_app/domain/models/Noticias_Propias/noticia.dart';
import 'package:kyari_app/infraestructure/helpers/common/base_mapper.dart';

class NoticiaMapper implements BaseMapper<NoticiaPropia> {
  @override
  fromMap(Map<String, dynamic> json) => NoticiaPropia(
        titulo: json["titulo"],
        urlImagenes: List<String>.from(json["url_imagenes"].map((x) => x)),
        texto: json["texto"],
        fuente: json["fuente"],
        idFirebase: json["idFirebase"],
      );
}
