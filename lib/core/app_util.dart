import 'package:fluttertoast/fluttertoast.dart';

class AppUtil{
  static void showTost(String msg){
    Fluttertoast.showToast(msg: msg);
  }
}