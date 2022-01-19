import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ketoken/Paint_Widgets/paint01.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/paymoney.dart';
import 'package:ketoken/screens/subscription.dart';
import 'package:ketoken/widgets/buttonContainer.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:flutter/gestures.dart';

class PhoneVerificationNewContactScreen extends StatefulWidget {
  const PhoneVerificationNewContactScreen({Key? key}) : super(key: key);

  @override
  _PhoneVerificationNewContactScreenState createState() => _PhoneVerificationNewContactScreenState();
}

class _PhoneVerificationNewContactScreenState extends State<PhoneVerificationNewContactScreen> {
  late String code1="";
  late int num=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    num = 0;
  }
  @override
  Widget build(BuildContext context) {
    Color accentPurpleColor = Color(0xFF6A53A1);
    Color primaryColor = Color(0xFF121212);
    TextStyle? createStyle(Color color) {
      ThemeData theme = Theme.of(context);
      return theme.textTheme.headline3?.copyWith(color: color);
    }
    var otpTextStyles = [
      createStyle(primaryColor),
      createStyle(primaryColor),
      createStyle(primaryColor),
      createStyle(primaryColor),
    ];
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: width,
            height: height,
            child: Column(
              children: [
                Container(
                  height: height*.27,
                  color: Colors.pink,
                  child: Paint01(),
                ),
                Container(
                  height: height*.5,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(FontAwesomeIcons.mobileAlt,size: 60,),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          child: Text("Phone Verification",style: TextStyle(fontSize: 30),)
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          alignment: Alignment.center,
                          child: Text("Enter your 4-Digit OTP code to continue",
                            textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),)
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child:
                        OtpTextField(
                          numberOfFields: 4,
                          borderColor: accentPurpleColor,
                          focusedBorderColor: accentPurpleColor,
                          styles: otpTextStyles,
                          showFieldAsBox: false,
                          borderWidth: 4.0,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            setState(() {
                              if(code==""){
                                num = num -1;
                              }else{
                                num = num +1;
                              }
                              print(num);
                            });

                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {

                            setState(() {
                              code1=verificationCode;
                            });

                          },
                        ),
                        // OTPTextField(
                        //   obscureText: true,
                        //   length: 4,
                        //   width: MediaQuery.of(context).size.width,
                        //   fieldWidth: width*0.25-20,
                        //   style: TextStyle(
                        //       fontSize: 28,
                        //     color: Colors.black
                        //   ),
                        //   textFieldAlignment: MainAxisAlignment.spaceAround,
                        //   fieldStyle: FieldStyle.underline,
                        //   onCompleted: (pin) {
                        //     print("Completed: " + pin);
                        //   },
                        // ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("I don't receive any code!",
                                textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
                              SizedBox(width: 5,),
                              RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Resend Code',
                                            style: TextStyle(color: Colors.deepPurpleAccent),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print('Resend the Code');
                                              }
                                        ),
                                      ]
                                  )
                              ),

                            ],

                          )
                      ),
                      // ButtonContainer("Verify",DarkPurple),
                      Container(
                        width: width,
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        height: height*0.09,
                        color: Colors.white,
                        child: InkWell(
                          onTap: (){
                            print("helo");
                            if (num==4){
                              setState(() {
                                // Fluttertoast.showToast(
                                //     msg: code1,
                                //     toastLength: Toast.LENGTH_SHORT,
                                //     gravity: ToastGravity.BOTTOM,
                                //     timeInSecForIosWeb: 1,
                                //     backgroundColor: DarkBlue,
                                //     textColor: Colors.white
                                // );

                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PayMoneyScreen())
                                );
                              });
                            }else{
                              Fluttertoast.showToast(
                                  msg: "Enter the OTP",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }
                            // PhoneNumberScreen();
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (context) => SubScriptionScreen())
                            // );
                          },
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:DarkPurple,
                                  borderRadius: BorderRadius.circular(40)),

                              child:   TextButton(
                                child: Text("Verify",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                                onPressed: (){

                                  if (num>=4){
                                    setState(() {
                                      // Fluttertoast.showToast(
                                      //     msg: code1,
                                      //     toastLength: Toast.LENGTH_SHORT,
                                      //     gravity: ToastGravity.BOTTOM,
                                      //     timeInSecForIosWeb: 1,
                                      //     backgroundColor: DarkBlue,
                                      //     textColor: Colors.white
                                      // );

                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => PayMoneyScreen())
                                      );
                                    });
                                  }else{
                                    Fluttertoast.showToast(
                                        msg: "Enter the OTP",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: DarkBlue,
                                        textColor: Colors.white
                                    );
                                  }

                                  // Navigator.push(context, MaterialPageRoute(
                                  //     builder: (context) => SubScriptionScreen())
                                  // );
                                  //print('hello');
                                },
                              )

                            //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                          ),
                        ),
                      )


                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
