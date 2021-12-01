import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rimotech/constants/colors.dart';
import 'package:rimotech/constants/size_config.dart';
import 'package:rimotech/util/helpers/helpers.dart';

class GridButton extends StatelessWidget {
  final GridItems data;
  GridButton({this.data});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showToast(data.title);
      },
      child: Container(
        height: 100,
        width: kwidth(45, context),
        padding: EdgeInsets.only(left: 14, top: 10, bottom: 20, right: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.gridButtonColor,
            boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(data.icon)),
            customYMargin(5),
            Container(
              width: 80,
              child: Text(
                data.title,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    height: 1.3,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GridItems {
  final String title;
  final String icon;
  GridItems({this.icon, this.title});
}
