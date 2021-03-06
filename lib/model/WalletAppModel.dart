import 'package:flutter/material.dart';

class WAWalkThroughModel {
  String? title;
  String? description;
  String? image;

  WAWalkThroughModel({this.title, this.description, this.image});
}

class WARecentPayeesModel {
  String? image;
  String? name;
  String? number;

  WARecentPayeesModel({this.image, this.name, this.number});
}

class WACardModel {
  String? image;
  String? balance;
  String? cardNumber;
  String? date;
  Color? color;

  WACardModel({this.image, this.balance, this.cardNumber, this.date, this.color});
}

class WAOperationsModel {
  String? image;
  Color? color;
  String? title;
  Widget? widget;

  WAOperationsModel({this.image, this.color, this.title, this.widget});
}

class WATransactionModel {
  String? productname;
  String? itemcore;
  String? price;
  String? quantity;
  String? amount;

  WATransactionModel({
      this.productname, this.itemcore, this.price, this.quantity, this.amount});
}

class WAProductModel {
  String? image;
  Color? color;
  String? title;
  String? name;
  String? time;
  String? balance;

  WAProductModel({this.image, this.color, this.title, this.name, this.time, this.balance});
}

class WABillPayModel {
  String? image;
  String? title;
  Color? color;

  WABillPayModel({this.image, this.title, this.color});
}

class WAOrganizationModel {
  String? image;
  String? title;
  String? subTitle;
  String? title2;
  String? subTitle2;
  String? title3;
  String? subTitle3;
  String? title4;
  String? subTitle4;
  String? title5;
  String? subTitle5;
  Color? color;

  WAOrganizationModel({this.image, this.title, this.subTitle, this.color});

  WAOrganizationModel.fromModel({
      this.title,
      this.subTitle,
      this.title2,
      this.subTitle2,
      this.title3,
      this.subTitle3,
      this.title4,
      this.subTitle4,
      this.title5,
      this.subTitle5});
}



class WAWalletUserModel {
  String? image;

  WAWalletUserModel({this.image});
}

class WAVoucherModel{
  String? image;
  String? discountText;
  String? title;
  String? expireTime;
  String? pointsText;

  WAVoucherModel({this.image, this.discountText, this.title, this.expireTime, this.pointsText});
}
