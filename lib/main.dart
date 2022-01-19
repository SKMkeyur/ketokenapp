import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:ketoken/Paint_Widgets/paint01.dart';
import 'package:ketoken/Paint_Widgets/paint02.dart';
import 'package:ketoken/screens/Pin01.dart';
import 'package:ketoken/screens/Transactions.dart';
import 'package:ketoken/screens/changepassword.dart';
import 'package:ketoken/screens/faq.dart';
import 'package:ketoken/screens/feedback01.dart';
import 'package:ketoken/screens/feedback02.dart';
import 'package:ketoken/screens/feedback03.dart';
import 'package:ketoken/screens/firstpin.dart';
import 'package:ketoken/screens/forgotpassword.dart';
import 'package:ketoken/screens/getredeem.dart';
import 'package:ketoken/screens/helpsupport.dart';
import 'package:ketoken/screens/home.dart';
import 'package:ketoken/screens/login.dart';
import 'package:ketoken/screens/moneyotpverification.dart';
import 'package:ketoken/Paint_Widgets/paint.dart';
import 'package:ketoken/screens/paymoney.dart';
import 'package:ketoken/screens/personaldetails.dart';
import 'package:ketoken/screens/phonenumber.dart';
import 'package:ketoken/screens/phoneverification.dart';
import 'package:ketoken/screens/readcontact.dart';
import 'package:ketoken/screens/referearn.dart';
import 'package:ketoken/screens/register.dart';
import 'package:ketoken/screens/scanqrcode.dart';
import 'package:ketoken/screens/settings.dart';
import 'package:ketoken/screens/subscription.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context,AsyncSnapshot<SharedPreferences> prefs){
    var x = prefs.data;
    if (prefs.hasData) {
      if (x?.getString("screen")=="FirstPinScreen") {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FirstPinScreen()
      );
      }else if (x?.getString("screen")=="RegisterScreen"){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: RegisterScreen()
        );
      }
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegisterScreen()
       );
    });
  }
}


class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangePasswordScreen()
    );
  }
}
