import 'package:every_hour/util/app_database.dart';
import 'package:sembast/sembast.dart';

import 'fruit.dart';

class FruitDao {
  static const String FRUIT_STORE_NAME = 'fruits';
  final _fruitStore = intMapStoreFactory.store(FRUIT_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Fruit fruit) async {
    await _fruitStore.add(await _db, fruit.toMap());
  }

  Future update(Fruit fruit) async {
    final finder = Finder(filter: Filter.byKey(fruit.id));
    await _fruitStore.update(
      await _db,
      fruit.toMap(),
      finder: finder,
    );
  }

  Future delete(Fruit fruit) async {
    final finder = Finder(filter: Filter.byKey(fruit.id));
    await _fruitStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Fruit>> getAllStoredByName() async {
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);
    final recordSnapshots = await _fruitStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final fruit = Fruit.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      fruit.id = snapshot.key;
      return fruit;
    }).toList();
  }
}
