import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/home.dart';

class CheckBalanceScreen extends StatefulWidget {
  const CheckBalanceScreen({Key? key}) : super(key: key);

  @override
  _CheckBalanceScreenState createState() => _CheckBalanceScreenState();
}

class _CheckBalanceScreenState extends State<CheckBalanceScreen> {
  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
              height: height*0.3,
                decoration: BoxDecoration(
                  //  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage(
                        'graphic_res/check_balance_doodle.png'),
                    fit: BoxFit.contain,
                  ),
                ),
             // color: Colors.red,
                child:  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: (){


                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => HomeScreen()
                          )
                          );

                          },
                        child: Icon(FontAwesomeIcons.arrowLeft,color:RoyalBlue,))),
              ),
              Container(
                child: Text("WALLET",style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(0, -10))
                    ],
                    color: Colors.transparent,
                    //color: Colors.black,
                    fontSize: 30,fontWeight: FontWeight.w600
                    ,decoration: TextDecoration.underline,decorationColor: RoyalBlue,decorationThickness: 4,decorationStyle: TextDecorationStyle.solid
                ),),
              ),
              SizedBox(height: height*0.05,),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text("Current Balance",style: TextStyle(color: Colors.grey),),
                  ),
                  SizedBox(height: height*0.01,),
                  Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text("\$ 120.04 ",style: TextStyle(color: Colors.black,fontSize: 50),),
                  ),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
