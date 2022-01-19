import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var name;
  var email;
  var phone;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {

      name = (prefs.getString('name') ?? 0);
      email = (prefs.getString('email') ?? 0);
      phone = (prefs.getString('counter') ?? 0);


    });
  }


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
          color: Colors.white,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: height*0.3,
                  width: width,
                  child: Container(
                    height: height*0.15,
                    width: height*0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: RoyalBlue,
                    ),

                    child: Icon(FontAwesomeIcons.solidUser,color: Colors.white,size: 40,),
                  ),
                ),
                Container(
                  height: height*0.5,
                  child: Column(

                    children: [
                      Text(name.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text(email.toString()),
                      SizedBox(height: 10,),
                      Text(phone.toString()),

                    ],
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}
