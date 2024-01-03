import '../../../domain/entities/entities.dart';
import '../../../domain/mappers/base_mapper.dart';

class NoticiaMapper implements BaseMapper<NoticiaPropiaEntitie> {
  @override
  noticiasMapper(Map<String, dynamic> json) {
    final List<NoticiaPropiaEntitie> noticiasMapper = [];

    json.forEach((key, value) {
      NoticiaPropiaEntitie tempNoticia = noticiaMapper(value);
      tempNoticia.idFirebase = key;
      noticiasMapper.add(tempNoticia);
    });

    return noticiasMapper;
  }

  @override
  noticiaMapper(Map<String, dynamic> json) {
    final List<String> urlImagenesTEMPORAL = [];

    // ? Se esta mapeando la lista de imagenesTemporal
    json["urlImagenes"].forEach(
      (key, value) {
        urlImagenesTEMPORAL.add(value);
      },
    );

    return NoticiaPropiaEntitie(
      titulo: json["titulo"],
      urlImagenes: urlImagenesTEMPORAL,
      texto: json["texto"],
      fuente: json["fuente"],
      idFirebase: json["idFirebase"],
    );
  }
}
