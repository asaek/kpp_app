import 'package:kyari_app/domain/use_cases/Noticias_Propias/get_noticias_use_case.dart';
import 'package:kyari_app/infraestructure/driver_adapters/firebase_noticias_propias/noticias_propias_api.dart';

class UseCaseConfig {
  late GetNoticiaCase getAlbumUseCase;
  late NoticiaPropiaApi _noticiaPropiaApi;

  UseCaseConfig() {
    _noticiaPropiaApi = NoticiaPropiaApi();
    getAlbumUseCase = GetNoticiaCase(_noticiaPropiaApi);
  }
}
