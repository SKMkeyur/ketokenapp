import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/Paint_Widgets/paint01.dart';
import 'package:ketoken/constants/style.dart';
import 'package:share/share.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({Key? key}) : super(key: key);

  @override
  _ReferAndEarnScreenState createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
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
              Container(
                height: height*.27,
                child: Paint01(),
              ),
              Container(
                height: height*.3,
                child: Container(
                  width: width,
                //  height: height*0.2,
                  child: Image.asset("graphic_res/referearndoodle.png",fit: BoxFit.contain,),
                ),
              ),
              Divider(height: 2,thickness: 2,color: Colors.black,),
              Container(
                height: height*.42,
                //color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                          Container(
                            height: height*0.09,
                            padding: EdgeInsets.all(10),
                            child: FittedBox(
                              child: Text("Refer a friend and get \$2 cashback",style: TextStyle(fontSize: 28
                              ,color: Colors.black,fontWeight: FontWeight.w500
                              ),textAlign: TextAlign.center,),
                            ),
                          ),
                      Container(
                        height: height*0.08,
                        child: Text("Invite friend to Ketoken and \$2 cashback when your friend send thier first payment",style: TextStyle(fontSize: 14
                            ,color: Colors.grey,
                        ),textAlign: TextAlign.center,),
                      ),
                      Container(
                        height: height*0.08,
                        padding: EdgeInsets.all(10),

                        child: TextField(

                          enabled: false,
                          decoration: InputDecoration(
                            suffixIcon: Icon(FontAwesomeIcons.solidCheckCircle,color: Colors.green,),
                            hintText: "Obsg82"
                          ),
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
                              Share.share('Download Ketoken App', subject: 'Its a Payment app');

                            },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color:RoyalBlue,
                                    borderRadius: BorderRadius.circular(40)),
                                child:   TextButton(
                                  child: FittedBox(child: Text("SHARE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600,wordSpacing: 3,letterSpacing: 2),)),
                                  onPressed: (){
                                    Share.share('Download Ketoken App', subject: 'Its a Payment app');

                                  },
                                )
                              //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ),
                      ),
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
