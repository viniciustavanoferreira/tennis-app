// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$strLoginAtom = Atom(name: '_AppStore.strLogin');

  @override
  String get strLogin {
    _$strLoginAtom.context.enforceReadPolicy(_$strLoginAtom);
    _$strLoginAtom.reportObserved();
    return super.strLogin;
  }

  @override
  set strLogin(String value) {
    _$strLoginAtom.context.conditionallyRunInAction(() {
      super.strLogin = value;
      _$strLoginAtom.reportChanged();
    }, _$strLoginAtom, name: '${_$strLoginAtom.name}_set');
  }

  final _$strPasswordAtom = Atom(name: '_AppStore.strPassword');

  @override
  String get strPassword {
    _$strPasswordAtom.context.enforceReadPolicy(_$strPasswordAtom);
    _$strPasswordAtom.reportObserved();
    return super.strPassword;
  }

  @override
  set strPassword(String value) {
    _$strPasswordAtom.context.conditionallyRunInAction(() {
      super.strPassword = value;
      _$strPasswordAtom.reportChanged();
    }, _$strPasswordAtom, name: '${_$strPasswordAtom.name}_set');
  }

  final _$strDisplayNameAtom = Atom(name: '_AppStore.strDisplayName');

  @override
  String get strDisplayName {
    _$strDisplayNameAtom.context.enforceReadPolicy(_$strDisplayNameAtom);
    _$strDisplayNameAtom.reportObserved();
    return super.strDisplayName;
  }

  @override
  set strDisplayName(String value) {
    _$strDisplayNameAtom.context.conditionallyRunInAction(() {
      super.strDisplayName = value;
      _$strDisplayNameAtom.reportChanged();
    }, _$strDisplayNameAtom, name: '${_$strDisplayNameAtom.name}_set');
  }

  final _$strLevelPlayAtom = Atom(name: '_AppStore.strLevelPlay');

  @override
  String get strLevelPlay {
    _$strLevelPlayAtom.context.enforceReadPolicy(_$strLevelPlayAtom);
    _$strLevelPlayAtom.reportObserved();
    return super.strLevelPlay;
  }

  @override
  set strLevelPlay(String value) {
    _$strLevelPlayAtom.context.conditionallyRunInAction(() {
      super.strLevelPlay = value;
      _$strLevelPlayAtom.reportChanged();
    }, _$strLevelPlayAtom, name: '${_$strLevelPlayAtom.name}_set');
  }

  final _$dblAddressLatAtom = Atom(name: '_AppStore.dblAddressLat');

  @override
  Double get dblAddressLat {
    _$dblAddressLatAtom.context.enforceReadPolicy(_$dblAddressLatAtom);
    _$dblAddressLatAtom.reportObserved();
    return super.dblAddressLat;
  }

  @override
  set dblAddressLat(Double value) {
    _$dblAddressLatAtom.context.conditionallyRunInAction(() {
      super.dblAddressLat = value;
      _$dblAddressLatAtom.reportChanged();
    }, _$dblAddressLatAtom, name: '${_$dblAddressLatAtom.name}_set');
  }

  final _$dblAddressLongAtom = Atom(name: '_AppStore.dblAddressLong');

  @override
  Double get dblAddressLong {
    _$dblAddressLongAtom.context.enforceReadPolicy(_$dblAddressLongAtom);
    _$dblAddressLongAtom.reportObserved();
    return super.dblAddressLong;
  }

  @override
  set dblAddressLong(Double value) {
    _$dblAddressLongAtom.context.conditionallyRunInAction(() {
      super.dblAddressLong = value;
      _$dblAddressLongAtom.reportChanged();
    }, _$dblAddressLongAtom, name: '${_$dblAddressLongAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'strLogin: ${strLogin.toString()},strPassword: ${strPassword.toString()},strDisplayName: ${strDisplayName.toString()},strLevelPlay: ${strLevelPlay.toString()},dblAddressLat: ${dblAddressLat.toString()},dblAddressLong: ${dblAddressLong.toString()}';
    return '{$string}';
  }
}
