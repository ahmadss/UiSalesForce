import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/model/WalletAppModel.dart';
import 'package:salesforce/screen/MWListTileScreen.dart';
import 'package:salesforce/screen/WARegisterScreen.dart';
import 'package:salesforce/utils/WADataGenerator.dart';

class WAHomeScreen extends StatefulWidget {
  static String tag = '/WAHomeScreen';

  @override
  WAHomeScreenState createState() => WAHomeScreenState();
}

class WAHomeScreenState extends State<WAHomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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
      key: scaffoldKey,
      drawer: Container(
        width: 180,
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.yellow[800]),
                currentAccountPicture: CachedNetworkImage(
                  imageUrl:
                      'https://miro.medium.com/max/2048/0*0fClPmIScV5pTLoE.jpg',
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(100),
                accountName: Text('Admin'),
                accountEmail: Text('admin@altama.co.id'),
              ),
              ListTile(
                title: Text(
                  "Logout",
                  style: boldTextStyle(),
                ),
                leading: Icon(Icons.logout, color: Colors.grey),
                onTap: () {
                  toasty(context, 'logout');
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: context.height(),
        width: context.width(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/walletApp/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: boxDecorationWithRoundedCorners(
                          backgroundColor: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                        ),
                        child: Icon(Icons.menu),
                        // child: Icon(Icons.person),
                      ),
                      onTap: () {
                        scaffoldKey.currentState!.openDrawer();
                      },
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
                      child: InkWell(
                        onTap: () {
                          WARegisterScreen().launch(context);
                        },
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Icon(Icons.sync_rounded, color: Colors.grey),
                            Positioned(
                              top: 3,
                              right: 3,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF7426),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(left: 16, right: 16, bottom: 16),
                16.height,
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  width: context.width(),
                  decoration: boxDecorationRoundedWithShadow(16),
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
                      hintText: "Search..",
                      hintStyle: TextStyle(color: Colors.grey),
                      alignLabelWithHint: false,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sales Name', style: boldTextStyle(size: 18)),
                  ],
                ).paddingOnly(left: 16, right: 16),
                Divider(color: Colors.black).paddingOnly(left: 16, right: 16),
                8.height,
                MWListTileScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
