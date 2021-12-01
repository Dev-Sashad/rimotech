import 'package:flutter/cupertino.dart';
import 'package:rimotech/screens/basemodel/base_model.dart';
import 'package:rimotech/screens/home/homepage.dart';

class MainHomepageViewModel extends BaseModel {
  // final NavigationService _navigationService = locator<NavigationService>();

  int _mainPageIndex = 0;
  int get mainPageIndex => _mainPageIndex;
  //TabController tabController;

  setMainPageIndex(int value) {
    _mainPageIndex = value;
    notifyListeners();
  }

  List<Widget> screens = [
    HomePage(),
    Container(),
    null,
    Container(),
    Container()
  ];

  List<NavigationItem> items = [
    NavigationItem(title: 'Home', icon: 'assets/images/home_icon.svg'),
    NavigationItem(
        title: 'Transactions', icon: 'assets/images/transactions_icon.svg'),
    NavigationItem(title: '', icon: 'assets/images/center_icon.svg'),
    NavigationItem(
        title: 'Settle card', icon: 'assets/images/settle_card_icon.svg'),
    NavigationItem(title: 'More', icon: 'assets/images/menu_icon.svg'),
  ];
}

class NavigationItem {
  final String title;
  final String icon;
  NavigationItem({this.title, this.icon});
}
