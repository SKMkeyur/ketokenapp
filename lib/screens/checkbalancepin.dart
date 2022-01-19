import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/checkbalance.dart';
import 'package:ketoken/screens/home.dart';
import 'package:ketoken/widgets/buttonContainer.dart';
import 'package:local_auth/local_auth.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckBalancePinScreen extends StatefulWidget {
  const CheckBalancePinScreen({Key? key}) : super(key: key);

  @override
  _CheckBalancePinScreenState createState() => _CheckBalancePinScreenState();
}

class _CheckBalancePinScreenState extends State<CheckBalancePinScreen> {
  String _otp = ""; //will hold the entered OTP
  var _otpSymbols = ["__","__","__","__"]; //holds symbols to display
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleKeypadClick(String val) {
    setState(() {
      if (_otp.length < 4){
        _otp = _otp + val;
        for (int i=0; i < _otp.length; i++)
          //  _otpSymbols[i] = "\u{25CF}";
          _otpSymbols[i] = "*";
      }
    });
  }
  void _handleKeypadDel() {
    setState(() {
      if (_otp.length > 0) {
        _otp = _otp.substring(0,_otp.length - 1);
        for (int i = _otp.length; i < 4; i++)
          _otpSymbols[i] = "__";
      }
    });
  }
  void _handleSubmit() {
    if (_otp.length == 4){
      if(_otp.toString()!=appPin.toString()){
        _scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text('OTP is incorrect'),
          backgroundColor: Colors.red,
        ));
        print(appPin);
        print(_otp);
      }else{
        _scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text('Entered OTP is $_otp'),
        ));
      }
    }
    else
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text('OTP has to be of 4 digits'),
        backgroundColor: Colors.red,
      ));
  }
  var appPin;
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
        _message = authenticated ? "Authorized"
            : "Not Authorized";
        if(_message=="Authorized"){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CheckBalanceScreen())
          );
        }
      });
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
  }
  late String bio='';
  void _loadCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      bio = (prefs.getString('bio'))!;
      print(bio);
      if(bio=="true"){
        print("true oo");
        _authenticateMe();

      }else if(bio=="false"){
        print("false");
      }else{
        print("bio   "+bio);
        print("helllo");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCounter();
    _loadCounter1();


  }


  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      appPin = (prefs.getString('appPin') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {

    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.white,
        height: height1,
        width: width,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: height1*.427,
              decoration: const BoxDecoration(
                  color: RoyalBlue,
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
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),

                    alignment: Alignment.topLeft,
                    child: Container(
                      height: height1*.1586,
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: width*.15,
                      // child: IconButton(onPressed: (){},
                      //   icon: Icon(FontAwesomeIcons.chevronLeft),color: Colors.white,),
                    ),
                  ),

                  Container(

                    width: width*.68,
                    height: height1*.18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            alignment: Alignment.center,

                            child: FittedBox(
                              child: Text("Enter KeToken PIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 30),),
                            )
                        ),
                        Container(
                            alignment: Alignment.center,
                            // width: width*.54,
                            child: Text("Enter your 4-Digit App PIN to continue",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 16),)
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(_otpSymbols[0],style: TextStyle(fontSize: 30,color: Colors.white),),
                                  //  Divider(color: Colors.white,thickness: 100,height: 5,)
                                ],
                              ),
                              Text(_otpSymbols[1],style: TextStyle(fontSize: 30,color: Colors.white),),
                              Text(_otpSymbols[2],style: TextStyle(fontSize: 30,color: Colors.white),),
                              Text(_otpSymbols[3],style: TextStyle(fontSize: 30,color: Colors.white),),
                            ],
                          ),
                        ),



                        // OTPTextField(
                        //   obscureText: true,
                        //   length: 4,
                        //   width: MediaQuery.of(context).size.width,
                        //   fieldWidth: 70,
                        //   style: TextStyle(
                        //       fontSize: 28
                        //   ),
                        //   textFieldAlignment: MainAxisAlignment.spaceAround,
                        //  fieldStyle: FieldStyle.underline,
                        //  otpFieldStyle: OtpFieldStyle(borderColor: Colors.white,
                        //  focusBorderColor: Colors.white,
                        //  enabledBorderColor: Colors.white,
                        //  ),
                        //   onCompleted: (pin) {
                        //     print("Completed: " + pin);
                        //   },
                        // ),
                      ],
                    ),
                  ),


                  Container(
                    width: width*.1586,
                    // child: Text("data",style: TextStyle(color: DarkBlue ),)),
                  )
                ],
              ),

            ),

            Container(
              //   padding: EdgeInsets.symmetric(vertical: 20),
              height: height1*.4,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: height1*.1,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('1');
                            },
                            child: Text('1',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('2');
                            },
                            child: Text('2',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('3');
                            },
                            child: Text('3',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          )
                        ]
                    ),
                  ),

                  Container(
                    height: height1*.1,

                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('4');
                            },
                            child: Text('4',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('5');
                            },
                            child: Text('5',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('6');
                            },
                            child: Text('6',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          )
                        ]),
                  ),
                  Container(
                    height: height1*.1,

                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('7');
                            },
                            child: Text('7',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('8');
                            },
                            child: Text('8',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('9');
                            },
                            child: Text('9',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          )
                        ]),
                  ),
                  Container(
                    height: height1*.1,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[

                          FlatButton(
                            onPressed: () {
                              // _handleSubmit();
                              //_handleKeypadClick('0');
                            },
                            child: Text('',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('0');
                            },
                            child: Text('0',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadDel();
                            },
                            child: Text('\u{232b}',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),

                        ]
                    ),
                  ),

                ],
              ),

            ),
            Container(height: height1*.03,),

            Container(
              width: width,
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              height: height*0.09,
              color: Colors.white,
              child: InkWell(
                onTap: (){
                  if (_otp.length == 4){
                    if(_otp.toString()!=appPin.toString()){
                      _scaffoldKey.currentState!.showSnackBar(SnackBar(
                        content: Text('OTP is incorrect'),
                        backgroundColor: Colors.red,
                      ));
                      print(appPin);
                      print(_otp);
                    }else{
                      _scaffoldKey.currentState!.showSnackBar(SnackBar(
                        content: Text('Entered OTP is $_otp'),
                      ));
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => CheckBalanceScreen())
                      );
                    }
                  }
                  else
                    _scaffoldKey.currentState!.showSnackBar(SnackBar(
                      content: Text('OTP has to be of 4 digits'),
                      backgroundColor: Colors.red,
                    ));
                },
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:RoyalBlue,
                        borderRadius: BorderRadius.circular(40)),
                    child:   TextButton(
                      child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                      onPressed: (){
                        if (_otp.length == 4){
                          if(_otp.toString()!=appPin.toString()){
                            _scaffoldKey.currentState!.showSnackBar(SnackBar(
                              content: Text('OTP is incorrect'),
                              backgroundColor: Colors.red,
                            ));
                            print(appPin);
                            print(_otp);
                          }else{
                            _scaffoldKey.currentState!.showSnackBar(SnackBar(
                              content: Text('Entered OTP is $_otp'),
                            ));
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => CheckBalanceScreen())
                            );
                          }
                        }
                        else
                          _scaffoldKey.currentState!.showSnackBar(SnackBar(
                            content: Text('OTP has to be of 4 digits'),
                            backgroundColor: Colors.red,
                          ));
                        //print('hello');
                      },
                    )

                  //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                ),
              ),
            ),
            // ButtonContainer("PROCEED TO PAY", DarkBlue)


          ],
        ),
      ),
    );
  }
}
