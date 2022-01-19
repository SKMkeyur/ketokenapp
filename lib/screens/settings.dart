import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/models/settingoptions.dart';
import 'package:ketoken/screens/aboutus.dart';
import 'package:ketoken/screens/changepassword.dart';
import 'package:ketoken/screens/faq.dart';
import 'package:ketoken/screens/helpsupport.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  late bool isSwitched1;
  var textValue1 = 'Switch is OFF';
  //
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  String _message = "Not Authorized";

  Future<bool> checkingForBioMetrics() async {
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    print(canCheckBiometrics);
    return canCheckBiometrics;
  }

  Future<void> _authenticateMe() async {
// 8. this method opens a dialog for fingerprint authentication.
//    we do not need to create a dialog nut it popsup from device natively.
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Authenticate to Enter", // message for dialog
        useErrorDialogs: true, // show error in dialog
        stickyAuth: true, // native process
      );
      setState(() {
        _message = authenticated ? "Authorized" : "Not Authorized";
      });
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
  }
  var touch;
  void _loadCounter0() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      touch = (prefs.getString('bio') ?? 0);
      print("first touch "+touch);
      if(touch=='true'){
        isSwitched1=true;
        print("is Switched "+isSwitched1.toString());
      }else{
        isSwitched1=false;
        print("is Switched "+isSwitched1.toString());
      }
    });
  }
  @override
  void initState() {

    checkingForBioMetrics();
    // TODO: implement initState
    super.initState();
    isSwitched1=false;
    setState(() {

      _loadCounter0();

    });

  }

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }


  // void toggleSwitch1(bool value) {
  //   if(isSwitched1 == false)
  //   {
  //     setState(() {
  //       isSwitched1 = true;
  //       textValue1 = 'Switch Button is ON';
  //     });
  //     print('Switch Button is ON');
  //     if(checkingForBioMetrics==false){
  //       print("false");
  //     }else{
  //       print("possible");
  //
  //     }
  //
  //   }
  //   else
  //   {
  //     setState(() {
  //       isSwitched1 = false;
  //       textValue1 = 'Switch Button is OFF';
  //     });
  //     print('Switch Button is OFF');
  //   }
  // }

  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {

    void _loadCounter1(phone,identifier) async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setString('bio', phone);
      });
    }




    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height:300,
        width: 300,
        color: Colors.transparent,
        alignment: Alignment.center,
        child:
        Container(
          padding: EdgeInsets.all(20),
          height:300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Icon(FontAwesomeIcons.solidCheckCircle,color: Blue1,size: 100,)),
              SizedBox(height: 20,),

              Text("Touch ID Activated Successfully",
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),textAlign: TextAlign.center,)
            ],
          ),


        ),


      ),
    );
    Dialog errorDialog1 = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height:300,
        width: 300,
        color: Colors.transparent,
        alignment: Alignment.center,
        child:
        Container(
          padding: EdgeInsets.all(20),
          height:300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Icon(FontAwesomeIcons.solidCheckCircle,color: Blue1,size: 100,)),
              SizedBox(height: 20,),

              Text("No Bio-Metrics Found",
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),textAlign: TextAlign.center,)
            ],
          ),


        ),


      ),
    );
    Dialog errorDialog2 = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height:300,
        width: 300,
        color: Colors.transparent,
        alignment: Alignment.center,
        child:
        Container(
          padding: EdgeInsets.all(20),
          height:300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Icon(FontAwesomeIcons.solidCheckCircle,color: Blue1,size: 100,)),
              SizedBox(height: 20,),

              Text("Touch ID Deactivated Successfully",
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),textAlign: TextAlign.center,)
            ],
          ),


        ),


      ),
    );
    double safe = MediaQuery.of(context).padding.top;

    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: height1,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: height1*.1586,
                  decoration: BoxDecoration(
                    color: DarkBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                      width: width*.33,
                      child: IconButton(onPressed: (){

                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomeScreen())
                        );
                      },
                          icon: Icon(FontAwesomeIcons.chevronLeft),color: Colors.white,),
                    ),
                    Container(
                      alignment: Alignment.center,
                        width: width*.33,
                        child: Text("Settings",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 22),)),
                    Container(
                        width: width*.33,
                       // child: Text("data",style: TextStyle(color: DarkBlue ),)),
                    )
                  ],
                ),

              ),
              Container(

                padding: EdgeInsets.symmetric(horizontal: 20),
                height: height1*.7,
                color: Colors.white,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 12),

                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                  (index == 0 ) || (index == 7)  ? Divider(
                        thickness: 0,
                        color: Colors.white,
                      ) : Divider(
                        color: Colors.black,


                      ),

                  itemCount: options.length + 2, //6
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return SizedBox(height: 0.0);
                      } else if (index == options.length + 1) {
                        return SizedBox(height: 50.0);
                      }
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(0.0),
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(
                          //   color: Colors.white,
                          // color: _selectedOption == index - 1
                          //     ? Color(0xffd2f3f3): Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          // border: _selectedOption == index - 1
                          //     ? Border.all(color: Colors.black26)
                          //     : null,
                        ),
                        child: ListTile(
                          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                          trailing:
                          options[index-1].title=="Notifications"
                              ?
                              Container(
                                child:  Switch(
                                  onChanged: toggleSwitch,
                                 value: isSwitched,
                                  activeColor: Colors.green,
                                  activeTrackColor: Colors.greenAccent,
                                  inactiveThumbColor: Colors.redAccent,
                                  inactiveTrackColor: Colors.orange,
                                ),
                              )
                              :
                          options[index-1].title=="Touch id"
                              ?
                          Container(
                            child:  Switch(
                              onChanged: (value){
                                if(isSwitched1 == false)
                                {
                                  setState(() {
                                    isSwitched1 = true;
                                    //touch=true;
                                    textValue1 = 'Switch Button is ON';
                                  });
                                  print('Switch Button is ON');
                                  if(checkingForBioMetrics==false){
                                    print("false");
                                    showDialog(context: context, builder: (BuildContext context) => errorDialog1);
                                  }else{
                                    print("possible");
                                    showDialog(context: context, builder: (BuildContext context) => errorDialog);
                                    setState(() {
                                      _loadCounter1(isSwitched1.toString(), 'bio');
                                      print("done");
                                      _loadCounter0();
                                      print("touch "+touch.toString());
                                    });
                                  }
                                }
                                else
                                {
                                  setState(() {
                                    // touch=false;
                                    isSwitched1 = false;
                                    textValue1 = 'Switch Button is OFF';
                                    _loadCounter1(isSwitched1.toString(), 'bio');
                                  });
                                  showDialog(context: context, builder: (BuildContext context) => errorDialog2);
                                  print('Switch Button is OFF');
                                  _loadCounter0();
                                  print("touch "+touch);

                                }
                              },
                              value: isSwitched1,
                            //  value: is,
                              activeColor: Colors.green,
                              activeTrackColor: Colors.greenAccent,
                              inactiveThumbColor: Colors.redAccent,
                              inactiveTrackColor: Colors.orange,
                            ),
                          )
                          :
                          Icon(FontAwesomeIcons.chevronRight,size: 18,),
                          leading:  options[index - 1].icon,
                          // iconColor: _selectedOption == index - 1
                          // ? Colors.pink : Colors.blue,
                          // selectedColor:  _selectedOption == index - 1
                          //     ? Color(0xff57bbb4) : Colors.blue,
                          title: Text(
                            options[index - 1].title,
                            style: TextStyle(
                                color: _selectedOption == index - 1
                                    ? Colors.blue
                                    : Colors.black,
                                fontWeight: FontWeight.w400
                            ),
                          ),

                          selected: _selectedOption == index - 1,
                          onTap: () {
                            setState(() {
                              _selectedOption = index - 1;
                            }
                            );
                            if(options[index-1].title=="Touch id"){
                              print(_message);
                             // _authenticateMe();
                            }


                            if(options[index-1].title=="Faq's"){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => FaqScreen())
                              );
                            }
                            if(options[index-1].title=="Change Password"){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ChangePasswordScreen())
                              );
                            }
                            if(options[index-1].title=="About US"){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => AboutUsScreen())
                              );
                            }
                            if(options[index-1].title=="Help & Support"){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => HelpSupportScreen())
                              );
                            }


                          },
                        ),
                      );
                    },

                ),

              )





            ],
          ),
        ),
      ),
    );
  }
}
