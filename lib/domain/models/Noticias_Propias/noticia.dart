// To parse this JSON data, do
//
//     final noticiaPropia = noticiaPropiaFromMap(jsonString);

class NoticiaPropia {
  NoticiaPropia({
    required this.titulo,
    required this.urlImagenes,
    required this.texto,
    required this.fuente,
    this.idFirebase,
  });

  String titulo;
  List<String> urlImagenes;
  String texto;
  String fuente;
  String? idFirebase;

  // factory NoticiaPropia.fromJson(String str) =>
  //     NoticiaPropia.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  // factory NoticiaPropia.fromMap(Map<String, dynamic> json) => NoticiaPropia(
  //       titulo: json["titulo"],
  //       urlImagenes: List<String>.from(json["url_imagenes"].map((x) => x)),
  //       texto: json["texto"],
  //       fuente: json["fuente"],
  //       idFirebase: json["idFirebase"],
  //     );

  // Map<String, dynamic> toMap() => {
  //       "titulo": titulo,
  //       "url_imagenes": List<dynamic>.from(urlImagenes.map((x) => x)),
  //       "texto": texto,
  //       "fuente": fuente,
  //       "idFirebase": idFirebase,
  //     };
}
