import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/component/WACategoriesComponent.dart';
import 'package:salesforce/model/WalletAppModel.dart';
import 'package:salesforce/utils/WADataGenerator.dart';
import 'package:salesforce/utils/WAWidgets.dart';

class WAProductListScreen extends StatefulWidget {
  static String tag = '/WAProductListScreen';

  @override
  WAProductlistScreenState createState() =>
      WAProductlistScreenState();
}



class WAProductlistScreenState extends State<WAProductListScreen> {
  List<WATransactionModel> categoriesList = waCategoriesList();
  late List<T10Product> mDashboardList;

  @override
  void initState() {
    super.initState();
    init();
  }

  List<T10Product> getDashboardProducts() {
    List<T10Product> list = [];
    list.add(T10Product("Ryu Un Demolition Hammer", "\Rp 25.000", "\Rp 30.000", t10_slider_3, "By Boots Category"));
    list.add(T10Product("Ryu Un Demolition Hammer", "\Rp 25.000", "\Rp 30.000", t10_slider_3, "By Boots Category"));
    list.add(T10Product("Ryu Un Demolition Hammer", "\Rp 25.000", "\Rp 30.000", t10_slider_3, "By Boots Category"));
    list.add(T10Product("Ryu Un Demolition Hammer", "\Rp 25.000", "\Rp 30.000", t10_slider_3, "By Boots Category"));
    list.add(T10Product("Ryu Un Demolition Hammer", "\Rp 25.000", "\Rp 30.000", t10_slider_3, "By Boots Category"));
    list.add(T10Product("Ryu Un Demolition Hammer", "\Rp 25.000", "\Rp 30.000", t10_slider_3, "By Boots Category"));
    list.add(T10Product("Ryu Un Demolition Hammer", "\Rp 25.000", "\Rp 30.000", t10_slider_3, "By Boots Category"));
    list.add(T10Product("Ryu Un Demolition Hammer", "\Rp 25.000", "\Rp 30.000", t10_slider_3, "By Boots Category"));
    list.add(T10Product("Ryu Un Demolition Hammer", "\Rp 25.000", "\Rp 30.000", t10_slider_3, "By Boots Category"));
    list.add(T10Product("Ryu Un Demolition Hammer", "\Rp 25.000", "\Rp 30.000", t10_slider_3, "By Boots Category"));

    return list;
  }

  init() async {
    mDashboardList = getDashboardProducts();
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget? Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeHolderWidget();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextFormField(
            style: primaryTextStyle(height: 0),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.grey[800]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(width: 1, color: Colors.grey!),
              ),
              // labelText: 'Address',
              labelStyle: primaryTextStyle(),
              alignLabelWithHint: true,
            ),
            cursorColor: blackColor,
            keyboardType: TextInputType.name,
            validator: (s) {
              if (s!.trim().isEmpty) return 'Address is required';
              return null;
            },
          ),
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
        body:Expanded(
          child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            color: context.scaffoldBackgroundColor,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mDashboardList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: CachedNetworkImage(
                        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                        imageUrl: mDashboardList[index].img,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    text(mDashboardList[index].name, textColor: Colors.black, fontFamily: 'Medium', fontSize: 15),
                    Row(
                      children: <Widget>[
                        text(
                          mDashboardList[index].price,
                          textColor: Colors.black,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        text(mDashboardList[index].subPrice, textColor: Colors.black, lineThrough: true)
                      ],
                    ),
                    MaterialButton(
                      onPressed: () {
                        toasty(context, 'Rounded color fill Material button');
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      color: getColorFromHex('#f2866c'),
                      child: Text(
                        'Add To Cart',
                        style: primaryTextStyle(color: Colors.white),
                      ),
                    ).center(),
                  ],
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
            ),
          )
              ]
    ),
          ),

        ),
      ),
    );
  }
}

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
      color: textColor ?? Colors.black,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration: lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

class T10Product {
  var name;
  var price;
  var subPrice;
  var img;
  var category;

  T10Product(
      this.name,
      this.price,
      this.subPrice,
      this.img,
      this.category,
      );
}

class T10Images {
  var img;

  T10Images(this.img);
}

const BaseUrl = 'https://assets.iqonic.design/old-themeforest-images/prokit';
const t10_headphones = "$BaseUrl/images/theme10/t10_headphones.jpeg";
const t10_ic_shoes = "$BaseUrl/images/theme10/t10_ic_shoes.jpeg";
const t10_profile = "$BaseUrl/images/theme10/t10_profile.jpg";
const t10_profile_1 = "$BaseUrl/images/theme10/t10_profile_1.jpg";
const t10_profile_3 = "$BaseUrl/images/theme10/t10_profile_3.jpg";
const t10_profile_2 = "$BaseUrl/images/theme10/t10_profile_2.jpg";
const t10_slider_1 = "$BaseUrl/images/theme10/t10_slider_1.jpeg";
const t10_profile_5 = "$BaseUrl/images/theme10/t10_profile_5.jpg";
const t10_watch = "$BaseUrl/images/theme10/t10_watch.jpg";
const t10_profile_6 = "$BaseUrl/images/theme10/t10_profile_6.jpg";
const Theme10Pot = "$BaseUrl/images/theme10/t10_pot.jpg";
const t10_slider_2 = "$BaseUrl/images/theme10/t10_slider_2.jpg";
const t10_slider_3 = "$BaseUrl/images/theme10/t10_slider_3.jpeg";
const t10_shoes = "$BaseUrl/images/theme10/t10_shoes.jpeg";

const t10_ic_otp = "images/theme10/t10_ic_otp.svg";
const t10_ic_search = "images/theme10/t10_ic_search.svg";

