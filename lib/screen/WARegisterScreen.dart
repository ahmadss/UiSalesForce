import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:salesforce/utils/WAColors.dart';
import 'package:salesforce/utils/WAWidgets.dart';

class WARegisterScreen extends StatefulWidget {
  static String tag = '/WARegisterScreen';

  @override
  WARegisterScreenState createState() => WARegisterScreenState();
}

class WARegisterScreenState extends State<WARegisterScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var salesnameController = TextEditingController();
  var saleserpController = TextEditingController();
  var descriptionController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();
  FocusNode salesnameFocusNode = FocusNode();
  FocusNode saleserpFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();

  bool? isChecked6 = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width(),
        height: context.height(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/walletApp/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              50.height,
              Text("User Management", style: boldTextStyle(size: 24)),
              Container(
                margin: EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      width: context.width(),
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      margin: EdgeInsets.only(top: 15.0),
                      decoration: boxDecorationWithShadow(
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                50.height,
                                Text("Username",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Enter username here',
                                      prefixIcon:
                                          Icons.person_outline_outlined),
                                  textFieldType: TextFieldType.USERNAME,
                                  keyboardType: TextInputType.name,
                                  controller: usernameController,
                                  focus: usernameFocusNode,
                                  nextFocus: passWordFocusNode,
                                ),
                                16.height,
                                Text("Password",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Enter password here',
                                      prefixIcon: Icons.lock_outline),
                                  suffixIconColor: WAPrimaryColor,
                                  textFieldType: TextFieldType.PASSWORD,
                                  isPassword: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: passwordController,
                                  focus: passWordFocusNode,
                                  nextFocus: salesnameFocusNode,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        ' Please choise a stornger password. \n try a mix of letters, numbers and symbols',
                                        style: primaryTextStyle(
                                            color: Colors.red, size: 12)),
                                  ],
                                ),
                                16.height,
                                Text("Sales Name",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Enter Sales Name here',
                                      prefixIcon:
                                          Icons.person_outline_outlined),
                                  textFieldType: TextFieldType.NAME,
                                  keyboardType: TextInputType.text,
                                  controller: salesnameController,
                                  focus: salesnameFocusNode,
                                  nextFocus: saleserpFocusNode,
                                ),
                                16.height,
                                Text("Sales ERP id",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Enter Sales ERP id here',
                                      prefixIcon: Icons.keyboard),
                                  textFieldType: TextFieldType.PHONE,
                                  keyboardType: TextInputType.number,
                                  controller: saleserpController,
                                  focus: saleserpFocusNode,
                                  // nextFocus: passWordFocusNode,
                                ),
                                16.height,
                                Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Login User",
                                          style: boldTextStyle(size: 14)),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 15.0),
                                        width: 25,
                                        height: 25,
                                        decoration: new BoxDecoration(
                                          color: isChecked6 == true
                                              ? Colors.yellow[700]
                                              : Colors.transparent,
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.black!,
                                          ),
                                          borderRadius:
                                              new BorderRadius.circular(5),
                                        ),
                                        child: Theme(
                                          data: ThemeData(
                                            unselectedWidgetColor:
                                                Colors.transparent,
                                          ),
                                          child: Checkbox(
                                            value: isChecked6,
                                            onChanged: (state) {
                                              setState(() {
                                                isChecked6 = state;
                                              });
                                            },
                                            activeColor: Colors.transparent,
                                            checkColor: Colors.white,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize.padded,
                                          ),
                                        ),
                                      ),
                                    ]),
                                16.height,
                                Text("User Role",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  decoration: waInputDecoration(
                                      hint: "Select User Role"),
                                  items: <String>['Sales', 'Admin']
                                      .map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                          style: secondaryTextStyle()),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    //
                                  },
                                ),
                                16.height,
                                Text("Description",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                TextFormField(
                                  controller: descriptionController,
                                  focusNode: descriptionFocusNode,
                                  style: primaryTextStyle(),
                                  decoration: InputDecoration(
                                    // prefixIcon: Icon(
                                    //   Icons.location_on,
                                    //   color: Colors.yellow,
                                    // ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(color: Colors.yellow!),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(width: 1, color: Colors.grey!),
                                    ),
                                    // labelText: 'Address',
                                    labelStyle: primaryTextStyle(),
                                    alignLabelWithHint: true,
                                  ),
                                  maxLines: 3,
                                  cursorColor: blackColor,
                                  keyboardType: TextInputType.multiline,
                                  validator: (s) {
                                    if (s!.trim().isEmpty) return 'Address is required';
                                    return null;
                                  },
                                ),
                                30.height,
                                AppButton(
                                        text: "Register Account",
                                        color: WAPrimaryColor,
                                        textColor: Colors.white,
                                        shapeBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        width: context.width(),
                                        onTap: () {
                                          finish(context);
                                        })
                                    .paddingOnly(
                                        left: context.width() * 0.1,
                                        right: context.width() * 0.1),
                                30.height,
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   height: 100,
                    //   width: 100,
                    //   decoration: boxDecorationRoundedWithShadow(30),
                    //   child: Image.asset(
                    //     'images/walletApp/wa_app_logo.png',
                    //     height: 60,
                    //     width: 60,
                    //     fit: BoxFit.cover,
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
