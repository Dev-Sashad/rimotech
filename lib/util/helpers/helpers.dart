import 'package:another_flushbar/flushbar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:rimotech/constants/colors.dart';

customYMargin(double value) {
  return SizedBox(height: value);
}

customXMargin(double value) {
  return SizedBox(width: value);
}

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      timeInSecForIosWeb: 5,
      backgroundColor: AppColors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

showFlushBar({String title = '', String message, BuildContext context}) {
  Flushbar(
    backgroundColor: AppColors.grey,
    titleColor: AppColors.primaryColor,
    title: title,
    flushbarPosition: FlushbarPosition.TOP,
    messageColor: AppColors.primaryColor,
    message: message,
    duration: Duration(seconds: 3),
  ).show(context);
}

showErrorToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      webBgColor: "#e74c3c",
      timeInSecForIosWeb: 5,
      // backgroundColor: AppColors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

String capitalize(val) {
  return "${val[0].toUpperCase()}${val.substring(1)}";
}

formatDate(value) {
  final df = new DateFormat('dd/MM/yyyy');
  return df.format(DateTime.parse(value));
}

formatDateTime(value) {
  final df = new DateFormat('d MMMM, y hh:mm a');
  return df.format(DateTime.parse(value));
}

class Status {
  static final sent = 'sent';
  static final delivered = 'delivered';
  static final read = 'read';
}

systemChrome() {
  return SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
}
