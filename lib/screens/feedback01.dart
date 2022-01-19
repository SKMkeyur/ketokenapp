import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/Paint_Widgets/paint02.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/Pin01.dart';
import 'package:ketoken/screens/firstpin.dart';
import 'package:ketoken/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedBack01Screen extends StatefulWidget {
  const FeedBack01Screen({Key? key}) : super(key: key);

  @override
  _FeedBack01ScreenState createState() => _FeedBack01ScreenState();
}

class _FeedBack01ScreenState extends State<FeedBack01Screen> {
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
    return Scaffold(
      body: Container(
        width: width,
        height: height1,
        child: Stack(
          children: [
            Paint02(),
            Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child:
              Container(
                padding: EdgeInsets.all(20),
                height: height1*0.37,
                width: width*0.81,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Icon(FontAwesomeIcons.solidCheckCircle,color: Blue1,size: height1*0.12,)),
                    SizedBox(height: 20,),

                    Container(
                      child: Text("Your Personal Details Added Successfully",
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                    )
                  ],
                ),


              ),


            ),

            Container(
              padding: EdgeInsets.all(40),
              alignment: Alignment.topRight,
              height: height*0.2,
              width: width,
              child: Container(
                  child: InkWell(
                      onTap: (){
                        _loadCounter1("FirstPinScreen",'screen');
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => FirstPinScreen()
                         )
                        );
                      },
                      child:
                      Text("Proceed",style: TextStyle(color: Colors.white,fontSize: 20),))
                      // Icon(FontAwesomeIcons.chevronLeft,color: Colors.white,))

              ),
            ),

            Container(
              alignment: Alignment.center,
              width: width,
              height: height1*0.35,

            )

          ],
        ),
      ),

    );
  }
}
