import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/component/WACategoriesComponent.dart';
import 'package:salesforce/model/WalletAppModel.dart';
import 'package:salesforce/utils/WADataGenerator.dart';

class WADetailTransactionScreen extends StatefulWidget {
  static String tag = '/WADetailTransactionScreen';

  @override
  WADetailTransactionScreenState createState() =>
      WADetailTransactionScreenState();
}

class WADetailTransactionScreenState extends State<WADetailTransactionScreen> {
  List<WATransactionModel> categoriesList = waCategoriesList();

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
          title: Text('Power Tools',
              style: boldTextStyle(color: Colors.black, size: 20)),
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Icon(Icons.arrow_back, color: Colors.black12,),
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
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/walletApp/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child:
          Column(
            children:[
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    5.height,
                    Text('Inprogress', style: boldTextStyle(size: 16))
                        .paddingOnly(left: 16, right: 16, top: 16),
                    Divider(color: Colors.black),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('DocumentNo : ',
                                        style: boldTextStyle(size: 14)),
                                    Text('0F/21/11/100002'),
                                  ]),
                              4.height,
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Belanja : ',
                                        style: boldTextStyle(size: 14)),
                                    Text('12-10-2021 12:10:11'),
                                  ]),
                              4.height,
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Busines Partner : ',
                                        style: boldTextStyle(size: 14)),
                                    Text('Atlas MDN'),
                                  ]),
                              4.height,
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Include Tax : ',
                                        style: boldTextStyle(size: 14)),
                                    Text('No'),
                                  ]),
                              4.height,
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Standard Order : ',
                                        style: boldTextStyle(size: 14)),
                                    Text(' - '),
                                  ])
                            ])).paddingOnly(left: 16, right: 16),
                    Divider(color: Colors.black),
                    3.height,
                    Column(
                      children: categoriesList.map((categoryItem) {
                        return WACategoriesComponent(categoryModel: categoryItem);
                      }).toList(),
                    ),
                  ],
                ),
              ),
              40.height,
              Container(
                  decoration: BoxDecoration(color: Colors.grey[100]),
                child: new Expanded(
                  child: new Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Payment Detail : ',
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
                              ])
                        ]).paddingOnly(left: 16, right: 16),

                  ),
                ),
              )

            ]

          )

        ),
      ),
    );
  }
}
