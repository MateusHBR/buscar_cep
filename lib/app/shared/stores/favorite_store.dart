import 'package:mobx/mobx.dart';
import 'package:pesquisa_cep/app/shared/models/cep_model.dart';
import 'package:pesquisa_cep/app/shared/repositories/local_storage/local_storage_shared.dart';
part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  final LocalStorageShared _shared;

  _FavoriteStoreBase(this._shared) {
    initBase();
  }

  @observable
  ObservableList<CepModel> favoriteList = <CepModel>[].asObservable();

  @action
  initBase() async {
    List<CepModel> localList = await _shared.getList();

    if (localList == null) {
      favoriteList = <CepModel>[].asObservable();
    } else {
      favoriteList = localList.asObservable();
    }
  }

  @action
  changeList(CepModel cep) {
    var index = favoriteList.indexWhere((item) => item.cep == cep.cep);

    if (index >= 0) {
      favoriteList.removeAt(index);
    } else {
      favoriteList.add(cep);
    }
    _shared.putList(favoriteList);
  }
}
