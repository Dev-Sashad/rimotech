import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rimotech/util/locator.dart';
import 'package:rimotech/util/progressBarManager/progressModels.dart';
import 'package:rimotech/util/progressBarManager/progressService.dart';

class BaseModel extends ChangeNotifier {
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  final ProgressService _dialogService = locator<ProgressService>();
  ProgressResponse hh;

  bool _busy = false;
  bool get busy => _busy;

//This tells the app, the app is busy and dialog starts immediately and ends if it is equal to false
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
    if (value == true) {
      _dialogService.showDialog();
    } else {
      _dialogService.dialogComplete(hh);
    }
  }
}
