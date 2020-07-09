// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStoreBase, Store {
  final _$favoriteListAtom = Atom(name: '_FavoriteStoreBase.favoriteList');

  @override
  ObservableList<CepModel> get favoriteList {
    _$favoriteListAtom.reportRead();
    return super.favoriteList;
  }

  @override
  set favoriteList(ObservableList<CepModel> value) {
    _$favoriteListAtom.reportWrite(value, super.favoriteList, () {
      super.favoriteList = value;
    });
  }

  final _$initBaseAsyncAction = AsyncAction('_FavoriteStoreBase.initBase');

  @override
  Future initBase() {
    return _$initBaseAsyncAction.run(() => super.initBase());
  }

  final _$_FavoriteStoreBaseActionController =
      ActionController(name: '_FavoriteStoreBase');

  @override
  dynamic changeList(CepModel cep) {
    final _$actionInfo = _$_FavoriteStoreBaseActionController.startAction(
        name: '_FavoriteStoreBase.changeList');
    try {
      return super.changeList(cep);
    } finally {
      _$_FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoriteList: ${favoriteList}
    ''';
  }
}
