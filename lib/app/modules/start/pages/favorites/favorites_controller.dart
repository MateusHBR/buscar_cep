import 'package:mobx/mobx.dart';
import 'package:pesquisa_cep/app/shared/models/cep_model.dart';
import 'package:pesquisa_cep/app/shared/stores/favorite_store.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesControllerBase with _$FavoritesController;

abstract class _FavoritesControllerBase with Store {
  final FavoriteStore _favoriteStore;

  _FavoritesControllerBase(this._favoriteStore);

  @computed
  List<CepModel> get favorites => _favoriteStore.favoriteList;

  addToList(CepModel cep, int index) {
    _favoriteStore.favoriteList[index] = cep.copyWith(favorite: !cep.favorite);
    _favoriteStore.changeList(cep);
  }
}
