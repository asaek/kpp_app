import '../../entities/entities.dart';

abstract class NoticiaPropiaDriverAdapter {
  Future<List<NoticiaPropiaEntitie>> getAllNoticias();
}
