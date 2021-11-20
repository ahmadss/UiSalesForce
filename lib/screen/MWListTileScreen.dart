import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MWListTileScreen extends StatefulWidget {
  static String tag = '/MWListTileScreen';

  @override
  MWListTileScreenState createState() => MWListTileScreenState();
}

class MWListTileScreenState extends State<MWListTileScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: userList.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              margin: EdgeInsets.all(6),
              elevation: 2,
              child: ListTile(
                onTap: () {
                  toasty(context, userList[index].name);
                },
                title: Text(
                  userList[index].name!,
                  style: boldTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                trailing:
                Wrap(
                  spacing: 12, // space between two icons
                  children: <Widget>[
                    Icon(Icons.edit_outlined), // icon-1
                    Icon(Icons.delete_outline), // icon-2
                  ],
                ),

              ),
            );
          },
        ),
      );
  }
}

class UserModel {
  String? images;
  String? name;
  String? value;

  UserModel({
    this.images,
    this.name,
    this.value,
  });
}

List<UserModel> userList = [
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user1.png',
    name: 'Sales Name 1',
    value: '',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user2.png',
    name: 'Sales Name 2',
    value: '',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user3.png',
    name: 'Sales Name 3',
    value: '',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user1.png',
    name: 'Admin',
    value: '',
  ),

];
