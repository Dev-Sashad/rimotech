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
                    elevation: 0.0,
                    type: BottomNavigationBarType.shifting,
                    selectedItemColor: AppColors.primaryColor,
                    unselectedItemColor: AppColors.black,
                    unselectedLabelStyle:
                        TextStyle(fontSize: 10, color: AppColors.grey),
                    selectedLabelStyle:
                        TextStyle(fontSize: 13, color: AppColors.primaryColor),
                    selectedFontSize: 13,
                    unselectedFontSize: 10,
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
                          color: model.mainPageIndex == 0
                              ? AppColors.primaryColor
                              : Colors.grey[400],
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          model.items.elementAt(1).icon,
                          color: model.mainPageIndex == 1
                              ? AppColors.primaryColor
                              : Colors.grey[400],
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
                          color: model.mainPageIndex == 3
                              ? AppColors.primaryColor
                              : Colors.grey[400],
                        ),
                        label: model.items.elementAt(3).title,
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          model.items.elementAt(4).icon,
                          color: model.mainPageIndex == 4
                              ? AppColors.primaryColor
                              : Colors.grey[400],
                        ),
                        label: model.items.elementAt(4).title,
                      ),
                    ],
                  )),
            ));
  }
}
