// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mailing_system/AppViews/add_contact.dart';
import 'package:mailing_system/AppViews/contacs.dart';
import 'package:mailing_system/AppViews/editProfile_screen.dart';
import 'package:mailing_system/AppViews/inboxPage.dart';
import 'package:mailing_system/AppViews/login_screen.dart';
import 'package:mailing_system/AppViews/mail_Screen.dart';
import 'package:mailing_system/AppViews/profile_screen.dart';
import 'package:mailing_system/AppViews/register_screen.dart';
import 'package:mailing_system/AppViews/sendmessage_screen.dart';
import 'package:mailing_system/AppViews/trash.dart';
import 'package:mailing_system/SharedMaterial/notificationsFactory.dart';
import 'package:mailing_system/AppViews/splash_screen.dart';
import 'package:mailing_system/SharedMaterial/globals.dart';
import 'SharedMaterial/globals.dart';
import 'dbHelper.dart';
import 'SharedMaterial/shared_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationFactory init =
      LoginNotificationFactory(FlutterLocalNotificationsPlugin());
  init.notifiySetup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.black

      ),
      home: LoginScreen(),
      routes: {
        'contacts': (context) => const Contacts(),
        'sendMessage': (context) => const SendMessage(),
        'login': (context) => const LoginScreen(),
        'register': (context) => RegisterScreen(),
        // 'mail': (context) => EmailScreen2(),
        'inbox': (context) => inboxPage(),
        'editProfile': (context) => EditProfileScreen(),
        'profile': (context) => ProfileScreen(),
        'send': (context) => SendMessage(),
        'addContact': (context) => AddContacts(),
        'trash': (context) => TrashScreen(),
      },
    );
  }
}
