import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ketoken/Paint_Widgets/paint01.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/Paint_Widgets/paint.dart';
import 'package:ketoken/screens/phonenumber.dart';
import 'package:ketoken/widgets/buttonContainer.dart';
import 'package:ketoken/widgets/path1Widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController registerController = TextEditingController();
  bool isRegisterValidate = false;
  bool isphoneokay = false;

  @override
  Widget build(BuildContext context) {

    bool validateTextField(String userInput) {
      // && userInput.length==int.parse(max1)
      if (registerController.text.isNotEmpty ) {
        setState(() {
          isRegisterValidate = true;
        });
        return true;
      }else{
        setState(() {
          isRegisterValidate = false;
        });
        return false;
      }
    }


    double safe = MediaQuery.of(context).padding.top;

    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;

    return SafeArea(
      child: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),

        child: Scaffold(
          resizeToAvoidBottomInset: true,

          body: SingleChildScrollView(
            child: Container(
                child: Column(
                  children: [
                    Container(
                        height: height*.424,
                      color: Colors.pink,
                      child: Stack(
                        children: [

                          Paint00(),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: height*0.2,
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(FontAwesomeIcons.userCircle,size: 50,color: Colors.white,),

                                    Text("Register to Continue!",
                                      style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w600),)
                                  ],
                                )

                            ),
                          )
                        ],
                      )


                      // CustomPaint(
                      //   painter: BluePainter(),
                      // )

                      // ClipPath(
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     height: 200,
                      //     color: Colors.blue,
                      //   ),
                      //   clipper: CustomClipPath(),
                      // ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      height: height*.048,
                      child: Text("WELCOME TO KETOKEN",style: TextStyle(fontSize: 26,letterSpacing: 0.1,fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        height: height*.20,
                        child: Column(
                          children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("MOBILE NUMBER",style: TextStyle(color: Colors.grey,fontSize: 18),)),
                              // TextField(
                              //   decoration: new InputDecoration(
                              //       hintText: 'Enter Your Mobile Number'
                              //   ),
                              // ),
                            IntlPhoneField(
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                             // keyboardType: TextInputType.number,
                              controller: registerController,
                              showDropdownIcon: false,
                              decoration: InputDecoration(
                                  hintText: "Enter Your Mobile Number",
                                  errorText: isRegisterValidate ? 'Please Enter The Mobile Number' : null
                              ),
                              initialCountryCode: 'IN',
                              onChanged: (phone) {
                                //print(phone.completeNumber);
                                if(registerController.text.length==(countries.firstWhere((element) => element['code'] == phone.countryISOCode)['max_length'])){
                                  isphoneokay = true;

                                }else{
                                  isphoneokay = false;
                                }
                                print(isphoneokay);
                                print(countries.firstWhere((element) => element['code'] == phone.countryISOCode)['max_length']);

                              },
                            )
                          ],
                        ),

                      ),
                    ),
                    SizedBox(height: height*0.06,),
                  //  ButtonContainer("REGISTER",DarkPurple),
                    Container(
                      width: width,
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      height: height*0.09,
                      color: Colors.white,
                      child: InkWell(
                        onTap: (){
                          print("helo");
                         // PhoneNumberScreen();
                          if(registerController.text.contains(".") || registerController.text.contains(",")){
                            Fluttertoast.showToast(
                                msg: "There should not be . or , in Mobile number!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: DarkBlue,
                                textColor: Colors.white
                            );
                          }
                          else if(validateTextField(registerController.text) && isphoneokay==true){
                            //   _loadCounter(registerController.text);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => PhoneNumberScreen())
                            );
                          }else{
                            Fluttertoast.showToast(
                                msg: "Please enter remaining numbers",
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
                                color:DarkPurple,
                                borderRadius: BorderRadius.circular(40)),
                            child:   TextButton(
                              child: Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                              onPressed: (){
                                if(registerController.text.contains(".") || registerController.text.contains(",")){
                                  Fluttertoast.showToast(
                                      msg: "There should not be . or , in Mobile number!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: DarkBlue,
                                      textColor: Colors.white
                                  );
                                }
                                else if(validateTextField(registerController.text) && isphoneokay==true){
                               //   _loadCounter(registerController.text);
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => PhoneNumberScreen())
                                  );
                                }else{
                                  Fluttertoast.showToast(
                                      msg: "Please enter remaining numbers",
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
                    )
                    // Container(
                    //   width: width,
                    //   padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    //   height: height*0.09,
                    //   color: Colors.white,
                    //     child: Container(
                    //       alignment: Alignment.center,
                    //       decoration: BoxDecoration(
                    //         color:DarkPurple,
                    //         borderRadius: BorderRadius.circular(40)),
                    //       child:   TextButton(
                    //         child: Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                    //         onPressed: (){
                    //           //print('hello');
                    //         },
                    //       )
                    //
                    //       //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                    //       ),
                    //     ),



                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
 }

class CustomClipPath extends CustomClipper<Path> {
  var radius=10.0;
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path ovalPath = Path();
    ovalPath.lineTo(0, size.height * 0.9);
    ovalPath.lineTo(width*0, height*0.9);
    ovalPath.quadraticBezierTo(size.width*.90,size.height*70,0,size.height);
    ovalPath.quadraticBezierTo(width*.8, height*.9, width*.8, 0);
    ovalPath.close();
    //paint.color = Colors.blue.shade600;


    // Path ovalPath = Path();
    // ovalPath.moveTo(0, height * 0.9);
    // //ovalPath.lineTo(0, 0);
    // ovalPath.lineTo(width*0, height*0.9);
    // ovalPath.quadraticBezierTo(width*.8, height*.9, width*.8, 0);
    // // Close line to reset it back
    // ovalPath.close();
    // paint.color = Colors.blue.shade600;
    // canvas.drawPath(ovalPath, paint);
    //
    // Path ovalPath2 = Path();
    // ovalPath2.moveTo(0, 0);
    // ovalPath2.lineTo(0, height*0.9);
    // ovalPath2.lineTo(width*0.8, 0);
    // //ovalPath2.quadraticBezierTo(width*.7, height*.5, width*.9, 0);
    // // Close line to reset it back
    // ovalPath2.close();
    // paint.color = Colors.blue.shade600;
    // canvas.drawPath(ovalPath2, paint);
  //  path.lineTo(size.width, 0);



    return ovalPath;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
//
//
// class BluePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final height = size.height;
//     final width = size.width;
//     Paint paint = Paint();
//
//     Path mainBackground = Path();
//     mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
//     paint.color = Colors.blue.shade700;
//     canvas.drawPath(mainBackground, paint);
//
//     Path ovalPath = Path();
//     // Start paint from 20% height to the left
//     ovalPath.moveTo(0, height * 0.2);
//
//     // paint a curve from current position to middle of the screen
//     ovalPath.quadraticBezierTo(
//         width * 0.45, height * 0.25, width * 0.51, height * 0.5);
//
//     // Paint a curve from current position to bottom left of screen at width * 0.1
//     ovalPath.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);
//
//     // draw remaining line to bottom left side
//     ovalPath.lineTo(0, height);
//
//     // Close line to reset it back
//     ovalPath.close();
//
//     paint.color = Colors.blue.shade600;
//     canvas.drawPath(ovalPath, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return oldDelegate != this;
//   }
// }