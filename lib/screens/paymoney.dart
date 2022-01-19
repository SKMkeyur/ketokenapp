import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/moneyotpverification.dart';
import 'package:ketoken/widgets/buttonContainer.dart';

import 'feedback03.dart';

class PayMoneyScreen extends StatefulWidget {
 // const PayMoneyScreen({Key? key}) : super(key: key);


  late String name;
  late String shortName;
  late List<Contact> contacts1;


  @override
  _PayMoneyScreenState createState() => _PayMoneyScreenState();
}

class _PayMoneyScreenState extends State<PayMoneyScreen> {



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


  late bool messegek;
  late bool moneyk=true;
  late FocusNode myFocusNode;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // messegek=true;
    moneyk=true;
    myFocusNode = FocusNode();
  }
  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
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
                                child:
                                Container(
                                  alignment: Alignment.center,
                                  width: width*0.15,
                                  height: height*0.1,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                  ),
                                  child: Text("JC",style: TextStyle(color: Colors.pink,fontSize: 24),),
                                ),
                                //Text("Enter your PIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 30),)

                            ),
                            Container(
                                alignment: Alignment.center,
                                // width: width*.54,
                                child: Text("Justin Cabriel",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 16),)
                            ),
                           // SizedBox(height: 20,),
                            Container(
                              child: Column(
                                children: [
                                  FittedBox(
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          moneyk=true;
                                          myFocusNode.unfocus();

                                        });
                                      },
                                      child: Container(
                                       // color: Colors.red,
                                        padding: EdgeInsets.symmetric(horizontal: 40),
                                        decoration: BoxDecoration(
                                          color: Color(0xff3a51d0),
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Text( _otp == "\$0" ? "" : ("\$"+_otp),

                                          style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w600),),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(
                                    onTap: (){
                                  //    print("eee");
                                    },
                                    child: Container(
                                      // color: Colors.red,
                                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Color(0xff3a51d0),
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      child:
                                      TextField(
                                        focusNode: myFocusNode,

                                        onTap: (){
                                          setState(() {
                                            moneyk=false;
                                            messegek=true;
                                          });
                                        }
                                        ,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w300,),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                          hintText: "message",
                                          hintStyle: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w300,
                                          )
                                        ),
                                      )
                                      // Text( "message",
                                      //
                                      //   style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w300),)
                                      ,
                                    ),
                                  ),
                                  //  Divider(color: Colors.white,thickness: 100,height: 5,)
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
                  child:
                  moneyk==false
                      ?
                  Container()
                  :
                  Column(
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
                                  _handleKeypadClick('.');
                                },
                                child: Text('.',
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
                        setState(() {
                          _isPayAllow = true;
                        });

                      }
                      if (_isPayAllow == true) {
                        //   _handleSubmit();
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MoneyOtpVerificationScreen("JC","Justin Cabriel","300"))
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
                                setState(() {
                                  _isPayAllow = true;
                                });

                            }
                            if (_isPayAllow == true) {
                              //   _handleSubmit();
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => MoneyOtpVerificationScreen("JC","Justin Cabriel","300"))
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
                        )

                      //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ),
                // ButtonContainer("PROCEED TO PAY", DarkBlue)


              ],
            ),
          ),
      ),
    );
  }
}
