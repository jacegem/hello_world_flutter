// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FruitStore on _FruitStore, Store {
  final _$fruitAtom = Atom(name: '_FruitStore.fruit');

  @override
  Fruit get fruit {
    _$fruitAtom.context.enforceReadPolicy(_$fruitAtom);
    _$fruitAtom.reportObserved();
    return super.fruit;
  }

  @override
  set fruit(Fruit value) {
    _$fruitAtom.context.conditionallyRunInAction(() {
      super.fruit = value;
      _$fruitAtom.reportChanged();
    }, _$fruitAtom, name: '${_$fruitAtom.name}_set');
  }

  final _$fruitListAtom = Atom(name: '_FruitStore.fruitList');

  @override
  List<Fruit> get fruitList {
    _$fruitListAtom.context.enforceReadPolicy(_$fruitListAtom);
    _$fruitListAtom.reportObserved();
    return super.fruitList;
  }

  @override
  set fruitList(List<Fruit> value) {
    _$fruitListAtom.context.conditionallyRunInAction(() {
      super.fruitList = value;
      _$fruitListAtom.reportChanged();
    }, _$fruitListAtom, name: '${_$fruitListAtom.name}_set');
  }

  final _$insertAsyncAction = AsyncAction('insert');

  @override
  Future insert(dynamic name, dynamic isSweet) {
    return _$insertAsyncAction.run(() => super.insert(name, isSweet));
  }
}
