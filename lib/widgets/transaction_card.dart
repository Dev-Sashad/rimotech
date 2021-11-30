import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rimotech/constants/colors.dart';
import 'package:rimotech/util/helpers/helpers.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel data;
  TransactionCard({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      // width: kwidth(100, context),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              data.isbank
                  ? Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(40),
                          //shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/chidi_obi.png'))),
                    )
                  : Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          //   shape: BoxShape.circle,
                          color: Colors.grey[100]),
                      child: SvgPicture.asset(
                        'assets/images/bank_icon.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
              customXMargin(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(color: AppColors.black, fontSize: 12),
                  ),
                  customXMargin(10),
                  Text(
                    data.tag,
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data.debit
                    ? '-N${data.amount.toString()}'
                    : '+N${data.amount.toString()}',
                style: TextStyle(color: AppColors.primaryColor, fontSize: 12),
              ),
              customXMargin(10),
              Text(
                data.date,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TransactionModel {
  bool isbank;
  bool debit;
  String date;
  String title;
  String amount;
  String tag;
  TransactionModel(
      {this.amount, this.date, this.debit, this.isbank, this.tag, this.title});
}
