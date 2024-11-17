
import 'package:flutter/foundation.dart';
import 'package:saga_kart/authentication/model/auth_model.dart';
import 'package:saga_kart/authentication/service/auth_service.dart';
import 'package:saga_kart/core/app_util.dart';
import 'package:saga_kart/core/storage_helper.dart';

class AuthProvider extends ChangeNotifier {
  AuthService authService;


  AuthProvider(this.authService);

  Future signUp(User user) async {
    try {
      bool success = await authService.signUp(user);
      notifyListeners();
      if (success) {
        AppUtil.showTost('Account Created successfully');
      }
    } catch (e) {
      AppUtil.showTost(e.toString());
    }
  }

  Future<bool> logIn(User user) async {
    try {
      String? token = await authService.logIn(user);

      if (token.isNotEmpty) {
        await StorageHelper.saveToken(token);
        notifyListeners();
        AppUtil.showTost('Logged in successfully.');
        return true;
      } else {
        AppUtil.showTost('Invalid username or password.');
        return false;
      }
    } catch (e) {
      AppUtil.showTost('Error: ${e.toString()}');

      return false;
    }
  }
}
