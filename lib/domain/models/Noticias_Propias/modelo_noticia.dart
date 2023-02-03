// To parse this JSON data, do
//
//     final noticiaPropia = noticiaPropiaFromMap(jsonString);

import 'dart:convert';

class NoticiaPropiaObjeto {
  NoticiaPropiaObjeto({
    required this.titulo,
    required this.urlImagenes,
    required this.texto,
    required this.fuente,
    this.idFirebase,
  });

  String titulo;
  List<String>? urlImagenes;
  String texto;
  String fuente;
  String? idFirebase;

  // factory NoticiaPropia.fromJson(String str) =>
  //     NoticiaPropia.fromMapa(json.decode(str));

  String toJson() => json.encode(toMap());

  // factory NoticiaPropia.fromMapa(Map<String, dynamic> json) {
  //   final List<String> urlImagenesTEMPORAL = [];
  //   json["urlImagenes"].forEach(
  //     (key, value) {
  //       print('Esta es la key: $key  y el valo: $value');
  //       urlImagenesTEMPORAL.add(value);
  //     },
  //   );

  //   return NoticiaPropia(
  //     titulo: json["titulo"],
  //     idFirebase: json["idFirebase"],
  //     texto: json["texto"],
  //     fuente: json["fuente"],
  //     urlImagenes: urlImagenesTEMPORAL,
  //   );
  // }

  Map<String, dynamic> toMap() => {
        "titulo": titulo,
        "url_imagenes": List<dynamic>.from(urlImagenes!.map((x) => x)),
        "texto": texto,
        "fuente": fuente,
        "idFirebase": idFirebase,
      };
}
