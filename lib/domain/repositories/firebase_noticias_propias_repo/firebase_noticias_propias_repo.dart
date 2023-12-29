import '../../entities/entities.dart';

abstract class FirebaseNoticiasPropiasRepo {
  Future<List<NoticiaPropiaEntitie>> getNoticiasPropias();
}
