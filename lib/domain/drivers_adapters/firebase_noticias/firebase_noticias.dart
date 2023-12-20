import '../../entities/entities.dart';

abstract class FirebaseNoticias {
  Future<List<NoticiaPropiaEntitie>> getAllNoticias();
}
