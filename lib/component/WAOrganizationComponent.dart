import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/model/WalletAppModel.dart';

class WAOrganizationComponent extends StatefulWidget {
  static String tag = '/WAOrganizationComponent';

  final WAOrganizationModel? organizationModel;

  WAOrganizationComponent({this.organizationModel});

  @override
  WAOrganizationComponentState createState() => WAOrganizationComponentState();
}

class WAOrganizationComponentState extends State<WAOrganizationComponent> {
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
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 16),
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
                Text('${widget.organizationModel!.title.validate()}',
                    style: boldTextStyle(), textAlign: TextAlign.center),
                4.height,
                Text('${widget.organizationModel!.subTitle.validate()}',
                    style: secondaryTextStyle(), textAlign: TextAlign.center),
              ]),
              3.height,
              Divider(color: Colors.black),
              3.height,
              Row(children: [
                Text('${widget.organizationModel!.title2.validate()}',
                    style: boldTextStyle(), textAlign: TextAlign.center),
                4.height,
                Text('${widget.organizationModel!.subTitle2.validate()}',
                    style: secondaryTextStyle(), textAlign: TextAlign.center),
              ]),
              3.height,
              Row(children: [
                Text('${widget.organizationModel!.title3.validate()}',
                    style: boldTextStyle(), textAlign: TextAlign.center),
                4.height,
                Text('${widget.organizationModel!.subTitle3.validate()}',
                    style: secondaryTextStyle(), textAlign: TextAlign.center),
              ]),
              3.height,
              Row(children: [
                Text('${widget.organizationModel!.title4.validate()}',
                    style: boldTextStyle(), textAlign: TextAlign.center),
                4.height,
                Text('${widget.organizationModel!.subTitle4.validate()}',
                    style: secondaryTextStyle(), textAlign: TextAlign.center),
              ]),
              3.height,
              Divider(color: Colors.black),
              3.height,
              Row(children: [
                Text('${widget.organizationModel!.title5.validate()}',
                    style: boldTextStyle(), textAlign: TextAlign.center),
                4.height,
                Text('${widget.organizationModel!.subTitle5.validate()}',
                    style: secondaryTextStyle(), textAlign: TextAlign.center),
              ])
            ],
          ).expand(),
        ],
      ),
    );
  }
}
