import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {

  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;


  DatabaseHelper._init();



  Future<Database> get database async {

    if (_database != null) return _database!;

    _database = await _initDB('paribarik_khoroch.db');

    return _database!;

  }



  Future<Database> _initDB(String filePath) async {

    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);


    return await openDatabase(

      path,

      version: 1,

      onCreate: _createDB,

    );

  }



  Future _createDB(Database db, int version) async {


    await db.execute('''

    CREATE TABLE expenses (

      id INTEGER PRIMARY KEY AUTOINCREMENT,

      name TEXT,

      category TEXT,

      amount REAL,

      note TEXT,

      date TEXT

    )

    ''');


  }




  Future<int> addExpense(Map<String,dynamic> expense) async {


    final db = await instance.database;


    return await db.insert(

      'expenses',

      expense,

    );


  }




  Future<List<Map<String,dynamic>>> getExpenses() async {


    final db = await instance.database;


    return await db.query(

      'expenses',

      orderBy: 'id DESC',

    );


  }

}
