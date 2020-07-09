import 'package:pesquisa_cep/app/shared/constants/url.dart';
import 'package:pesquisa_cep/app/shared/repositories/local_storage/local_storage_shared.dart';
import 'package:pesquisa_cep/app/shared/stores/favorite_store.dart';

import 'pages/favorites/favorites_controller.dart';
import 'start_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'start_page.dart';
import './submodules/home/home_module.dart';

class StartModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FavoritesController(i.get<FavoriteStore>())),
        Bind((i) => StartController()),
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
        Bind((i) => FavoriteStore(i.get<LocalStorageShared>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => StartPage()),
        Router("/home", module: HomeModule()),
      ];

  static Inject get to => Inject<StartModule>.of();
}
