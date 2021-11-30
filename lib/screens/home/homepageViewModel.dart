import 'package:flutter/material.dart';
import 'package:rimotech/screens/basemodel/base_model.dart';
import 'package:rimotech/widgets/carouselwidgets.dart';
import 'package:rimotech/widgets/grid_button.dart';
import 'package:rimotech/widgets/transaction_card.dart';

class HomepageViewModel extends BaseModel {
  String name = 'Sade';
  List<Widget> carouselImg = [
    CarouselWidget(),
    CarouselBlankWidget(),
    CarouselBlankWidget(),
  ];

  List gridList = [
    GridItems(icon: 'assets/images/send_money_icon.svg', title: 'Send Money'),
    GridItems(
        icon: 'assets/images/request_money_icon.svg', title: 'Request Money'),
    GridItems(
        icon: 'assets/images/create_wallet_icon.svg', title: 'Create a wallet'),
    GridItems(
        icon: 'assets/images/upgrade_account_icon.svg',
        title: 'Upgrade your account')
  ];

  List transaction = [
    TransactionModel(
        title: 'Transfer to Chidi Obi',
        tag: 'sent',
        date: 'Aug 12, 2020',
        amount: '150,000',
        isbank: false,
        debit: true),
    TransactionModel(
        title: 'Bank Transfer',
        tag: 'sent',
        date: 'Aug 12, 2020',
        amount: '150,000',
        isbank: true,
        debit: true)
  ];
}
