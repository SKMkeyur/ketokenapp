import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/personaldetails.dart';
import 'package:ketoken/widgets/buttonContainer.dart';

class SubScriptionScreen extends StatefulWidget {
  const SubScriptionScreen({Key? key}) : super(key: key);

  @override
  _SubScriptionScreenState createState() => _SubScriptionScreenState();
}
class _SubScriptionScreenState extends State<SubScriptionScreen> {

  late int _selected ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selected = 4;

    });
  }
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Select the Subscription'),
       // action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;


    return Scaffold(
          body: Container(
            height: height1,
            width: width,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                        width: width*.33,
                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        },
                          icon: Icon(FontAwesomeIcons.chevronLeft),color: Colors.white,),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: width*.33,
                          child: Text("Subscription",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),)),
                      Container(
                        width: width*.33,
                        // child: Text("data",style: TextStyle(color: DarkBlue ),)),
                      )
                    ],
                  ),

                ),
                Container(
                  height: height1*.073,
                ),
                Container(
                  height: height1*.6078,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(_selected==0){
                              _selected =4;
                            }else{
                              _selected = 0;
                            }
                          });
                        },
                        child: Container(
                          height: height1*.187,
                          width: width*.883,
                          decoration: BoxDecoration(
                            color: LightGreen,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,

                              width: _selected == 0 ? 10 : 0,
                            )
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Container(
                                    height: height1*0.09,
                                      width: height1*0.09,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                          shape: BoxShape.circle,
                                         // borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                    child: Icon(FontAwesomeIcons.star,size: 40,),
                                  ),
                                ),
                                FittedBox(
                                  child: Text("Platinum",style: TextStyle(fontSize: 30,
                                      fontWeight: _selected == 0 ? FontWeight.w600 : FontWeight.w400
                                  ),),
                                )
                              ],
                            ),
                          ),

                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(_selected==1){
                              _selected =4;
                            }else{
                              _selected = 1;
                            }
                          });
                        },
                        child: Container(
                          height: height1*.187,
                          width: width*.883,
                          decoration: BoxDecoration(
                              color: LightRed,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black,

                                width: _selected == 1 ? 10 : 0,
                              )
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Gold",style: TextStyle(fontSize: 30,
                                    fontWeight: _selected == 1 ? FontWeight.w600 : FontWeight.w400),),
                                Container(
                                  child: Container(
                                    height: height1*0.09,
                                    width: height1*0.09,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      // borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Icon(FontAwesomeIcons.eye,size: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(_selected==2){
                              _selected =4;
                            }else{
                              _selected = 2;
                            }
                          });
                        },
                        child: Container(
                          height: height1*.187,
                          width: width*.883,
                          decoration: BoxDecoration(
                              color: LightBlue,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black,

                                width: _selected == 2 ? 10 : 0,
                              )
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Container(
                                    height: height1*0.09,
                                    width: height1*0.09,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      // borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Icon(FontAwesomeIcons.bolt,size: 40,),
                                  ),
                                ),
                                Text("Silver",style: TextStyle(fontSize: 30,
                                    fontWeight: _selected == 2 ? FontWeight.w600 : FontWeight.w400),)
                              ],
                            ),
                          ),

                        ),
                      ),

                      // Container(
                      //   height: height1*.187,
                      //   width: width*.883,
                      //   decoration: BoxDecoration(
                      //       color: LightRed,
                      //       borderRadius: BorderRadius.circular(20)
                      //   ),
                      // ),
                      // Container(
                      //   height: height1*.187,
                      //   width: width*.883,
                      //   decoration: BoxDecoration(
                      //       color: LightBlue,
                      //       borderRadius: BorderRadius.circular(20)
                      //   ),
                      // ),


                    ],
                  ),
                ),
                Container(
                  height: height1*.053,
                ),
               // ButtonContainer("Next",DarkBlue)
                Container(
                  width: width,
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  height: height*0.09,
                  color: Colors.white,
                  child: InkWell(
                    onTap: (){
                      print("helo");
                      // PhoneNumberScreen();
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PersonalDetailsScreen())
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color:DarkPurple,
                            borderRadius: BorderRadius.circular(40)),
                        child:   TextButton(
                          child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                          onPressed: (){
                            _selected == 4 ? _showToast(context) :

                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => PersonalDetailsScreen())
                            );
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
    );
  }
}
