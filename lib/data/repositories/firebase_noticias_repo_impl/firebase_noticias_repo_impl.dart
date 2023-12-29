import 'package:kyari_app/domain/drivers_adapters/drivers_adapters.dart';
import 'package:kyari_app/domain/entities/noticia_propia_entitie/noticia_propia_entitie.dart';

class FirebaseNoticiasRepoImpl implements FirebaseNoticias {
  final FirebaseNoticias _firebaseNoticias;
  FirebaseNoticiasRepoImpl(this._firebaseNoticias);

  @override
  Future<List<NoticiaPropiaEntitie>> getAllNoticias() {
    return _firebaseNoticias.getAllNoticias();
  }
}
