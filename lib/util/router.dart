import 'package:flutter/material.dart';
import 'package:rimotech/constants/route_names.dart';
import 'package:rimotech/screens/auth/sign_in/signin_view.dart';
import 'package:rimotech/screens/dashboard/mainhomepage.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignInView(),
      );

    case MainHomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MainHomepage(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
