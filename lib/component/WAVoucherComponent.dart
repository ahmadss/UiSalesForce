import 'package:flutter/material.dart';
import 'package:salesforce/model/WalletAppModel.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/utils/WAColors.dart';
import 'package:salesforce/utils/WAWidgets.dart';

class WAVoucherComponent extends StatefulWidget {
  static String tag = '/WAVoucherComponent';

  final WAVoucherModel? voucherModel;

  WAVoucherComponent({this.voucherModel});

  @override
  WAVoucherComponentState createState() => WAVoucherComponentState();
}

class WAVoucherComponentState extends State<WAVoucherComponent> {
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
      padding: EdgeInsets.all(16),
      decoration: boxDecorationRoundedWithShadow(16),
      alignment: AlignmentDirectional.center,
      width: context.width() * 0.40,
      child: Column(
        children: [
          waCommonCachedNetworkImage(
            widget.voucherModel!.image!,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRect(12),
          8.height,
          Text(''),
          Text('${widget.voucherModel!.title!}', style: secondaryTextStyle(), maxLines: 1),
          8.height,
          Text(''),
        ],
      ),
    );
  }
}
