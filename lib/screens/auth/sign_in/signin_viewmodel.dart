import 'package:flutter/material.dart';
import 'package:rimotech/constants/route_names.dart';
import 'package:rimotech/core/models/error_model.dart';
import 'package:rimotech/core/models/login.dart';
import 'package:rimotech/core/models/success_model.dart';
import 'package:rimotech/core/services/authentication_services.dart';
import 'package:rimotech/core/services/navigation_service.dart';
import 'package:rimotech/screens/basemodel/base_model.dart';
import 'package:rimotech/util/helpers/helpers.dart';
import 'package:rimotech/util/locator.dart';

class SignInViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  signIn(Login login, BuildContext context) async {
    try {
      setBusy(true);
      var isConnected = await checkInternet();
      if (isConnected == false) {
        setBusy(false);
        showFlushBar(
            title: 'No Connection!',
            message: "Please check your internet connection!",
            context: context);
      } else {
        var result = await _authenticationService.login(login);
        if (result is ErrorModel) {
          setBusy(false);
          notifyListeners();
          showFlushBar(
              title: 'Error', message: 'invalid credentials', context: context);
          return ErrorModel(result.error);
        }
        if (result is SuccessModel) {
          setBusy(false);
          _navigationService.navigateReplacementTo(MainHomeViewRoute);
          notifyListeners();
        }
      }
    } catch (e) {
      setBusy(false);
      print(e);
      showFlushBar(
          title: 'Error',
          message: "There was an error signing in .. try again",
          context: context);
    }
  }

  void pop() {
    _navigationService.pop();
  }
}
