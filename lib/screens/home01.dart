import 'dart:io';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/Paint_Widgets/paint01.dart';
import 'package:ketoken/Paint_Widgets/paint02.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/getredeem.dart';
import 'package:ketoken/screens/paymoney.dart';
import 'package:ketoken/screens/paymoneybycontact.dart';
import 'package:ketoken/screens/scanqrcode.dart';
import 'package:ketoken/screens/settings.dart';
import 'package:ketoken/widgets/buttonContainer.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:contacts_service_example/contacts_picker_page.dart';
import 'dart:math';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Transactions.dart';

import 'dart:math' as math;

const iOSLocalizedLabels = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Contact> contacts1 = [];
  late int _selectemenu;

  void initState() {
    _selectemenu =3;
    setState(() {
      refresh_contacts();
    });
    super.initState();
    _loadCounter();
  }

  var name;
  var email;

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {

      name = (prefs.getString('name') ?? 0);
      email = (prefs.getString('email') ?? 0);

    });
  }


  refresh_contacts() async{
    PermissionStatus permissionStatus = await _getContactPermission();
    if(permissionStatus==PermissionStatus.granted){
      var contacts = (await ContactsService.getContacts()).toList();
      setState(() {
        contacts1 =contacts;
      });
      // for(int i=0;i<contacts.length;i++){
      //  print(contacts[i].displayName.toString());
      // }
    }else{
      //print("Invalid Permission");
    }

  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await  Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }

  }


  @override
  Widget build(BuildContext context) {


    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe-barheight;

    BuildContext context1;
    context1 = context;
    return WillPopScope(
      // onWillPop: () async => false,
      onWillPop: ()=> exit(0),

      child: Scaffold(
        bottomNavigationBar:
        Container(
          color:Colors.white,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        //  margin: EdgeInsets.fromLTRB(0, height*0.62, 0, 0),
          alignment: Alignment.center,
          height: height*0.1,
          width: width,
          child: Container(
            padding: EdgeInsets.all(5),
            height: height*.1,
            width: width*0.9,
            decoration: BoxDecoration(
              // border: Border.all(
              //   color: Colors.grey,
              //   width: 2,
              // ),
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.grey,
                  //   offset: Offset(0.0, 1.0), //(x,y)
                  //   blurRadius: 1.0,
                  // ),
                ],
                // color: Colors.white,
                color: Color(0xff246ee9),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Fluttertoast.showToast(
                        msg: 'This is will redirect to Rewards Screen',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: DarkBlue,
                        textColor: Colors.white
                    );
                    // setState(() {
                    //   _selectemenu = 0;
                    // });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: height*0.06,
                        width: height*0.06,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle
                        ),
                        child: Icon(MdiIcons.tagOutline,color: Colors.white,size: 30,),
                      ),
                      Text("Rewards",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: VerticalDivider(color: Colors.grey,
                    thickness: 1,
                    width: 20,),
                ),
                InkWell(
                  onTap: (){
                    Fluttertoast.showToast(
                        msg: 'This is will redirect to Refer & Earn',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: DarkBlue,
                        textColor: Colors.white
                    );
                  },
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: height*0.06,
                        width: height*0.06,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle
                        ),
                        child: Icon(MdiIcons.giftOutline,color: Colors.white,size: 30,),
                      ),
                      Text("Refer & Earn",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  // Container(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(FontAwesomeIcons.gift,color: Colors.orange,size: 40,),
                  //       Text("Refer & Earn")
                  //
                  //     ],
                  //
                  //   ),
                  // ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: VerticalDivider(color: Colors.grey,
                    thickness: 1,
                    width: 20,),
                ),
                InkWell(
                  onTap: (){
                    Fluttertoast.showToast(
                        msg: 'This is will redirect to Offers',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: DarkBlue,
                        textColor: Colors.white
                    );
                  },
                  child: Container(
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: height*0.06,
                          width: height*0.06,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle
                          ),
                          child: Icon(FontAwesomeIcons.buffer,color: Colors.white,size: 30,),
                        ),
                        Text("Offers",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Icon(FontAwesomeIcons.gift,color:Colors.red,size: 40,),
                    //     Text("Offers")
                    //   ],
                    // ),
                  ),
                ),


              ],
            ),


          ),

        ),
        appBar: AppBar(
          toolbarHeight: 90,
          elevation: 0,
          backgroundColor: Color(0xff246ee9),
          actions: <Widget>[
            Container(

              padding: EdgeInsets.symmetric(horizontal: 40),
              //color: Colors.red,
              child:
              Stack(
                children: [
                  Center(
                    child: Container(
                      // height: height*0.09,
                      width: width*0.09,
                      //color: Colors.white,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(width*0.07, 0, 0, width*0.06),
                    alignment: Alignment.centerRight,
                    child: Container(
                      // height: height*0.09,
                      width: width*0.02,
                      //color: Colors.white,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ), //BoxShadow
                          ],
                          color: Colors.red,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),

        drawer: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
          child: Drawer(
              child:
              Container(
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height*.29,
                      child:
                      Stack(
                          children:[
                            CustomPaint(
                                painter: BluePainter(),
                                child: Container()
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: width,
                              height: height*.2933,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: height*0.08,
                                    width: height*0.08,
                                    // color: Colors.yellowAccent,
                                    decoration: BoxDecoration(
                                        color: Color(0xfff2f1ad),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 5,
                                        )
                                    ),
                                    child: Text("A",style: TextStyle(color: Colors.white,fontSize: 24),),

                                  ),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      width: width*0.33,
                                      child: Text(email.toString(),style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.start,)),

                                  Container(
                                    width: width*.08,
                                  )


                                ],
                              ),
                            )

                          ]
                      ),
                    ),
                    Container(
                      //   color: Colors.yellow,
                      width: width,
                      height: height*0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){

                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PayMoneyScreen())
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                leading: Icon(FontAwesomeIcons.moneyCheck,color: DarkBlue,size: 28),
                                title: Text("Money Transfer",style: TextStyle(fontSize: 18),),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(height: 0,thickness: 2,)),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => TransactionScreen())
                              );

                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                leading: Icon(FontAwesomeIcons.signal,color: DarkBlue,size: 28),
                                title: Text("All Transaction",style: TextStyle(fontSize: 18),),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(height: 0,thickness: 2,)),

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => GetRedeemScreen())
                              );

                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                leading: Icon(FontAwesomeIcons.ticketAlt,color: DarkBlue,size: 28),
                                title: Text("Rewards & Offers",style: TextStyle(fontSize: 18),),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(height: 0,thickness: 2,)),

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => SettingsScreen())
                              );
                              //  Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                leading: Icon(FontAwesomeIcons.sun,color: DarkBlue,size: 30,),
                                title: Text("Settings",style: TextStyle(fontSize: 18),),
                              ),
                            ),
                          ),



                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      height: height - height*0.5 - height*.2933,
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        //height: height*.2,
                        child: ButtonContainer("LOGOUT",DarkBlue),
                      ),
                    ),

                  ],
                ),
              )

            // ListView(
            //   // Important: Remove any padding from the ListView.
            //   padding: EdgeInsets.zero,
            //   children: [
            //     const DrawerHeader(
            //       decoration: BoxDecoration(
            //         color: Colors.blue,
            //       ),
            //       child: Text('Drawer Header'),
            //     ),
            //     ListTile(
            //       title: const Text('Item 1'),
            //       onTap: () {
            //         // Update the state of the app.
            //         // ...
            //       },
            //     ),
            //     ListTile(
            //       title: const Text('Item 2'),
            //       onTap: () {
            //         // Update the state of the app.
            //         // ...
            //       },
            //     ),
            //   ],
            // ),
          ),
        ),

        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Color(0xffeef1f2),
              width: width,
              height: height,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: height*.12,
                    decoration: BoxDecoration(
                        color: RoyalBlue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            alignment: Alignment.centerLeft,
                            width: width*.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(name.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.left,),
                                Text(email.toString(),
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 14),
                                  textAlign: TextAlign.left,
                                )

                              ],
                            )
                          // Text("Subscription",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),)
                        ),

                        Container(
                          //    color: Colors.red,
                          alignment: Alignment.center,
                          //  width: width*,
                          padding: EdgeInsets.fromLTRB(20, 10 , 30, 10),
                          // height: height*.12,

                          height: height*0.09,
                          // color: Colors.white,
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(40)),
                              child:   TextButton(
                                child: Text("ADD MONEY",style: TextStyle(color: DarkBlue,fontSize: 12,fontWeight: FontWeight.w600),),
                                onPressed: (){

                                  if (contacts1.isEmpty){
                                    print("No Data");
                                  }else{
                                    for (int i=0;i<contacts1.length;i++){
                                      print(contacts1[i].displayName);
                                    }
                                  }


                                  //print('hello');
                                },
                              )

                            //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                          ),
                        )




                      ],
                    ),

                  ),
                  Container(
                    // color: Colors.red,
                    color: Color(0xffeef1f2),
                    height: height*0.1,
                    width: width,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          alignment: Alignment.bottomLeft,
                          height: height*0.06,
                          child:
                          Text("Added Contacts",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
                        ),


                      ],
                    ),

                  ),

                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.75,
                minChildSize: 0.75,
                builder: (context,controller) =>
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                  ),

                  child: contacts1.length==0
                      ?
                  Container(
                    height: height*0.01,
                    width: width*0.3,
                    child: Center(
                      child: SpinKitFadingCircle(
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: index.isEven ? Colors.red : Colors.green,
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      :
                  GridView.count(
                      controller: controller,

                      // scrollDirection: Axis.vertical,
                      // shrinkWrap: true,
                      crossAxisCount: 4,
                      children:
                      List.generate(contacts1.length+1, (index) {
                        return
                          index == 0 ?
                          Center(
                            child: Container(
                                height: height*0.12,
                                // color: Colors.red,
                                child: InkWell(
                                  onTap: (){
                                    Fluttertoast.showToast(
                                        msg: 'This is will redirect to Add New Contact',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: DarkBlue,
                                        textColor: Colors.white
                                    );
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: height*0.07,
                                          width: height*0.07,
                                          decoration: BoxDecoration(
                                            // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                            // color: Colors.white,
                                            //  borderRadius: BorderRadius.circular(20),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: RoyalBlue,
                                                width: 2,
                                              )
                                          ),
                                          child: Icon(FontAwesomeIcons.plus,color: RoyalBlue,),
                                          //String? nullableString = contacts1[index].displayName;

                                        ),
                                        Container(
                                          child:
                                          Flexible(child: Text("Add New")),
                                        )

                                        // Text(contacts1[index].displayName).toString()+"")
                                      ],
                                    ),
                                  ),
                                )
                            ),
                          ) :
                          Center(
                              child: Container(
                                  height: height*0.12,
                                  // color: Colors.red,
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              PayMoneyByContactScreen(contacts1[index-1].displayName.toString(),
                                                  ((contacts1[index-1].displayName).toString().substring(0,1)
                                                      +""+(contacts1[index-1].familyName).toString().substring(0,1)).toString()
                                                  ,
                                                  contacts1)

                                      )
                                      );
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: height*0.07,
                                            width: height*0.07,
                                            decoration: BoxDecoration(
                                              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                             // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                                              //  borderRadius: BorderRadius.circular(20),
                                              shape: BoxShape.circle,
                                            ),
                                            //String? nullableString = contacts1[index].displayName;
                                            child: Text(
                                              (contacts1[index-1].displayName).toString().substring(0,1)
                                                  +""+(contacts1[index-1].familyName).toString().substring(0,1)
                                              ,
                                              style: TextStyle(
                                                color:Colors.white,

                                              ),
                                            ),

                                          ),
                                          Container(
                                            child:
                                            Flexible(child: Text(contacts1[index-1].givenName.toString())),
                                          )

                                          // Text(contacts1[index].displayName).toString()+"")
                                        ],
                                      ),
                                    ),
                                  )
                              )
                          );
                      })

                  ),
                )



                )

          ],
        ),

      ),
    );
  }
}
// Container(
//   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//   height: height*0.13,
//  // color: Colors.yellow,
//   child: Row(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Column(
//         children: [
//           Container(
//             height: height*0.07,
//             width: height*0.07,
//             decoration: BoxDecoration(
//               color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
//               shape: BoxShape.circle,
//             ),
//           ),
//           Container(
//             child:
//             Flexible(child: Text(contacts1[0].givenName.toString())),
//           )
//
//         ],
//       ),
//       Column(
//         children: [
//           Container(
//             height: height*0.07,
//             width: height*0.07,
//             decoration: BoxDecoration(
//               color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
//               shape: BoxShape.circle,
//             ),
//           ),
//           Container(
//             child:
//             Flexible(child: Text(contacts1[0].givenName.toString())),
//           )
//
//         ],
//       ),
//       Column(
//         children: [
//           Container(
//             height: height*0.07,
//             width: height*0.07,
//             decoration: BoxDecoration(
//               color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
//               shape: BoxShape.circle,
//             ),
//           ),
//           Container(
//             child:
//             Flexible(child: Text(contacts1[0].givenName.toString())),
//           )
//
//         ],
//       ),
//       Column(
//         children: [
//           Container(
//             height: height*0.07,
//             width: height*0.07,
//             decoration: BoxDecoration(
//               color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
//               shape: BoxShape.circle,
//             ),
//           ),
//           Container(
//             child:
//             Flexible(child: Text(contacts1[0].givenName.toString())),
//           )
//
//         ],
//       ),
//     ],
//   ),
//
// ),


