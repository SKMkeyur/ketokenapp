import 'dart:io';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/Paint_Widgets/paint01.dart';
import 'package:ketoken/Paint_Widgets/paint02.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/main.dart';
import 'package:ketoken/screens/addnewcontact.dart';
import 'package:ketoken/screens/checkbalance.dart';
import 'package:ketoken/screens/faq.dart';
import 'package:ketoken/screens/getredeem.dart';
import 'package:ketoken/screens/offers.dart';
import 'package:ketoken/screens/paymoney.dart';
import 'package:ketoken/screens/paymoneybycontact.dart';
import 'package:ketoken/screens/profile.dart';
import 'package:ketoken/screens/referearn.dart';
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
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qrscan/qrscan.dart' as scanner;


import 'dart:math' as math;

import 'checkbalanceotp.dart';
import 'checkbalancepin.dart';

const iOSLocalizedLabels = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = "";
  Future _scanQR() async {
    var cameraStatus = await Permission.camera.status;

    if(cameraStatus.isGranted){
      try {
        String? cameraScanResult = await scanner.scan();
        setState(() {
          result = cameraScanResult!;
          if(result!=null){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => PayMoneyScreen())
            );
          }
          // setting string result with cameraScanResult
        });
      } on PlatformException catch (e) {
        print(e);
      }
    }else{
      var isGrant = await Permission.camera.request();

      if(isGrant.isGranted){
        String? cameraScanResult = await scanner.scan();
        setState(() {
          result = cameraScanResult!; // setting string result with cameraScanResult
        });
      }
    }
  }


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Contact> contacts1 = [];
  List<Contact> tempList = <Contact>[];
  bool showMore = false;
  late int listLength;
  String textshowmore="";

  late int _selectemenu;
  late int counter1=0;
  late int counter2=0;
  TextEditingController controller = TextEditingController();
  late bool isSearching = false;
  bool isLoading = false;


  ValueNotifier<bool> isDialOpen = ValueNotifier(false);


  void initState() {
     listLength = 20;
    isSearching = false;
    _selectemenu =3;
    setState(() {
      refresh_contacts();
    });
    super.initState();
     //_open = widget ?? false;
    _loadCounter();
  }

  var name;
  var email;

  List<Color> colors =
  [
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.cyan,
    Colors.green ,
    Colors.orange,
    Colors.lightBlue,
    Colors.teal ,
    Colors.deepPurple,
    Colors.brown,
  ];
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {

      name = (prefs.getString('name') ?? 0);
      email = (prefs.getString('email') ?? 0);

    });
  }
  _filterDogList(String text) {
    if(text.isEmpty){
      setState(() {
        contacts1 = tempList;
      });
    }
    else{
      final List<Contact> filteredBreeds = <Contact>[];
      tempList.map((breed){
        if(breed.displayName.toString().toLowerCase().contains(text.toString().toLowerCase())){
          filteredBreeds.add(breed);
        }
      }).toList();
      setState(() {
        contacts1 = filteredBreeds;

      });
    }
  }

  refresh_contacts() async{
    setState(() {
      isLoading = true;
    });
    PermissionStatus permissionStatus = await _getContactPermission();
    tempList = <Contact>[];

    if(permissionStatus==PermissionStatus.granted){
      var contacts = (await ContactsService.getContacts()).toList();
      // contacts.removeWhere((element) => element.displayName==null);
      // contacts.removeWhere((element) => element.displayName.toString().toLowerCase()=="unknown");
      // contacts.removeWhere((element) => element.displayName.toString()=="Unknown");
      contacts.removeWhere((element) => element.givenName==null);

      tempList = contacts;
      setState(() {
        contacts1 =tempList;
        isLoading = false;
        textshowmore="show more";
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

    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {

        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Logout"),
      onPressed:  () async {
        final prefs = await SharedPreferences.getInstance();
        setState(() {
          prefs.setString("screen", "RegisterScreen");
        });
        print("helllllloooooo");
        // Navigator.push(context, MaterialPageRoute(
        //     builder: (context) => MyApp())
        // );
        exit(0);

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout of your screen"),
      content: Text("Would you like to signout of the screen?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );



    void _loadCounter1(phone,identifier) async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setString(identifier, phone);
      });
    }


    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe-barheight;
    BuildContext context1;
    context1 = context;
    return WillPopScope(
      // onWillPop: () async => false,
      onWillPop: () => exit(0),
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,

          drawer: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
            child: Drawer(
                child:
                Container(
                  height: height,
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
                                      child: Text(name.toString().substring(0,1).toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 24),),

                                    ),
                                    Container(
                                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        width: width*0.33,
                                        child: Text(name.toString(),style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.start,)),
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
                                    builder: (context) => ProfileScreen())
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: ListTile(
                                  leading: Icon(FontAwesomeIcons.solidUser,color: DarkBlue,size: 28),
                                  title: Text("Profile",style: TextStyle(fontSize: 18),),
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(height: 0,thickness: 2,)),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => CheckBalanceOtpScreen()
                                )
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: ListTile(
                                  leading: Icon(FontAwesomeIcons.wallet,color: DarkBlue,size: 28),
                                  title: Text("Check Balance",style: TextStyle(fontSize: 18),),
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
                                  leading: Icon(FontAwesomeIcons.exchangeAlt,color: DarkBlue,size: 28),
                                  title: Text("All Transaction",style: TextStyle(fontSize: 18),),
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(height: 0,thickness: 2,)),
                            // InkWell(
                            //   onTap: (){
                            //     Navigator.push(context, MaterialPageRoute(
                            //         builder: (context) => FaqScreen())
                            //     );
                            //   },
                            //   child: Container(
                            //     padding: EdgeInsets.all(10),
                            //     child: ListTile(
                            //       leading: Icon(FontAwesomeIcons.solidQuestionCircle,color: DarkBlue,size: 28),
                            //       title: Text("FAQ",style: TextStyle(fontSize: 18),),
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //     padding: EdgeInsets.symmetric(horizontal: 20),
                            //     child: Divider(height: 0,thickness: 2,)),
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
                          child: InkWell(
                            onTap: () async {

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                },
                              );
                              // _loadCounter1("RegisterScreen",'screen');
                              // final prefs = await SharedPreferences.getInstance();
                              // setState(() {
                              //   prefs.setString("screen", "RegisterScreen");
                              // });
                              // print("helllllloooooo");
                              // // Navigator.push(context, MaterialPageRoute(
                              // //     builder: (context) => MyApp())
                              // // );
                              // exit(0);
                            },
                              child:


                              Container(
                                width: width,
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                height: height*0.09,
                                color: Colors.white,
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color:RoyalBlue,
                                        borderRadius: BorderRadius.circular(40)),
                                    child:   TextButton(
                                      child: Text("LOGOUT",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                                      onPressed: () async {

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alert;
                                          },
                                        );

                                      },
                                    )

                                  //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                                ),
                              )
                          ),
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
          floatingActionButtonLocation:  FloatingActionButtonLocation.endDocked,
          floatingActionButton:
          SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            openCloseDial: isDialOpen,
            backgroundColor: RoyalBlue,
            overlayColor: Colors.grey,
            overlayOpacity: 0.5,
            spacing: 15,
            spaceBetweenChildren: 15,
            closeManually: false,
            children: [
              SpeedDialChild(
                  child: Icon(MdiIcons.tagOutline),
                  label: 'Rewards',
                  backgroundColor: Colors.white,
                  onTap: (){
                    print('Share Tapped');
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => GetRedeemScreen()));
                  }
              ),
              SpeedDialChild(
                  child: Icon(MdiIcons.giftOutline),
                  label: 'Refer & Earn',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ReferAndEarnScreen()));
                    print('Mail Tapped');
                  }
              ),
              SpeedDialChild(
                  child: Icon(FontAwesomeIcons.buffer),
                  label: 'Offers',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => OffersScreen()));
                    print('Copy Tapped');
                  }
              ),
              // add multiple SpeedDialChild
            ],
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
                      // height: height*.12+90,
                      height: height*.22,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            opacity: 1,
                            alignment: Alignment.bottomLeft,
                            scale: 1,
                            image: AssetImage("graphic_res/home2.png"),
                            fit: BoxFit.contain,
                          ),
                          color: RoyalBlue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          )
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: height*.22/2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  InkWell(
                                      onTap: () => _scaffoldKey.currentState?.openDrawer(),
                                      child: Icon(Icons.menu,color: Colors.white,)
                                  ),
                                Container(
                                    width: width*0.5,
                                    child:
                                    isSearching == false ?
                                    Text("",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)
                                        : TextField(
                                      style: TextStyle(color: Colors.white),

                                        controller: controller,
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(color: Colors.white),
                                          hintText: "Enter Name",
                                          icon: Icon(Icons.search,color: Colors.white,),
                                        ),
                                        onChanged: (text){
                                          _filterDogList(text);
                                        }
                                      //onSearchTextChanged,
                                    ),
                                ),
                                InkWell(
                                    onTap: (){

                                    },
                                    child:
                                    isSearching==true
                                        ?
                                    IconButton(
                                      padding: EdgeInsets.fromLTRB(0, 0,0, 0),
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isSearching==false?isSearching=true:isSearching=false;
                                        //  listLength=16;
                                        //   showMore=false;
                                        //   textshowmore="show more";
                                         // controller.text("hello");
                                          controller.text="";
                                          _filterDogList("");
                                        });
                                        // focusNode.requestFocus();
                                      },
                                    )
                                        :
                                    IconButton(
                                      padding: EdgeInsets.fromLTRB(0, 0,0, 0),
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isSearching==false?isSearching=true:isSearching=false;
                                          // showMore=true;
                                       //   listLength=contacts1.length+1;
                                       //    textshowmore="show less";
                                        });
                                        //  focusNode.requestFocus();
                                      },
                                    )
                                    //Icon(Icons.search,color: Colors.white,)
                                ),
                              ],
                            ),
                          ),
                          Row(
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
                                      // Text(name.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.left,),
                                      // Text(email.toString(),
                                      //   style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 14),
                                      //   textAlign: TextAlign.left,
                                      // )
                                    ],
                                  )
                                // Text("Subscription",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),)
                              ),
                              Container(
                                width: width*0.45,
                                //    color: Colors.red,
                                alignment: Alignment.center,
                                //  width: width*,
                                padding: EdgeInsets.fromLTRB(10, 10 , 10, 10),
                                // height: height*.12,
                                height: height*0.09,
                                // color: Colors.white,
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(40)),
                                    child:   TextButton(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(FontAwesomeIcons.qrcode,size: 18,),

                                          FittedBox(child: Text("Scan QR Code",style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w600),)),
                                        ],
                                      ),
                                      onPressed: (){
                                        // Navigator.push(context, MaterialPageRoute(
                                        //     builder: (context) => ScanQrCodeScreen())
                                        // );
                                        _scanQR();
                                        // if (contacts1.isEmpty){
                                        //   print("No Data");
                                        // }else{
                                        //   for (int i=0;i<contacts1.length;i++){
                                        //     print(contacts1[i].displayName);
                                        //   }
                                        // }
                                        //print('hello');
                                      },
                                    )

                                  //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                                ),
                              )




                            ],
                          ),
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
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            alignment: Alignment.bottomLeft,
                            height: height*0.06,
                            child:
                            Text("Welcome, "+name.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
                          ),


                        ],
                      ),

                    ),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                  // initialChildSize: 0.67,
                  // minChildSize: 0.67,
                  initialChildSize: 0.7,
                  minChildSize:  0.7,
                  maxChildSize:  textshowmore == "show more" ?  0.7 : 1,
                  builder: (context,controller) =>
                      ListView(
                        //physics: BouncingScrollPhysics(),
                        controller: controller,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: height*0.05,
                              padding: EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                            ),
                            child:
                            Text("Added Contacts",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                //borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                            ),
                            child:
                     //   contacts1.length==0
                              isLoading==true
                                ?
                            Container(
                              //color: Colors.red,
                              height: height*0.68,
                              width: width*0.3,
                              child: Center(
                                child:
                                CircularProgressIndicator()
                              ),
                            )
                                :
                            GridView.count(
                              childAspectRatio:
                              (MediaQuery.of(context).size.width)*2.1 /
                                  (MediaQuery.of(context).size.height)
                              ,
                              mainAxisSpacing: 0,
                                 shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                             //   controller: controller,
                                // scrollDirection: Axis.vertical,
                                // shrinkWrap: true,
                                crossAxisCount: 4,
                                children:
                                List.generate( isSearching==true ? contacts1.length+2 : listLength, (index) {
                                   var ind1 = isSearching==true ? contacts1.length+1 : listLength-1;
                                  return
                                    index == 0
                                        ?
                                       Center(child: Container(
                                          height: height*0.10,
                                              // color: Colors.red,
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(
                                                  builder: (context) => AddNewContactScreen()
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
                                                    height: height*0.03,
                                                    child:
                                                    Text("Add New"),
                                                  )

                                                  // Text(contacts1[index].displayName).toString()+"")
                                                ],
                                              ),
                                            ),
                                          )
                                       ),
                                       )
                                        :
                                    index == ind1 ?
                                       Center(child: InkWell(
                                           onTap: (){
                                             setState(() {
                                               showMore = !showMore;

                                               if(showMore==true){
                                                 textshowmore="show less";
                                                 listLength = contacts1.length+1;
                                               }else{
                                                 textshowmore="show more";
                                                 listLength=20;
                                               }
                                               print(showMore);
                                             });
                                           },
                                           child:
                                           Container(
                                               height: height*0.10,
                                               // color: Colors.red,
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
                                                       child: Icon(
                                                         textshowmore == "show less" ?
                                                         FontAwesomeIcons.angleUp
                                                             :
                                                         FontAwesomeIcons.angleDown,
                                                         color: RoyalBlue,),
                                                       //String? nullableString = contacts1[index].displayName;

                                                     ),
                                                     Container(
                                                       child:
                                                       Flexible(child: Text(textshowmore,style: TextStyle(color: Colors.black),)),
                                                     )

                                                     // Text(contacts1[index].displayName).toString()+"")
                                                   ],
                                                 ),
                                               )
                                           )
                                         // Text(textshowmore,)

                                       ),)
                                        :
                                    Center(
                                        child: Container(
                                            height: height*0.10,
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
                                                        color: colors[(index-1)%10],
                                                        //Colors.primaries[Random().nextInt(Colors.primaries.length)],
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
                                }),


                            ),
                          ),

                        ],
                      )
              )

            ],
          ),

        ),
      ),
    );
  }
}



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