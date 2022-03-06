import 'package:mysql1/mysql1.dart';

class Database {
  Future<MySqlConnection> openConn() async {
    var connection = MySqlConnection.connect(ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'milan1899',
        db: 'db_cities'));

    await Future.delayed(Duration(milliseconds: 100));
    return connection;
  }
}
