import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/model/WalletAppModel.dart';

class WACategoriesComponent extends StatefulWidget {
  static String tag = '/WACategoriesComponent';

  final WATransactionModel? categoryModel;

  WACategoriesComponent({this.categoryModel});

  @override
  WACategoriesComponentState createState() => WACategoriesComponentState();
}

class WACategoriesComponentState extends State<WACategoriesComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: EdgeInsets.only(bottom: 8, left: 5, right: 5),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Product Name",
                  style: boldTextStyle(size: 12)),
              Text('${widget.categoryModel!.productname!}',
                  maxLines: 1, style: TextStyle(fontSize: 12)),
            ]),
            8.height,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Item Core",
                  style: boldTextStyle(size: 12)),
              Text('${widget.categoryModel!.itemcore!}',
                  maxLines: 1, style: TextStyle(fontSize: 12)),
            ]),
            5.height,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Price",
                  style: boldTextStyle(size: 12)),
              Text('${widget.categoryModel!.price!}',
                  maxLines: 1, style: TextStyle(fontSize: 12)),
            ]),
            5.height,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Quantity",
                  style: boldTextStyle(size: 12)),
              Text('${widget.categoryModel!.quantity!}',
                  maxLines: 1, style: TextStyle(fontSize: 12)),
            ]),
            Divider(color: Colors.black),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Amount",
                  style: boldTextStyle(size: 12)),
              Text('${widget.categoryModel!.amount!}',
                  maxLines: 1, style: TextStyle(fontSize: 12)),
            ]),

          ],
        ));
  }
}
