import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/component/WAOrganizationComponent.dart';
import 'package:salesforce/component/WAPayToComponent.dart';
import 'package:salesforce/model/WalletAppModel.dart';
import 'package:salesforce/utils/WADataGenerator.dart';
import 'package:salesforce/utils/WAWidgets.dart';

class WAListproduckScreen extends StatefulWidget {
  static String tag = '/WAListProduckScreen';

  @override
  WAListProdukScreenState createState() => WAListProdukScreenState();
}

class WAListProdukScreenState extends State<WAListproduckScreen> {
  List<WAOrganizationModel> organizationList = waOrganizationList();

  @override
  void initState() {
    super.initState();
    init();
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Power Tools',
            style: boldTextStyle(color: Colors.black, size: 20),
          ),
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Icon(Icons.menu, color: Colors.black12,),
          ).onTap(() {
            finish(context);
          }),
          centerTitle: true,
          elevation: 0.0,
          brightness: Brightness.dark,
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/walletApp/wa_bg.jpg'), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 378,
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
                16.height,
                Column(
                  children: waOrganizationList().map((item) {
                    return WAOrganizationComponent(organizationModel: item).onTap(() {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.9,
                          maxChildSize: 0.9,
                          minChildSize: 0.3,
                          builder: (context, scrollController) => SingleChildScrollView(
                            controller: scrollController,
                            child: WAPayToComponent(organizationModel: item),
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
