import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/Paint_Widgets/paint01.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/moneyotpverification.dart';
import 'package:ketoken/screens/otpchangepassword.dart';
import 'package:ms_undraw/ms_undraw.dart';
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

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
            height: height,
            width: width,
            child: Column(
              children: [
                Container(
                  height: height*.27,
                  child: Paint01(),
                ),
                Container(
                  height: height - height*.27,
                  color: Colors.red,
                  child:
                  Container(
                    height: height*.5,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: width,
                          height: height*0.2,
                          child: Image.asset("graphic_res/authentication.png",fit: BoxFit.contain,),
                        ),

                        Container(
                            height: height*0.05,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            child: FittedBox(child: Text("Change Password",style: TextStyle(fontSize: 30),))
                        ),
                        Container(
                          height: height*0.3,
                          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextField(
                                controller: oldPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Old Password',
                                  hintText: 'Enter your Old Password',
                                ),
                              ),
                              TextField(
                                controller: newPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'New Password',
                                  hintText: 'Enter New Password',
                                ),
                              ),
                              TextField(
                                controller: confirmNewPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Confirm New Password',
                                  hintText: 'Enter Confirm New Password',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child:   Container(
                            width: width,
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            height: height*0.09,
                            color: Colors.white,
                            child: InkWell(
                              onTap: (){
                                if(oldPasswordController.text.isEmpty){
                                  Fluttertoast.showToast(
                                      msg: "Please Enter Old Password",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: DarkBlue,
                                      textColor: Colors.white
                                  );
                                }else if(newPasswordController.text.isEmpty){
                                  Fluttertoast.showToast(
                                      msg: "Please Enter New Password",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: DarkBlue,
                                      textColor: Colors.white
                                  );
                                }else if(confirmNewPasswordController.text.isEmpty){
                                  Fluttertoast.showToast(
                                      msg: "Please Enter Confirm New Password",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: DarkBlue,
                                      textColor: Colors.white
                                  );
                                }else if(confirmNewPasswordController.text!=newPasswordController.text){
                                  Fluttertoast.showToast(
                                      msg: "New Password and Confirm New Password is not matching",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: DarkBlue,
                                      textColor: Colors.white
                                  );
                                }else{
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ChangePasswordOtpVerificationScreen())
                                  );
                                }


                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:RoyalBlue,
                                      borderRadius: BorderRadius.circular(40)),
                                  child:   TextButton(
                                    child: Text("RESET PASSWORD",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600,wordSpacing: 3,letterSpacing: 2),),
                                    onPressed: (){
                                      if(oldPasswordController.text.isEmpty){
                                        Fluttertoast.showToast(
                                            msg: "Please Enter Old Password",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: DarkBlue,
                                            textColor: Colors.white
                                        );
                                      }else if(newPasswordController.text.isEmpty){
                                        Fluttertoast.showToast(
                                            msg: "Please Enter New Password",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: DarkBlue,
                                            textColor: Colors.white
                                        );
                                      }else if(confirmNewPasswordController.text.isEmpty){
                                        Fluttertoast.showToast(
                                            msg: "Please Enter Confirm New Password",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: DarkBlue,
                                            textColor: Colors.white
                                        );
                                      }else if(confirmNewPasswordController.text!=newPasswordController.text){
                                        Fluttertoast.showToast(
                                            msg: "New Password and Confirm New Password is not matching",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: DarkBlue,
                                            textColor: Colors.white
                                        );
                                      }else{
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => ChangePasswordOtpVerificationScreen())
                                        );
                                      }




                                    },
                                  )
                                //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                              ),
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
