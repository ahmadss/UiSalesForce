import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/component/WACategoriesComponent.dart';
import 'package:salesforce/component/WAListCustomerDialog.dart';
import 'package:salesforce/component/WAProductComponent.dart';
import 'package:salesforce/model/WalletAppModel.dart';
import 'package:salesforce/screen/WADetailTransactionScreen.dart';
import 'package:salesforce/screen/WAListTransactionScreen.dart';
import 'package:salesforce/screen/WAProductListScreen.dart';
import 'package:salesforce/utils/WADataGenerator.dart';
import 'package:salesforce/utils/WAWidgets.dart';

class WANewOrderFinishScreen extends StatefulWidget {
  static String tag = '/WANewOrderScreen';

  @override
  WANewOrderFinishScreenState createState() => WANewOrderFinishScreenState();
}

class WANewOrderFinishScreenState extends State<WANewOrderFinishScreen> {
  List<WATransactionModel> categoriesList = waCategoriesList();
  List<WAProductModel> transactionList = waTransactionList();

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
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('New Order Form',
              style: boldTextStyle(color: Colors.black, size: 20)),
          actions: [
            Container(
              margin: EdgeInsets.all(8),
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Icon(
                Icons.add,
                color: Colors.black12,
              ),
            ).onTap(() {
              WAProductListScreen().launch(context);
            }),
          ],
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black12,
            ),
          ).onTap(() {
            finish(context);
          }),
          automaticallyImplyLeading: false,
          elevation: 0.0,
          brightness: Brightness.dark,
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/walletApp/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                16.height,
                SettingItemWidget(
                    title: 'Your Busines Partner',
                    decoration: boxDecorationRoundedWithShadow(12),
                    trailing: Icon(Icons.search, color: grey.withOpacity(0.5)),
                    onTap: () {
                      showInDialog(context, builder: (context) {
                        return WAListCustomerDialog();
                      });
                    }).paddingAll(16),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transactions', style: boldTextStyle(size: 20)),
                    Icon(Icons.play_arrow, color: Colors.grey),
                  ],
                ).paddingOnly(left: 16, right: 16),
                16.height,
                Column(
                  children: transactionList.map((transactionItem) {
                    return WAProductComponent(
                        transactionModel: transactionItem);
                  }).toList(),
                ).paddingAll(16),
                55.height,
                Container(
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: new Expanded(
                    child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sales Summary : ',
                                style: boldTextStyle(size: 14)),
                            Divider(color: Colors.black),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Sub Total (2 items) : ',
                                      style: boldTextStyle(size: 14)),
                                  Text('Rp 494.000'),
                                ]),
                            4.height,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Discount : ',
                                      style: boldTextStyle(size: 14)),
                                  Text('-Rp 100.000'),
                                ]),
                            4.height,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('DPP : ',
                                      style: boldTextStyle(size: 14)),
                                  Text('Rp 394.000'),
                                ]),
                            4.height,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Discount Amount: ',
                                      style: boldTextStyle(size: 14)),
                                  Text('-Rp 0'),
                                ]),
                            4.height,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tax : ',
                                      style: boldTextStyle(size: 14)),
                                  Text('Rp 0 '),
                                ]),
                            Divider(color: Colors.black),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Grand Total : ',
                                      style: boldTextStyle(size: 15)),
                                  Text('Rp 394.000', style: boldTextStyle(size: 15)),
                                ]),
                            AppButton(
                              child: Text('Finish',
                                  style: boldTextStyle(color: Colors.black),
                                  textAlign: TextAlign.center),
                              width: context.width(),
                              color: Colors.yellow,
                              onTap: () {
                                WAListTransactionScreen().launch(context);
                              },
                            ).paddingAll(10),
                          ]).paddingOnly(left: 16, right: 16),

                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
