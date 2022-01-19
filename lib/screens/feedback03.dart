import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/Paint_Widgets/paint02.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/home.dart';

class FeedBack03Screen extends StatefulWidget {
  const FeedBack03Screen({Key? key}) : super(key: key);

  @override
  _FeedBack03ScreenState createState() => _FeedBack03ScreenState();
}

class _FeedBack03ScreenState extends State<FeedBack03Screen> {
  @override
  Widget build(BuildContext context) {
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
                        child: Icon(FontAwesomeIcons.solidCheckCircle,color: Blue1,size: 100,)),
                    SizedBox(height: 20,),

                    Text("REWARDS REDEEM SUCCEESSFULLY",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),textAlign: TextAlign.center,)
                  ],
                ),


              ),


            ),

            Container(
              height: height*0.2,
              width: width*.20,
              child: Container(
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomeScreen())
                        );
                      },
                      child: Icon(FontAwesomeIcons.chevronLeft,color: Colors.white,))
              ),
            ),

            Container(
              alignment: Alignment.center,
              width: width,
              height: height1*0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Redeem",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.center,
                    child: Icon(FontAwesomeIcons.wallet,size: 40,color: Colors.white,),
                  ),
                  SizedBox(height: 20,),
                  Text("P.240",style: TextStyle(color: Colors.white,fontSize: 46,fontWeight: FontWeight.w700),),
                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
