import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rimotech/constants/colors.dart';
import 'package:rimotech/constants/size_config.dart';
import 'package:rimotech/util/helpers/helpers.dart';

class CarouselWidget extends StatefulWidget {
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  bool isvisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kheight(20, context),
      width: kwidth(90, context),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.couroselColor,
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {
                  if (isvisible == true) {
                    setState(() {
                      isvisible = false;
                    });
                  } else {
                    setState(() {
                      isvisible = true;
                    });
                  }
                },
                icon: Icon(
                  isvisible ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                  color: AppColors.white,
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Primary Wallet',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14)),
                  customYMargin(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('NGN',
                          style: TextStyle(
                              color: Colors.white24,
                              fontWeight: FontWeight.w600,
                              fontSize: 22)),
                      customXMargin(5),
                      isvisible
                          ? Text(
                              '200,000',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22),
                            )
                          : Text('*****',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                    ],
                  ),
                  customYMargin(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/add_icon.svg'),
                      customXMargin(5),
                      Text(
                        'Add Cash',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CarouselBlankWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kheight(20, context),
      width: kwidth(90, context),
      decoration: BoxDecoration(
          color: AppColors.couroselColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
