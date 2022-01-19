import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ketoken/Paint_Widgets/paint01.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/phoneverification.dart';
import 'package:ketoken/widgets/buttonContainer.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {

  TextEditingController registerController = TextEditingController();
  bool isRegisterValidate = false;
  late var max1="";
  int phoneNumber = 0;

  bool isphoneokay = false;
  @override
  Widget build(BuildContext context) {

    void _loadCounter(phone,identifier) async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setString(identifier, phone);
      });
    }

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
                            child: Text("Verify Phone Number",style: TextStyle(fontSize: 30),)
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            alignment: Alignment.center,
                            child: Text("We have sent you an SMS with a code to number (+1) 289 94339 23 ",
                              textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),)
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: IntlPhoneField(
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],

                            controller: registerController,
                            showDropdownIcon: false,
                            decoration: InputDecoration(
                                hintText: "Phone Number",
                                errorText: isRegisterValidate ? 'Please Enter The Mobile Number' : null
                            ),
                            initialCountryCode: 'IN',
                            onChanged: (phone) {
                              if(registerController.text.length==(countries.firstWhere((element) => element['code'] == phone.countryISOCode)['max_length'])){
                                isphoneokay = true;

                              }else{
                                isphoneokay = false;
                              }
                              print(isphoneokay);
                              print(countries.firstWhere((element) => element['code'] == phone.countryISOCode)['max_length']);

                              //  print(phone.completeNumber);
                             // print(countries.firstWhere((element) => element['code'] == phone.countryISOCode)['max_length']);

                            },
                          )
                        ),
                        // ButtonContainer("Next",DarkPurple),
                        Container(
                          width: width,
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          height: height*0.09,
                          color: Colors.white,
                          child: InkWell(
                            onTap: (){
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
                                _loadCounter(registerController.text,'counter');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PhoneVerificationScreen())
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
                                    borderRadius: BorderRadius.circular(40),
                                ),
                                child:   TextButton(
                                  child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
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
                                      _loadCounter(registerController.text,'counter');
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => PhoneVerificationScreen())
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
                                    // Navigator.push(context, MaterialPageRoute(
                                    //     builder: (context) => PhoneVerificationScreen())
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
      ),
    );
  }
}
