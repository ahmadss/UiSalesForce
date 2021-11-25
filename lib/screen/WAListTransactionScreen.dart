import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/component/WAOrganizationComponent.dart';
import 'package:salesforce/component/WAPayToComponent.dart';
import 'package:salesforce/model/WalletAppModel.dart';
import 'package:salesforce/screen/WADetailTransactionScreen.dart';
import 'package:salesforce/screen/WANewOrderScreen.dart';
import 'package:salesforce/utils/WADataGenerator.dart';
import 'package:salesforce/utils/WAWidgets.dart';

class WAListTransactionScreen extends StatefulWidget {
  static String tag = '/WAListTransactionScreen';

  @override
  WAListTransactionScreenState createState() => WAListTransactionScreenState();
}

class WAListTransactionScreenState extends State<WAListTransactionScreen> {
  List<WAOrganizationModel> organizationList = waOrganizationList();
  late List<ProductModel> mCartList;

  @override
  void initState() {
    super.initState();
    init();
    mCartList = storeMemberItems();
  }

  Future<void> init() async {
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
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0), // here the desired height
            child: AppBar(
              toolbarHeight: 100,
              backgroundColor: Colors.white,
              title: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(children: [
                  Text(
                    'Power Tools',
                    style: boldTextStyle(color: Colors.black, size: 20),
                  ),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300,
                        height: 60,
                        child: TextField(
                          style: primaryTextStyle(),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search Customer..",
                            hintStyle: TextStyle(color: Colors.grey),
                            alignLabelWithHint: false,
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              leading:  Icon(
                  Icons.menu,
                  color: Colors.black12,
                ).onTap(() {
                finish(context);
              }),
              centerTitle: true,
              elevation: 0.0,
              brightness: Brightness.dark,
            ),
          ),
          body: Container(
            height: context.height(),
            width: context.width(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/walletApp/wa_bg.jpg'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: organizationList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Cart(organizationList[index], index);
                    },
                  ),
                ],
              ).paddingAll(16),
            ),
          ),
          floatingActionButton: new FloatingActionButton(
              elevation: 0.0,
              child: new Icon(Icons.add),
              backgroundColor: new Color(0xFFE57373),
              onPressed: () {
                WANewOrderScreen().launch(context);
              })),
    );
  }
}

class Cart extends StatelessWidget {
  late WAOrganizationModel widget;

  Cart(WAOrganizationModel model, int pos) {
    this.widget = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 10),
      decoration:
          boxDecorationRoundedWithShadow(16, backgroundColor: Colors.white),
      child: Row(
        children: [
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                Text('${widget!.title.validate()}',
                    style: boldTextStyle(), textAlign: TextAlign.center),
                4.height,
                Text('${widget!.subTitle.validate()}',
                    style: secondaryTextStyle(), textAlign: TextAlign.center),
              ]),
              3.height,
              Divider(color: Colors.black),
              3.height,
              Row(children: [
                Text('${widget!.title2.validate()}',
                    style: boldTextStyle(), textAlign: TextAlign.center),
                4.height,
                Text('${widget!.subTitle2.validate()}',
                    style: secondaryTextStyle(), textAlign: TextAlign.center),
              ]),
              3.height,
              Row(children: [
                Text('${widget!.title3.validate()}',
                    style: boldTextStyle(), textAlign: TextAlign.center),
                4.height,
                Text('${widget!.subTitle3.validate()}',
                    style: secondaryTextStyle(), textAlign: TextAlign.center),
              ]),
              3.height,
              Row(children: [
                Text('${widget!.title4.validate()}',
                    style: boldTextStyle(), textAlign: TextAlign.center),
                4.height,
                Text('${widget!.subTitle4.validate()}',
                    style: secondaryTextStyle(), textAlign: TextAlign.center),
              ]),
              3.height,
              Divider(color: Colors.black),
              3.height,
              Row(children: [
                Text('${widget!.title5.validate()}',
                    style: boldTextStyle(), textAlign: TextAlign.center),
                4.height,
                Text('${widget!.subTitle5.validate()}',
                    style: secondaryTextStyle(), textAlign: TextAlign.center),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  AppButton(
                    color: Colors.green[600],
                    width: 90,
                    height: 30,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    text: "Detail",
                    onTap: () {
                      WADetailTransactionScreen().launch(context);
                    },
                    textStyle: boldTextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ).expand(),
        ],
      ),
    );
  }
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color? bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? Colors.grey[200],
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

Widget text(
  String? text, {
  var fontSize = 14,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: 14,
      color: textColor ?? Colors.black,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

class ProductModel {
  var name = "";
  var price = "";
  var weight = "";
  var img = "";
}

Widget? Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeHolderWidget();
