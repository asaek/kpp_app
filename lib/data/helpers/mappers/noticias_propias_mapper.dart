import 'package:kyari_app/data/models/Noticias_Propias/modelo_noticia.dart';

import '../../../domain/mappers/base_mapper.dart';

class NoticiaMapper implements BaseMapper<NoticiaPropiaObjetoModel> {
  @override
  fromMap(Map<String, dynamic> json) {
    final List<String> urlImagenesTEMPORAL = [];

    json["urlImagenes"].forEach(
      (key, value) {
        // print('Esta es la key: $key  y el valo: $value');
        urlImagenesTEMPORAL.add(value);
      },
    );

    return NoticiaPropiaObjetoModel(
      titulo: json["titulo"],
      urlImagenes: urlImagenesTEMPORAL,
      texto: json["texto"],
      fuente: json["fuente"],
      idFirebase: json["idFirebase"],
    );
  }

  @override
  fromMapAll(Map<String, dynamic> json) {
    final List<NoticiaPropiaObjetoModel> noticiasMapper = [];

    json.forEach((key, value) {
      NoticiaPropiaObjetoModel tempNoticia = fromMap(value);
      tempNoticia.idFirebase = key;
      noticiasMapper.add(tempNoticia);
    });
    return noticiasMapper;
  }
}
