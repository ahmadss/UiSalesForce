import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:salesforce/utils/WAColors.dart';
import 'package:salesforce/utils/WAWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class WAListCustomerDialog extends StatefulWidget {
  static String tag = '/WAListCustomerDialog';

  @override
  T5SearchState createState() => T5SearchState();
}

class T5SearchState extends State<WAListCustomerDialog> {
  List<T5Contact> mRecentContact = [];

  @override
  void initState() {
    super.initState();
    mRecentContact = getRecents();
  }

  Widget contactList(List<T5Contact> mContactList) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: mContactList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // CircleAvatar(
                    //   backgroundImage: CachedNetworkImageProvider(mContactList[index].img),
                    //   radius: 28,
                    // ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          text(mContactList[index].name, textColor: Colors.black, fontSize: 18, fontFamily: 'Medium'),
                          text(mContactList[index].contactno, fontSize: 18)
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 0.5, color: Colors.grey[300])
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // TopBar(titleName: t5_contact_list),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                style: TextStyle(fontSize: 18, fontFamily: 'Regular'),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.yellow),
                  contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  hintText: 'Search Customer',
                  hintStyle: TextStyle(color: Colors.grey[300]),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.grey, width: 0.7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.grey, width: 0.7),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(child: contactList(mRecentContact)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class T5Contact {
  late var img;

  var name;

  var isOnline = false;
  var subject;

  var contactno;
}

const t5_profile_3 = "$BaseUrl/images/theme5/t5_profile_3.jpeg";
const t5_profile_4 = "$BaseUrl/images/theme5/t5_profile_4.jpeg";
const t5_profile_5 = "$BaseUrl/images/theme5/t5_profile_5.jpeg";
const t5_profile_6 = "$BaseUrl/images/theme5/t5_profile_6.jpeg";
const t5_profile_7 = "$BaseUrl/images/theme5/t5_profile_7.jpeg";
const t5_profile_8 = "$BaseUrl/images/theme5/t5_profile_8.jpeg";
const t5_profile_9 = "$BaseUrl/images/theme5/t5_profile_9.jpeg";

const BaseUrl = 'https://assets.iqonic.design/old-themeforest-images/prokit';

Widget text(
    String? text, {
      var fontSize = 16,
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

List<T5Contact> getRecents() {
  List<T5Contact> list = [];

  var people5 = T5Contact();
  people5.img = t5_profile_8;
  people5.name = "Atlas MDN";
  people5.contactno = "Ko Hadi";
  list.add(people5);

  var people6 = T5Contact();
  people6.img = t5_profile_9;
  people6.name = "CRL Teknik";
  people6.contactno = "Rudi Suyono";
  list.add(people6);

  var people7 = T5Contact();
  people7.img = t5_profile_9;
  people7.name = "CV Surya Kencana Teknik";
  people7.contactno = "Ruben Sutoji";
  list.add(people7);
  var people8 = T5Contact();
  people8.img = t5_profile_9;
  people8.name = "CV Surya Kencana Teknik";
  people8.contactno = "Ruben Sutoji";
  list.add(people8);
  var people9 = T5Contact();
  people9.img = t5_profile_9;
  people9.name = "CV Surya Kencana Teknik";
  people9.contactno = "Ruben Sutoji";
  list.add(people9);
  var people10 = T5Contact();
  people10.img = t5_profile_9;
  people10.name = "CV Surya Kencana Teknik";
  people10.contactno = "Ruben Sutoji";
  list.add(people10);
  list.add(people10);
  return list;
}

