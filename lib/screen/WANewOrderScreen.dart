import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/component/WACategoriesComponent.dart';
import 'package:salesforce/component/WAListCustomerDialog.dart';
import 'package:salesforce/component/WAProductComponent.dart';
import 'package:salesforce/model/WalletAppModel.dart';
import 'package:salesforce/screen/WADetailTransactionScreen.dart';
import 'package:salesforce/screen/WANewOrderFinishScreen.dart';
import 'package:salesforce/screen/WAProductListScreen.dart';
import 'package:salesforce/utils/WADataGenerator.dart';
import 'package:salesforce/utils/WAWidgets.dart';

class WANewOrderScreen extends StatefulWidget {
  static String tag = '/WANewOrderScreen';

  @override
  WANewOrderScreenState createState() => WANewOrderScreenState();
}

class WANewOrderScreenState extends State<WANewOrderScreen> {
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
          backgroundColor: Colors.white,
          shape: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
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
                SettingItemWidget(
                    title: 'Your Busines Partner',
                    decoration: boxDecorationRoundedWithShadow(12),
                    trailing: Icon(Icons.search, color: grey.withOpacity(0.5)),
                    onTap: () {
                      showInDialog(context, builder: (context) {
                        return WAListCustomerDialog();
                      });
                    }).paddingAll(16),
                Column(
                  children: transactionList.map((transactionItem) {
                    return WAProductComponent(
                        transactionModel: transactionItem);
                  }).toList(),
                ).paddingAll(16),
                130.height,
                Container(
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: new Expanded(
                    child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Colors.black),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Item(s) : ',
                                      style: boldTextStyle(size: 14)),
                                  Text('2'),
                                ]),
                            4.height,
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Amount : ',
                                      style: boldTextStyle(size: 14)),
                                  Text('Rp 500.000'),
                                ]),
                            AppButton(
                              child: Text('Submit',
                                  style: boldTextStyle(color: Colors.black),
                                  textAlign: TextAlign.center),
                              width: context.width(),
                              color: Colors.yellow,
                              onTap: () {
                                WANewOrderFinishScreen().launch(context);
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