class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    //  mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));


    ///////////////////////////////////////////////////////////////


    Path ovalPath6 = Path();
    // ovalPath6.lineTo(0, 0);
    ovalPath6.moveTo(0, 0);
    ovalPath6.lineTo(0, height*0.9);
    ovalPath6.lineTo(width, height*0.5);
    ovalPath6.lineTo(width , 0);

    // ovalPath4.
    // Close line to reset it back
    ovalPath6.close();
    paint.color =Yellow1;
    canvas.drawPath(ovalPath6, paint);

    Path ovalPath5 = Path();
    ovalPath5.moveTo(0, height * 0.9);
    //ovalPath.lineTo(0, 0);
    //ovalPath3.lineTo(width*0, height*0.94);
    ovalPath5.quadraticBezierTo(width*.90, height, width, height*.5);
    // Close line to reset it back
    ovalPath5.close();
    paint.color = Yellow1;
    canvas.drawPath(ovalPath5, paint);



    ///////////////////////////////////////////////////////////////


    Path ovalPath3 = Path();
    ovalPath3.moveTo(0, height * 0.9);
    //ovalPath.lineTo(0, 0);
    //ovalPath3.lineTo(width*0, height*0.94);
    ovalPath3.quadraticBezierTo(width*.8, height*.95, width, height*0.3);
    // Close line to reset it back
    ovalPath3.close();
    paint.color = Green1;
    canvas.drawPath(ovalPath3, paint);

    Path ovalPath4 = Path();
    ovalPath4.moveTo(0, 0);
    ovalPath4.lineTo(0, height*0.9);
    ovalPath4.lineTo(width, height*0.3);
    ovalPath4.lineTo(width , 0);
    //ovalPath2.quadraticBezierTo(width*.7, height*.5, width*.9, 0);
    // Close line to reset it back
    ovalPath4.close();
    paint.color =Green1;
    canvas.drawPath(ovalPath4, paint);

    ///////////////////////////////////////////////////////////////

    Path ovalPath = Path();
    ovalPath.moveTo(0, height * 0.9);
    //ovalPath.lineTo(0, 0);
    // ovalPath.lineTo(width*0, height*0.9);
    ovalPath.quadraticBezierTo(width*.8, height*.8, width, height*0.1);
    // Close line to reset it back
    ovalPath.close();
    paint.color =Blue1;
    canvas.drawPath(ovalPath, paint);

    Path ovalPath2 = Path();
    // ovalPath2.moveTo(0, 0);
    // ovalPath2.lineTo(x, y)
    ovalPath2.moveTo(0, 0);
    ovalPath2.lineTo(0, height*0.9);
    ovalPath2.lineTo(width, height*0.1);
    ovalPath2.lineTo(width , 0);
    //ovalPath2.quadraticBezierTo(width*.7, height*.5, width*.9, 0);
    // Close line to reset it back
    ovalPath2.close();
    paint.color = Blue1;
    canvas.drawPath(ovalPath2, paint);
    //
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}