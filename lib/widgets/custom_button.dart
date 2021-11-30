import 'package:flutter/material.dart';
import 'package:rimotech/constants/colors.dart';
import 'package:rimotech/constants/size_config.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {@required this.title,
      this.onPressed,
      this.width,
      this.online = true,
      this.elevation = 2.0,
      this.margin = 10,
      this.borderRadius = 8.0,
      this.offlineColor = AppColors.grey,
      this.color = AppColors.primaryColor,
      this.borderSide = const BorderSide(
        width: 1.0,
        style: BorderStyle.solid,
        color: AppColors.primaryColor,
      ),
      this.textColor = Colors.white});

  final VoidCallback onPressed;
  final double width;
  final double elevation;
  final double margin;
  final double borderRadius;
  final String title;
  final Color color, offlineColor;
  final bool online;
  final BorderSide borderSide;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: online ? onPressed : () {},
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: kheight(margin, context)),
        //padding: EdgeInsets.symmetric(vertical: kheight(5, context)),
        height: 50,
        width: width ??
            kwidth(100, context), // If width is null, use size of screen
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            // color: online ? color : offlineColor,
            color: color),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
