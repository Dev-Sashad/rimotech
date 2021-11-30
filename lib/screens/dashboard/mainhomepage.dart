import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rimotech/constants/colors.dart';
import 'package:stacked/stacked.dart';

import 'mainpageViewModel.dart';

class MainHomepage extends StatefulWidget {
  @override
  _MainHomepageState createState() => _MainHomepageState();
}

class _MainHomepageState extends State<MainHomepage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return ViewModelBuilder<MainHomepageViewModel>.reactive(
        viewModelBuilder: () => MainHomepageViewModel(),
        builder: (context, model, child) => WillPopScope(
              onWillPop: () {
                return null;
              },
              child: Scaffold(
                  backgroundColor: AppColors.white,
                  resizeToAvoidBottomInset: false,
                  body: model.screens[model.mainPageIndex],
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: AppColors.primaryColor,
                    unselectedItemColor: AppColors.black,
                    selectedFontSize: 14,
                    unselectedFontSize: 11,
                    //iconSize: 25,
                    currentIndex: model.mainPageIndex,
                    backgroundColor: Colors.white,
                    onTap: (value) {
                      model.setMainPageIndex(value);
                    },
                    items: [
                      BottomNavigationBarItem(
                        label: model.items.elementAt(0).title,
                        icon: SvgPicture.asset(
                          model.items.elementAt(0).icon,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          model.items.elementAt(1).icon,
                        ),
                        label: model.items.elementAt(1).title,
                      ),
                      BottomNavigationBarItem(
                        label: model.items.elementAt(2).title,
                        icon: SvgPicture.asset(
                          model.items.elementAt(2).icon,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          model.items.elementAt(3).icon,
                        ),
                        label: model.items.elementAt(3).title,
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          model.items.elementAt(4).icon,
                        ),
                        label: model.items.elementAt(4).title,
                      ),
                    ],
                  )),
            ));
  }
}
