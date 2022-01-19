import 'package:flutter/material.dart';
import 'package:ketoken/Paint_Widgets/paint01.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'otpchangepassword.dart';
import 'otpforgotpassword.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
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
                  child: Paint01(),
                ),
                Container(
                  height: height - height*.4,
                  color: Colors.red,
                  child:
                  Container(
                    height: height*.3,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: width,
                          height: height*0.2,
                          child: UnDraw(
                            color: Colors.blue,
                            illustration: UnDrawIllustration.questions,
                            placeholder: Text("loading..."),
                            errorWidget: Icon(Icons.error_outline, color: Colors.red, size: 50),
                          ),
                        ),

                        Container(
                            height: height*0.05,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            child: Text("Forgot Password",style: TextStyle(fontSize: 30),)
                        ),
                        Container(
                          height: height*0.1,
                          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextField(
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Mobile Number',
                                  hintText: 'Enter Your Registered Mobile',
                                ),
                              ),
                              // TextField(
                              //   obscureText: true,
                              //   decoration: InputDecoration(
                              //     border: OutlineInputBorder(),
                              //     labelText: 'New Password',
                              //     hintText: 'Enter New Password',
                              //   ),
                              // ),
                              // TextField(
                              //   obscureText: true,
                              //   decoration: InputDecoration(
                              //     border: OutlineInputBorder(),
                              //     labelText: 'Confirm New Password',
                              //     hintText: 'Enter Confirm New Password',
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          child:   Container(
                            width: width,
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            height: height*0.09,
                            color: Colors.white,
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color:RoyalBlue,
                                    borderRadius: BorderRadius.circular(40)),
                                child:   TextButton(
                                  child: Text("GET OTP",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600,wordSpacing: 3,letterSpacing: 2),),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => ForgotPasswordOtpVerificationScreen())
                                    );
                                  },
                                )
                              //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ),

                        // ButtonContainer("Next",DarkPurple),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),

      ),
    );
  }
}
