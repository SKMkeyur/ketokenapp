import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/widgets/buttonContainer.dart';

import 'feedback03.dart';

class GetRedeemScreen extends StatefulWidget {
  const GetRedeemScreen({Key? key}) : super(key: key);

  @override
  _GetRedeemScreenState createState() => _GetRedeemScreenState();
}

class _GetRedeemScreenState extends State<GetRedeemScreen> {
  String _otp = ""; //will hold the entered OTP
  var _otpSymbols = []; //holds symbols to display
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late bool _isPayAllow;

  void _handleKeypadClick(String val) {
    setState(() {
      _otp = _otp + val;
    });
  }
  void _handleKeypadDel() {
    setState(() {
      _otp = _otp.substring(0,_otp.length - 1);
    });
  }
  void _handleSubmit() {

    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text('Entered OTP is $_otp'),
    ));

    // _scaffoldKey.currentState!.showSnackBar(SnackBar(
    //   content: Text('OTP has to be of 4 digits'),
    //   backgroundColor: Colors.red,
    // ));
  }
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Enter the Amount'),
        // action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: height1*.427,
              decoration: BoxDecoration(
                  color: Color(0xff1639cc),
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
                      child: IconButton(onPressed: (){
                        Navigator.pop(context);

                      },
                        icon: Icon(FontAwesomeIcons.chevronLeft),color: Colors.white,),
                    ),
                  ),

                  Container(

                    width: width*.68,
                    height: height1*.28,
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Container(
                            alignment: Alignment.center,
                            // width: width*.54,
                            child: Text("Enter the point to redeem",
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 16),)
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Redeem Rewards Point",style: TextStyle(color: Colors.white),),
                                Text("8250.40",style: TextStyle(fontSize: 30,color: Colors.white),)
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,

                              child: Icon(FontAwesomeIcons.wallet,size: 40,color: Colors.white,),
                            ),
                          ],
                        ),

                        // SizedBox(height: 20,),
                        Center(
                          child: Container(
                            width: width*.68,

                            child: Column(
                              children: [
                                FittedBox(
                                  child: Container(
                                    // color: Colors.red,
                                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                                    decoration: BoxDecoration(
                                        color: (_otp == "") ? Color(0xff1639cc) : Color(0xff3a51d0),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Text( _otp,

                                      style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w600),),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text( "Note: Enter the value in multiples of 50 or 100",
                                  style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w300),),
                                //  Divider(color: Colors.white,thickness: 100,height: 5,)
                              ],
                            ),
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
                              _handleKeypadClick('0');
                            },
                            child: Text('+*#',
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
                  if (_otp==""){
                    setState(() {
                      _isPayAllow = false;
                    });
                  }else{
                    double value1=double.parse(_otp)%50;
                    double value2=double.parse(_otp)%100;

                    if((value1 == 0.0) || (value2==0.0)){
                      setState(() {
                        _isPayAllow = true;
                      });
                    }else{
                      setState(() {
                        _isPayAllow = false;
                      });
                      Fluttertoast.showToast(
                          msg: 'Enter the the value in multiples of 50 or 100',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: DarkBlue,
                          textColor: Colors.white
                      );
                    }
                  }
                  if (_isPayAllow == true) {
                    //   _handleSubmit();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => FeedBack03Screen())
                    );
                  }else{
                    //  _showToast(context);
                    Fluttertoast.showToast(
                        msg: 'Enter the the value',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: DarkBlue,
                        textColor: Colors.white
                    );
                  }

                },
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:DarkBlue,
                        borderRadius: BorderRadius.circular(40)),
                    child:   TextButton(
                      child: Text("PAY",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                      onPressed: (){
                          if (_otp==""){
                            setState(() {
                              _isPayAllow = false;
                            });
                          }else{
                            double value1=double.parse(_otp)%50;
                            double value2=double.parse(_otp)%100;

                            if((value1 == 0.0) || (value2==0.0)){
                              setState(() {
                                _isPayAllow = true;
                              });
                            }else{
                              setState(() {
                                _isPayAllow = false;
                              });
                              Fluttertoast.showToast(
                                  msg: 'Enter the the value in multiples of 50 or 100',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }
                          }
                         if (_isPayAllow == true) {
                         //   _handleSubmit();
                           Navigator.push(context, MaterialPageRoute(
                               builder: (context) => FeedBack03Screen())
                           );
                         }else{
                         //  _showToast(context);
                           Fluttertoast.showToast(
                               msg: 'Enter the the value',
                               toastLength: Toast.LENGTH_SHORT,
                               gravity: ToastGravity.BOTTOM,
                               timeInSecForIosWeb: 1,
                               backgroundColor: DarkBlue,
                               textColor: Colors.white
                           );
                         }


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
