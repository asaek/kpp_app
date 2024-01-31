import 'package:kyari_app/domain/drivers_adapters/drivers_adapters.dart';
import 'package:kyari_app/domain/entities/noticia_propia_entitie/noticia_propia_entitie.dart';

import '../../../domain/repositories/firebase_noticias_propias_repo/firebase_noticias_propias_repo.dart';

class FirebaseNoticiasRepoImpl implements FirebaseNoticiasPropiasRepo {
  final NoticiaPropiaDriverAdapter _firebaseNoticias;
  FirebaseNoticiasRepoImpl(this._firebaseNoticias);

  // @override
  // Future<List<NoticiaPropiaEntitie>> getAllNoticias() {
  //   return _firebaseNoticias.getAllNoticias();
  // }

  @override
  Future<List<NoticiaPropiaEntitie>> getNoticiasPropias() {
    return _firebaseNoticias.getAllNoticias();
  }
}
