import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/Paint_Widgets/paint02.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/home.dart';

class FeedBack02NewScreen extends StatefulWidget {
  //const FeedBack02Screen({Key? key}) : super(key: key);

  late String shortName;
  late String displayName;
  late String money;

  FeedBack02NewScreen(this.shortName, this.displayName, this.money);

  @override
  _FeedBack02NewScreenState createState() => _FeedBack02NewScreenState();
}

class _FeedBack02NewScreenState extends State<FeedBack02NewScreen> {
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
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              color: Colors.transparent,
              alignment: Alignment.center,
              child:
              Container(
                padding: EdgeInsets.all(20),
                height: height1*0.5,
                width: width*0.81,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                            Icon(FontAwesomeIcons.solidCheckCircle,color: Blue1,size: 20,),
                            Text("Completed - 6 Jan, 11:52 am")
                      ],
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Text("Bank Name",style: TextStyle(color: Colors.black,fontSize: 38,fontWeight: FontWeight.w600),)
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("UPI Transaction ID",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w400),),
                            Text("2003990390293",style: TextStyle(fontSize: 22),)
                          ],
                        )
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("To: Ammuill Juil",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w400),),
                            Text("9903923920@API",style: TextStyle(fontSize: 22),)
                          ],
                        )
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("From: Justin Cabrial Juil",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w400),),
                            Text("Justin@hlhl",style: TextStyle(fontSize: 22),)
                          ],
                        )
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("Ketoken Transaction ID",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w400),),
                            Text("CIDGJSN0093092CN",style: TextStyle(fontSize: 22),)
                          ],
                        )
                    ),
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
                       Navigator.pop(context);
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
                  Text(widget.money,style: TextStyle(color: Colors.white,fontSize: 46,fontWeight: FontWeight.w700),),

                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
