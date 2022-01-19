import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  _HelpSupportScreenState createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
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
                    width: width,
                    child:
                    Stack(
                      children: [
                        Container(
                          width: width,
                          height: height*0.3,
                          child: Image.asset("graphic_res/helpsupport.jpg",fit: BoxFit.contain,),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                            child: InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(FontAwesomeIcons.arrowLeft)))
                      ],
                    ),
                  ),
                  Container(
                    height: height*0.1,
                    child: Text("Help & Support",style: TextStyle(
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

                  Container(
                    padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(20)

                      ),
                      height: height*0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("If you have any questions or comments about this, please contact us at",textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20,color: Colors.white),),
                          Text("ketoken@gmail.com",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,letterSpacing: 1),)
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
