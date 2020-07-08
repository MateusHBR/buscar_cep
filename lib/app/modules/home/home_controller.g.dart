// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??= Computed<bool>(() => super.isEmpty,
          name: '_HomeControllerBase.isEmpty'))
      .value;
  Computed<bool> _$canClickComputed;

  @override
  bool get canClick =>
      (_$canClickComputed ??= Computed<bool>(() => super.canClick,
              name: '_HomeControllerBase.canClick'))
          .value;

  final _$firstTimeAtom = Atom(name: '_HomeControllerBase.firstTime');

  @override
  bool get firstTime {
    _$firstTimeAtom.reportRead();
    return super.firstTime;
  }

  @override
  set firstTime(bool value) {
    _$firstTimeAtom.reportWrite(value, super.firstTime, () {
      super.firstTime = value;
    });
  }

  final _$cepFutureAtom = Atom(name: '_HomeControllerBase.cepFuture');

  @override
  ObservableFuture<List<CepModel>> get cepFuture {
    _$cepFutureAtom.reportRead();
    return super.cepFuture;
  }

  @override
  set cepFuture(ObservableFuture<List<CepModel>> value) {
    _$cepFutureAtom.reportWrite(value, super.cepFuture, () {
      super.cepFuture = value;
    });
  }

  final _$cepListAtom = Atom(name: '_HomeControllerBase.cepList');

  @override
  ObservableList<CepModel> get cepList {
    _$cepListAtom.reportRead();
    return super.cepList;
  }

  @override
  set cepList(ObservableList<CepModel> value) {
    _$cepListAtom.reportWrite(value, super.cepList, () {
      super.cepList = value;
    });
  }

  final _$cidadeAtom = Atom(name: '_HomeControllerBase.cidade');

  @override
  String get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  final _$ruaAtom = Atom(name: '_HomeControllerBase.rua');

  @override
  String get rua {
    _$ruaAtom.reportRead();
    return super.rua;
  }

  @override
  set rua(String value) {
    _$ruaAtom.reportWrite(value, super.rua, () {
      super.rua = value;
    });
  }

  final _$ufAtom = Atom(name: '_HomeControllerBase.uf');

  @override
  String get uf {
    _$ufAtom.reportRead();
    return super.uf;
  }

  @override
  set uf(String value) {
    _$ufAtom.reportWrite(value, super.uf, () {
      super.uf = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setCidade(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setCidade');
    try {
      return super.setCidade(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRua(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setRua');
    try {
      return super.setRua(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUf(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setUf');
    try {
      return super.setUf(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchData() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.fetchData');
    try {
      return super.fetchData();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearContext() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.clearContext');
    try {
      return super.clearContext();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearCepList() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.clearCepList');
    try {
      return super.clearCepList();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstTime: ${firstTime},
cepFuture: ${cepFuture},
cepList: ${cepList},
cidade: ${cidade},
rua: ${rua},
uf: ${uf},
isEmpty: ${isEmpty},
canClick: ${canClick}
    ''';
  }
}
