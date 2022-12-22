// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart' as bd;
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mailing_system/AppViews/profile_screen.dart';
import 'package:mailing_system/Classes/User.dart';


import '../SharedMaterial/shared_widgets.dart';

class inboxPage extends StatefulWidget {
  User user;

   inboxPage({super.key, required this.user});
   
  @override
  State<inboxPage> createState() => _inboxPageState();
}

class _inboxPageState extends State<inboxPage> {
  User? user;
    @override
  void initState() {
    super.initState();
    user = widget.user;
  }
  var size, height, width;
  TextEditingController text = new TextEditingController();
  var selectedfolder = 'Inbox';
  

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    SharedWidgets appBarObj = SharedWidgets();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        //el app bar hena lazmeto en el status bar yb2a nafs loon el theme
        appBar: appBarObj.appBar(
            80,
            null,
            <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
                  },
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Colors.black,
                    size: 28,
                  ),
                  splashRadius: 25)
              ,
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 25,
                  ),
                  splashRadius: 25)
            ],
            Container(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://lh3.googleusercontent.com/a/AEdFTp7HB1ZjlorTV0wExaxhYEFjVlpn5ODkxRXx6aSHnw=s288-p-rw-no'),
                  radius: 26,
                  backgroundColor: Color.fromARGB(255, 239, 239, 239),
                  child: IconButton(
                    icon: Icon(color: Colors.transparent, Icons.person),
                    onPressed: () {
                      // Navigator.pushNamed(context, 'profile');
                                                      Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>ProfileScreen(user: user!),
                                                            ),
                                                              );
                    },
                  )),
            )),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height / 32),
              SizedBox(
                height: height / 128,
              ),
              //Kelmet Inbox emfrood tetghyr 3la hasab el folder
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Inbox",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  )),
              //Unread Messages Counter
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bd.Badge(
                    position: bd.BadgePosition.topEnd(top: 10, end: 10),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "10 Unread Messages ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                ],
              ),
              SizedBox(
                height: height / 32,
              ),
              //El Icons bta3t El folders
              Padding(
                padding: EdgeInsets.only(left: width / 12),
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: IconButton(
                          icon: Icon(Icons.drafts, color: Colors.black),
                          onPressed: () {},
                          iconSize: 40,
                        )),
                    SizedBox(
                      width: width / 64,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: IconButton(
                          icon: Icon(Icons.folder, color: Colors.black),
                          onPressed: () {},
                          iconSize: 40,
                        )),
                    SizedBox(
                      width: width / 64,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: IconButton(
                          icon: Icon(Icons.folder_delete, color: Colors.black),
                          onPressed: () {},
                          iconSize: 40,
                        )),
                    SizedBox(
                      width: width / 64,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: IconButton(
                          icon: Icon(Icons.folder_special, color: Colors.black),
                          onPressed: () {},
                          iconSize: 40,
                        )),
                    SizedBox(
                      width: width / 64,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: IconButton(
                          icon: Icon(Icons.contacts, color: Colors.black),
                          onPressed: () {},
                          iconSize: 40,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: height / 64,
              ),
              //Container Shayel El AnimSeaerchBar
              Container(
                  padding:
                      EdgeInsets.only(left: width / 32, bottom: height / 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  height: 90,
                  width: width,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: height / 64,
                            right: width / 32,
                            left: width / 128),
                        child: AnimSearchBar(
                          color: Colors.grey[350],
                          width: width - 30,
                          textController: text,
                          onSuffixTap: () {},
                        ),
                      ),
                    ],
                  )),
              //Cards El Emails Hena
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  physics: PageScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: width / 32, bottom: height / 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          height: height / 6,
                          width: width,
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: height / 32, left: width / 64),
                            child: bd.Badge(
                                position:
                                    bd.BadgePosition.topEnd(top: 5, end: 10),
                                badgeContent: Icon(
                                  Icons.circle,
                                  color: Colors.transparent,
                                  size: 3,
                                ),
                                badgeColor: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 10, top: height / 40),
                          child: Text(
                            "Abdallah Hussam",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 10, top: height / 18),
                          child: Text(
                            "Mail Subject",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 10, top: height / 12),
                          child: Text(
                            "Mail Content Should Be Shown Here, Mail Content Should Be Shown Here",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height / 38, left: width - 70),
                          child: Text(
                            "8:12 PM",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ]));
  }
}
