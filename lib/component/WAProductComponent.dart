import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/model/WalletAppModel.dart';
import 'package:salesforce/utils/WAWidgets.dart';

class WAProductComponent extends StatefulWidget {
  static String tag = '/WATransactionComponent';

  final WAProductModel? transactionModel;

  WAProductComponent({this.transactionModel});

  @override
  WAProductComponentState createState() => WAProductComponentState();
}

class WAProductComponentState extends State<WAProductComponent> {
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

  BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color? bgColor, var showShadow = false}) {
    return BoxDecoration(
      color: Colors.grey[200],
      boxShadow: showShadow ? defaultBoxShadow(shadowColor: shadowColorGlobal) : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  Widget? Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeHolderWidget();

  Widget text(
      String? text, {
        var fontSize = 18,
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
        color: Colors.black,
        height: 1.5,
        letterSpacing: latterSpacing,
        decoration: lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: boxDecoration(showShadow: true, radius: 10.0, bgColor: context.scaffoldBackgroundColor),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: CachedNetworkImage(
                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                imageUrl: '',
                fit: BoxFit.fill,
                height: width * 0.2,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text('${widget.transactionModel!.name!}', textColor: Colors.black, fontFamily: 'Medium'),
                  ],
                ),
                text('${widget.transactionModel!.balance!}', textColor: Colors.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        text('${widget.transactionModel!.balance!}', textColor: Colors.black),
                        SizedBox(width: 4.0),
                        text('${widget.transactionModel!.balance}', textColor: Colors.black, lineThrough: true),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.remove_circle, color: Colors.black, size: 20),
                        SizedBox(width: 4),
                        text("2", textColor: Colors.black, fontFamily: 'Medium', fontSize: 18),
                        SizedBox(width: 4),
                        Icon(Icons.add_circle, color: Colors.black, size: 20)
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
    // return Container(
    //   padding: EdgeInsets.symmetric(horizontal: 16),
    //   margin: EdgeInsets.only(bottom: 16,left: 16,right: 16),
    //   decoration: boxDecorationRoundedWithShadow(16, backgroundColor: Colors.white),
    //   child: ListTile(
    //     tileColor: Colors.red,
    //     enabled: true,
    //     contentPadding: EdgeInsets.zero,
    //     leading: Container(
    //       height: 50,
    //       width: 50,
    //       alignment: Alignment.center,
    //       decoration: boxDecorationWithRoundedCorners(
    //         boxShape: BoxShape.circle,
    //         backgroundColor: widget.transactionModel!.color!.withOpacity(0.1),
    //       ),
    //       child: ImageIcon(
    //         AssetImage('${widget.transactionModel!.image!}'),
    //         size: 24,
    //         color: widget.transactionModel!.color!,
    //       ),
    //     ),
    //     title: RichTextWidget(
    //       list: [
    //         TextSpan(
    //           text: '${widget.transactionModel!.title!}',
    //           style: primaryTextStyle(color: Colors.black54, size: 14),
    //         ),
    //         TextSpan(
    //           text: '\t${widget.transactionModel!.name!}',
    //           style: boldTextStyle(size: 14),
    //         ),
    //       ],
    //       maxLines: 1,
    //     ),
    //     subtitle: Text('${widget.transactionModel!.time!}', style: primaryTextStyle(color: Colors.black54, size: 14)),
    //     trailing: Container(
    //       width: 80,
    //       height: 35,
    //       alignment: Alignment.center,
    //       decoration: boxDecorationWithRoundedCorners(
    //         borderRadius: BorderRadius.circular(30),
    //         backgroundColor: widget.transactionModel!.color!.withOpacity(0.1),
    //       ),
    //       child: Text(
    //         '${widget.transactionModel!.balance!}',
    //         maxLines: 1,
    //         style: boldTextStyle(size: 12, color: widget.transactionModel!.color!),
    //       ),
    //     ),
    //   ),
    // );
  }
}
