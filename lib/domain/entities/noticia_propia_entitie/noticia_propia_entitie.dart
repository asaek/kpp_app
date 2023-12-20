class NoticiaPropiaEntitie {
  NoticiaPropiaEntitie({
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
}
