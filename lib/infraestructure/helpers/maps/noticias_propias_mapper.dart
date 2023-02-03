import 'package:kyari_app/domain/models/Noticias_Propias/modelo_noticia.dart';
import 'package:kyari_app/infraestructure/helpers/common/base_mapper.dart';

class NoticiaMapper implements BaseMapper<NoticiaPropiaObjeto> {
  @override
  fromMap(Map<String, dynamic> json) {
    final List<String> urlImagenesTEMPORAL = [];

    json["urlImagenes"].forEach(
      (key, value) {
        print('Esta es la key: $key  y el valo: $value');
        urlImagenesTEMPORAL.add(value);
      },
    );

    return NoticiaPropiaObjeto(
      titulo: json["titulo"],
      urlImagenes: urlImagenesTEMPORAL,
      texto: json["texto"],
      fuente: json["fuente"],
      idFirebase: json["idFirebase"],
    );
  }

  @override
  fromMapAll(Map<String, dynamic> json) {
    final List<NoticiaPropiaObjeto> noticiasMapper = [];

    json.forEach((key, value) {
      NoticiaPropiaObjeto tempNoticia = fromMap(value);
      tempNoticia.idFirebase = key;
      noticiasMapper.add(tempNoticia);
    });
    return noticiasMapper;
  }
}
