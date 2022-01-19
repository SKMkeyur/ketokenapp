import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/feedback01.dart';
import 'package:ketoken/widgets/buttonContainer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController upiIdController = TextEditingController();
  TextEditingController appPinController = TextEditingController();
  TextEditingController comfirmAppPinController = TextEditingController();
  TextEditingController transactionPinController = TextEditingController();
  TextEditingController confirmTransactionPinController = TextEditingController();
  var phoneNumber;

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNumber = (prefs.getString('counter') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {

    void _loadCounter1(phone,identifier) async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setString(identifier, phone);
      });
    }
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;

    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),

      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            color: Colors.white,
            height: height1,
            width: width,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: height1*.1586,
                  decoration: BoxDecoration(
                      color: DarkBlue,
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
                        padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                        width: width*.25,
                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        },
                          icon: Icon(FontAwesomeIcons.chevronLeft),color: Colors.white,),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: width*.49,
                          child: Text("Personal Detail",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 22),)),
                      Container(
                        width: width*.25,
                        // child: Text("data",style: TextStyle(color: DarkBlue ),)),
                      )
                    ],
                  ),

                ),

                Container(
                  width: width,
                  height: height1*.7,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child:
                  ListView(
                    controller: scrollController,
                    shrinkWrap: true,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: ("NAME"),
                            labelStyle: TextStyle(color: Colors.grey)
                          ),
                        ),
                      IntlPhoneField(
                        enabled: false,
                        controller: phoneController,
                        showDropdownIcon: false,
                        decoration: InputDecoration(
                            hintText: phoneNumber.toString()
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: ("EMAIL"),
                            labelStyle: TextStyle(color: Colors.grey)
                        ),
                      ),
                      TextField(
                        controller: upiIdController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: ("UPI ID"),
                            labelStyle: TextStyle(color: Colors.grey)
                        ),
                      ),
                      TextField(
                        controller: appPinController,
                        obscuringCharacter: '*',
                        autofocus: false,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                    //    keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            labelText: ("APP PIN"),
                            labelStyle: TextStyle(color: Colors.grey)
                        ),
                      ),
                      TextField(
                        controller: comfirmAppPinController,
                        obscuringCharacter: '*',
                        autofocus: false,
                        obscureText: true,
                        keyboardType: TextInputType.number,

                        //    keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            labelText: ("CONFIRM APP PIN"),
                            labelStyle: TextStyle(color: Colors.grey)
                        ),
                      ),
                      TextField(
                        controller: transactionPinController,
                        obscuringCharacter: '*',
                        autofocus: false,
                        obscureText: true,
                        //    keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            labelText: ("TRANSACTION PIN"),
                            labelStyle: TextStyle(color: Colors.grey)
                        ),
                      ),
                      TextField(
                        controller: confirmTransactionPinController,
                        obscuringCharacter: '*',
                        autofocus: false,
                        obscureText: true,
                        //    keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            labelText: ("CONFIRM TRANSACTION PIN"),
                            labelStyle: TextStyle(color: Colors.grey)
                        ),
                      ),
                    ],
                  ),
                ),
              //  ButtonContainer("Next", DarkBlue)
                Container(
                  width: width,
                   padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  height: height*0.09,
                  color: Colors.white,
                  child: InkWell(
                    onTap: (){
                      if(nameController.text.isEmpty){
                        Fluttertoast.showToast(
                            msg: "Please Enter Name",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: DarkBlue,
                            textColor: Colors.white
                        );
                      }else if(emailController.text.isEmpty){
                        Fluttertoast.showToast(
                            msg: "Please Enter Email",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: DarkBlue,
                            textColor: Colors.white
                        );
                      }else if(upiIdController.text.isEmpty){
                        Fluttertoast.showToast(
                            msg: "Please Enter UPI ID",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: DarkBlue,
                            textColor: Colors.white
                        );
                      }else if(appPinController.text.isEmpty){
                        Fluttertoast.showToast(
                            msg: "Please Enter PIN",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: DarkBlue,
                            textColor: Colors.white
                        );
                      }else if(comfirmAppPinController.text.isEmpty){
                        Fluttertoast.showToast(
                            msg: "Please Enter Confirm PIN",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: DarkBlue,
                            textColor: Colors.white
                        );
                      }else if(transactionPinController.text.isEmpty){
                        Fluttertoast.showToast(
                            msg: "Please Enter Transaction PIN",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: DarkBlue,
                            textColor: Colors.white
                        );
                      }else if(confirmTransactionPinController.text.isEmpty){
                        Fluttertoast.showToast(
                            msg: "Please Enter Confirm Transaction PIN",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: DarkBlue,
                            textColor: Colors.white
                        );
                      }else if(confirmTransactionPinController.text!=transactionPinController.text){
                        Fluttertoast.showToast(
                            msg: "Transaction PIN and Confirm Transaction Pin are not same",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: DarkBlue,
                            textColor: Colors.white
                        );
                      }
                      else if(appPinController.text.length!=4){
                        Fluttertoast.showToast(
                            msg: "Please Enter 4 Digit App Pin",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: DarkBlue,
                            textColor: Colors.white
                        );
                      }else if(appPinController.text!=comfirmAppPinController.text){
                        Fluttertoast.showToast(
                            msg: "App PIN and Confirm App Pin are not same",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: DarkBlue,
                            textColor: Colors.white
                        );
                      }else if((RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text))==false){
                        Fluttertoast.showToast(
                            msg: "Enter Appropriate Email",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: DarkBlue,
                            textColor: Colors.white
                        );
                      }
                      else{
                        _loadCounter1(nameController.text,'name');
                        _loadCounter1(emailController.text,'email');
                        _loadCounter1(nameController.text,'name');
                        _loadCounter1(appPinController.text,'appPin');
                        _loadCounter1(transactionPinController.text,'transactionPin');
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => FeedBack01Screen())
                        );
                      }
                      // print("helo");
                      // // PhoneNumberScreen();
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) => FeedBack01Screen())
                      // );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color:DarkBlue,
                            borderRadius: BorderRadius.circular(40)


                          ),
                        child:   TextButton(
                          child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                          onPressed: (){
                            if(nameController.text.isEmpty){
                              Fluttertoast.showToast(
                                  msg: "Please Enter Name",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }else if(emailController.text.isEmpty){
                              Fluttertoast.showToast(
                                  msg: "Please Enter Email",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }else if(upiIdController.text.isEmpty){
                              Fluttertoast.showToast(
                                  msg: "Please Enter UPI ID",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }else if(appPinController.text.isEmpty){
                              Fluttertoast.showToast(
                                  msg: "Please Enter PIN",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }else if(comfirmAppPinController.text.isEmpty){
                              Fluttertoast.showToast(
                                  msg: "Please Enter Confirm PIN",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }else if(transactionPinController.text.isEmpty){
                              Fluttertoast.showToast(
                                  msg: "Please Enter Transaction PIN",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }else if(confirmTransactionPinController.text.isEmpty){
                              Fluttertoast.showToast(
                                  msg: "Please Enter Confirm Transaction PIN",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }else if(confirmTransactionPinController.text!=transactionPinController.text){
                              Fluttertoast.showToast(
                                  msg: "Transaction PIN and Confirm Transaction Pin are not same",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }else if(appPinController.text.length!=4){
                              Fluttertoast.showToast(
                                  msg: "Please Enter 4 Digit App Pin",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }
                            else if(appPinController.text!=comfirmAppPinController.text){
                              Fluttertoast.showToast(
                                  msg: "App PIN and Confirm App Pin are not same",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }
                            else if((RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text))==false){
                              Fluttertoast.showToast(
                                  msg: "Enter Appropriate Email",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: DarkBlue,
                                  textColor: Colors.white
                              );
                            }
                            else{

                              _loadCounter1(nameController.text,'name');
                              _loadCounter1(emailController.text,'email');
                              _loadCounter1(nameController.text,'name');
                              _loadCounter1(appPinController.text,'appPin');
                              _loadCounter1(transactionPinController.text,'transactionPin');

                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => FeedBack01Screen())
                              );
                            }
                            //print('hello');
                          },
                        )

                      //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
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
