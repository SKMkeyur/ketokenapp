import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/Paint_Widgets/paint02.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/home.dart';

class FeedBack02Screen extends StatefulWidget {
  //const FeedBack02Screen({Key? key}) : super(key: key);

  late String shortName;
  late String displayName;
  late String money;

  FeedBack02Screen(this.shortName, this.displayName, this.money);

  @override
  _FeedBack02ScreenState createState() => _FeedBack02ScreenState();
}

class _FeedBack02ScreenState extends State<FeedBack02Screen> {
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

                    Text("Payment Sent Successfully",
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
                  Container(
                    alignment: Alignment.center,
                    width: width*0.10,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Text(widget.shortName,style: TextStyle(color: Blue1,fontSize: 20),),
                  ),
                  SizedBox(height: 10,),

                  Text("Pay "+widget.displayName,style: TextStyle(color: Colors.white,fontSize: 22),),
                  SizedBox(height: 10,),
                  Text("\$"+widget.money,style: TextStyle(color: Colors.white,fontSize: 46,fontWeight: FontWeight.w700),),

                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
