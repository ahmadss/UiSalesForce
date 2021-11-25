import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/component/WAOperationComponent.dart';
import 'package:salesforce/model/WalletAppModel.dart';
import 'package:salesforce/utils/WADataGenerator.dart';

class WAHomeScreenSales extends StatefulWidget {
  static String tag = '/WAHomeScreenSales';

  @override
  WAHomeScreenSalesState createState() => WAHomeScreenSalesState();
}

class WAHomeScreenSalesState extends State<WAHomeScreenSales> {
  List<WAOperationsModel> operationsList = waOperationList();

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
    return Scaffold(
      body: Container(
        height: context.height(),
        width: context.width(),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/walletApp/wa_bg.jpg'), fit: BoxFit.cover),
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                50.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,


                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Icon(Icons.menu, color: Colors.grey),
                        ],
                      ),
                    )
                  ],
                ).paddingOnly(left: 16, right: 16,bottom: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hey Sales 2, Name..', style: secondaryTextStyle()).paddingOnly(left: 16, right: 16),
                  ],
                ).paddingOnly(left: 0, right: 16),
                16.height,

                Container(
                  margin: EdgeInsets.only(top: 20),
                  // decoration: boxDecorationRoundedWithShadow(
                  //   16,
                  //   backgroundColor: Colors.white,
                  // ),
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: operationsList.map((item) {
                        return Container(
                          padding: EdgeInsets.only(top: 16, bottom: 8, left: 8, right: 8),
                          decoration: boxDecorationRoundedWithShadow(16),
                          alignment: AlignmentDirectional.center,
                          width: context.width() * 0.40,
                          child: WAOperationComponent(
                            itemModel: item,
                          ),
                        ).onTap(() {
                          item.widget.launch(context);
                        });
                      }).toList(),
                    ).paddingAll(16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
