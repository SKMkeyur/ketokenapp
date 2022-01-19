import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/Paint_Widgets/paint01.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/feedback02.dart';
import 'package:ketoken/widgets/buttonContainer.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'feedback02new.dart';

class MoneyOtpVerificationScreen extends StatefulWidget {

 // const MoneyOtpVerificationScreen({Key? key}) : super(key: key);

  late String shortname;
  late String displayName;
  late String money;


  MoneyOtpVerificationScreen(this.shortname, this.displayName, this.money);

  @override
  _MoneyOtpVerificationScreenState createState() => _MoneyOtpVerificationScreenState();
}

class _MoneyOtpVerificationScreenState extends State<MoneyOtpVerificationScreen> {
  late String code1="";
  late int num=0;
  late String finalotp;

  @override
  Widget build(BuildContext context) {

    double safe = MediaQuery.of(context).padding.top;
    Color accentPurpleColor = Color(0xFF6A53A1);
    Color primaryColor = Color(0xFF121212);
    Color accentPinkColor = Color(0xFFF99BBD);
    Color accentDarkGreenColor = Color(0xFF115C49);
    Color accentYellowColor = Color(0xFFFFB612);
    Color accentOrangeColor = Color(0xFFEA7A3B);
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
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
                  // child: ClipPath(
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     height: 200,
                  //     color: Colors.blue,
                  //   ),
                  //   clipper: MyPainter(),
                  // ),
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
                          child: Text("Enter OTP",style: TextStyle(fontSize: 30),)
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          alignment: Alignment.center,
                          child: Text("Enter your 4-Digit OTP code sent to your Register Mobile Number",
                            textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),)
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child:
                        PinCodeTextField(
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                          keyboardType: TextInputType.number,
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                              activeColor: Colors.blue,
                              inactiveColor: Colors.grey,
                              disabledColor: Colors.grey,
                              selectedColor: Colors.grey,
                            shape: PinCodeFieldShape.underline,
                            activeFillColor: Colors.transparent,
                            inactiveFillColor: Colors.transparent,
                            selectedFillColor: Colors.transparent
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.white,
                          enableActiveFill: true,
                          // errorAnimationController: errorController,
                          // controller: textEditingController,
                          onCompleted: (v) {
                            code1=v;
                            print(v);
                          },
                          onChanged: (value) {
                                setState(() {
                                  finalotp=value;
                                if(value==""){
                                  num = num -1;
                                }else{
                                  num = num +1;
                                }
                              });

                            print("value     =="+value);
                            // setState(() {
                            //   currentText = value;
                            // });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          }, appContext: context,
                        )
                        // OtpTextField(
                        //   numberOfFields: 4,
                        //   borderColor: accentPurpleColor,
                        //   focusedBorderColor: accentPurpleColor,
                        //   styles: otpTextStyles,
                        //   showFieldAsBox: false,
                        //   borderWidth: 4.0,
                        //   //runs when a code is typed in
                        //   onCodeChanged: (String code) {
                        //     setState(() {
                        //       if(code==""){
                        //         num = num -1;
                        //       }else{
                        //         num = num +1;
                        //       }
                        //     });
                        //   },
                        //   //runs when every textfield is filled
                        //   onSubmit: (String verificationCode) {
                        //     setState(() {
                        //       code1=verificationCode;
                        //     });
                        //
                        //   },
                        // ),




                        // OTPTextField(
                        //   //obscureText: true,
                        //   length: 4,
                        //   width: MediaQuery.of(context).size.width,
                        //   fieldWidth: 70,
                        //   style: TextStyle(
                        //       fontSize: 28,
                        //       color: Colors.black,
                        //
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
                     // ButtonContainer("Verify",DarkBlue),
                      Container(
                        width: width,
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        height: height*0.09,
                        color: Colors.white,
                        child: InkWell(
                          onTap: (){
                            print("code1    "+num.toString());
                            if (finalotp.length ==4){
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => FeedBack02Screen(widget.shortname,widget.displayName,widget.money))
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

                          },
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:DarkBlue,
                                  borderRadius: BorderRadius.circular(40)),
                              child:   TextButton(
                                child: Text("Verify",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                                onPressed: (){
                                  print("code1    "+num.toString());
                                  if (finalotp.length ==4){
                                    setState(() {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => FeedBack02Screen(widget.shortname,widget.displayName,widget.money))
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
                                  //     builder: (context) => FeedBack02Screen())
                                  // );
                                  //
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
