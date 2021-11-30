import 'package:rimotech/core/models/error_model.dart';
import 'package:rimotech/core/models/login.dart';
import 'package:rimotech/core/models/success_model.dart';
import 'package:rimotech/util/helpers/helpers.dart';
import 'package:rimotech/util/http/paths.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'index.dart';

class AuthenticationService {
  login(Login payload) async {
    try {
      final result = await http.post(Paths.sign_in, payload.toJson());
      if (result is ErrorModel) {
        print("ERROR::: ${result.error}");
        return ErrorModel(result.error);
      } else {
        print("RESULT::: ${result.data}");
        SharedPreferences prefs;
        prefs = await SharedPreferences.getInstance();
        showToast('Successfully logged in');
        // await prefs.setString('password', payload.password);
        // await prefs.setString('id', _currentUser.id.toString());
        // var currentUserJsonStr = json.encode(_currentUser);
        // await prefs.setString('profile', currentUserJsonStr);
        // print('Sector' + _currentUser.email);
        return SuccessModel(result.data);
      }
    } catch (e) {
      print(e.toString());
      return ErrorModel('Login failed, try again.');
    }
  }
}
