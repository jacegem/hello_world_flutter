import 'package:every_hour/model/fruit.dart';
import 'package:every_hour/model/fruite_dao.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'fruit_store.g.dart';

class FruitStore = _FruitStore with _$FruitStore;

abstract class _FruitStore with Store {
  FruitDao _fruitDao = FruitDao();

  @observable
  Fruit fruit;

  @observable
  List<Fruit> fruitList;

  @action
  insert(name, isSweet) async {
    fruit = Fruit(name: name, isSweet: isSweet);
    _fruitDao.insert(fruit);

    fruitList = await _fruitDao.getAllStoredByName();
  }
}
