import 'package:provider/provider.dart';

import '../../../../data/driver_adapters_impl/firebase_noticias_propias_impl/noticias_propias_api_impl.dart';
import '../../../../data/repositories/firebase_noticias_repo_impl/firebase_noticias_repo_impl.dart';

final Provider<FirebaseNoticiasRepoImpl> noticiasPropiasProvider =
    Provider(create: (_) {
  return FirebaseNoticiasRepoImpl(NoticiaPropiaApi());
});
