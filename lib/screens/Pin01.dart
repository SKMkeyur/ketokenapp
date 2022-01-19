import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/widgets/buttonContainer.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class Pin01Screen extends StatefulWidget {
  const Pin01Screen({Key? key}) : super(key: key);

  @override
  _Pin01ScreenState createState() => _Pin01ScreenState();
}

class _Pin01ScreenState extends State<Pin01Screen> {
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
    if (_otp.length == 4)
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text('Entered OTP is $_otp'),
      ));
    else
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text('OTP has to be of 4 digits'),
        backgroundColor: Colors.red,
      ));
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
                    color: MediumBlue,
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
                        child: IconButton(onPressed: (){},
                          icon: Icon(FontAwesomeIcons.chevronLeft),color: Colors.white,),
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
                              child: Text("Enter your PIN",

                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 30),)
                          ),
                          Container(
                              alignment: Alignment.center,
                             // width: width*.54,
                              child: Text("Enter your 4-Digit PIN to continue",
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
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:DarkBlue,
                        borderRadius: BorderRadius.circular(40)),
                    child:   TextButton(
                      child: Text("PROCEED TO PAY",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                      onPressed: (){
                        _handleSubmit();
                        //print('hello');
                      },
                    )

                  //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                ),
              ),
             // ButtonContainer("PROCEED TO PAY", DarkBlue)


            ],
          ),
        ),
    );
  }
}
