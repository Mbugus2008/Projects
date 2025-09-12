// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Drawerfile.dart';
import 'Utilities.dart';
import 'theme.dart';

class Drawerfile extends StatefulWidget {
  @override
  _DrawerfileState createState() => _DrawerfileState();
}

class _DrawerfileState extends State<Drawerfile> {
  late List<DrawerItemModel> drawerItemModel;

  @override
  void initState() {
    super.initState();
    addDrawerItem();
  }
  Future<void> savepreferences(double progressval)
  async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('progressVal', progressval);
print( prefs.getDouble("progressVal"));
  }
  addDrawerItem() {
    // ignore: deprecated_member_use
    drawerItemModel = <DrawerItemModel>[];

    drawerItemModel.add(DrawerItemModel("Notification Preferences", null));
    drawerItemModel.add(DrawerItemModel("Gift Card", null));
    drawerItemModel.add(DrawerItemModel("My Chats", null));
    drawerItemModel.add(DrawerItemModel("Help Centre", null));
    drawerItemModel.add(DrawerItemModel("Legal", null));
  }

  buildItem(BuildContext context, int index) {
    if (drawerItemModel[index].imageRes != null) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              children: <Widget>[

                Expanded(
                  flex: 2,
                  child: Image.network(
                    drawerItemModel[index].imageRes!,
                    height: 15,
                    width: 15,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Text(
                    drawerItemModel[index].name,
                    style: TextStyle(fontSize: 15),
                  ),
                ),

              ],
            ),
          ),
          index == 0 || index == 8 || index == 10 || index == 15
              ? Container(
                  color: Colors.grey,
                  height: 1,
                )
              : SizedBox(
                  height: 0,
                )
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10, left: 20),

        child: Column(
          children: [
            Text(
              drawerItemModel[index].name,
              style: TextStyle(fontSize: 15),
            ),

          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.white,
                activeColor[progressVal.value].withOpacity(0.5),
                activeColor[progressVal.value]
              ])
      ),

      child: ListView(
        children: <Widget>[
          Container(
            height: size.height / 10,

            child: Center(
              child: ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.home,

                  ),
                  trailing: Image.asset(
                    "assets/images/aps-logo.png",
                    height: size.height / 10,
                    width: size.width / 3,
                  )),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: drawerItemModel.length,
            itemBuilder: (context, index) {
              return buildItem(context, index);
            },

          ),
          const SizedBox(
            height: 12,
          ),
          TempWidget(
              temp: temp,
              changeTemp: (val) => setState(()  {
                temp = val;
                //interval(val);
                progressVal =ValueNotifier( normalize(val, kMinDegree, kMaxDegree));
                savepreferences(progressVal.value);

              })),
        ],
      ),
    );
  }
}

class DrawerItemModel {
  String _name;
  String? _imageRes;

  DrawerItemModel(this._name, this._imageRes);

  String? get imageRes => _imageRes;

  String get name => _name;
}
