import 'package:path/path.dart';
import 'package:sandwichy/models/meal_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _db;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'meals.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE meals (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            imageUrl TEXT,
            rate REAL,
            time TEXT
          )
        ''');
        print("________Database opened____________");
      },
    );

  }
/*
  Future<Database> initDatabase()async{
    final path=join(await getDatabasesPath(),'databaseName.dp');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db,version)async{
        await db.execute('''
         CREATE TABLE tableName(
         id INT,
         url TEXT,
         time TEXT,
         )  
        ''');
        print("object");
      }
    );

  }

  Future<int> addMealNew(MealModel mealModel)async{
    final db=await database;
    return await db.insert('tableName', mealModel.toMap(),);
    /*
    insert(String table, Map<String, Object?> values,)
     */
  }

  Future <List<MealModel>> getMeals()async{
    final db=await database;
    final List<Map<String,dynamic>>maps=await db.query('tableName');
    return maps.map((meal){
      return MealModel.fromMap(meal);
    }).toList();

  }

 */

  Future<int> addMeal(MealModel meal) async {
    final db = await database;
    return await db.insert('meals', meal.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<MealModel>> getAllMeals() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('meals');
    return maps.map((map) => MealModel.fromMap(map)).toList();
  }

  Future<int> updateMeal(MealModel meal) async {
    final db = await database;
    return await db.update(
      'meals',
      meal.toMap(),
      where: 'id = ?',
      whereArgs: [meal.id],
    );
  }

  Future<int> deleteMealById(int id) async {
    final db = await database;
    /*
    db.rawDelete('''
    Delete from tableName
    where 'id' =$id
    ''');
    */
    return await db.delete('meals', where: 'id = ?', whereArgs: [id]);
  }
}




