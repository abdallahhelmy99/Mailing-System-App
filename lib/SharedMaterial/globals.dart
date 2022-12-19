import 'package:mailing_system/dbHelper.dart';
import '../Classes/User.dart';

class globalVariables {
  static dbHelper helper = dbHelper();
  static List<User>? Users;


  static void readData() async{
    Users = await helper.readUsers();
  }

}