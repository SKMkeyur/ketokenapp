import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/Paint_Widgets/paint01.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/referearn.dart';
import 'package:share/share.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: height,
          width: width,
          child: Column(
            children: [
              // Container(
              //   height: height*.27,
              //   child: Paint01(),
              // ),
              Stack(
                children: [
                  Container(
                    height: height*.3,
                    child: Container(
                      width: width,
                      //  height: height*0.2,
                      child: Image.asset("graphic_res/offers_doodle.png",fit: BoxFit.contain,),
                    ),
                  ),

                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(FontAwesomeIcons.arrowLeft)))


                ],
              ),
               Divider(height: 2,thickness: 2,color: Colors.black,),
              Container(
                height: height*.10,
                //color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(0),
                        child: Text("Popular Offers!",style: TextStyle(fontSize: 26
                            ,color: Colors.black54,fontWeight: FontWeight.w500
                        ),textAlign: TextAlign.center,),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: height*.30,
                //color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ReferAndEarnScreen()));
                        },
                        child: Container(
                          height: height*0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Colors.grey)
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                Container(
                                  height: height*0.08,
                                  width: height*0.08,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child: Icon(FontAwesomeIcons.buffer),

                                ),
                                Container(
                                // height: height*0.08,
                                width: width*0.5,
                                child: Text(
                                  "Invite friend to Ketoken and \$2 cashback when your friend send thier first payment"
                                ),
                              ),
                                Container(
                                // height: height*0.08,
                                width: height*0.05,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    // shape: BoxShape.circle
                                ),
                                  child: Icon(FontAwesomeIcons.angleRight),
                              ),


                            ],
                          ),


                        ),
                      )
                    ],
                  ),
                ),
              )


            ],
          ),
        ),

      ),
    );
  }
}
