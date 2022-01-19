import 'package:flutter/material.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/screens/phonenumber.dart';

class ButtonContainer01 extends StatefulWidget {

  late Widget class1;
  late String name;
  late Color colorname;

  ButtonContainer01(this.name,this.colorname);

  @override
  _ButtonContainer01State createState() => _ButtonContainer01State();
}

class _ButtonContainer01State extends State<ButtonContainer01> {
  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;

    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return
      Container(
      width: width,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      height: height*0.09,
      color: Colors.white,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color:DarkPurple,
              borderRadius: BorderRadius.circular(40)),
          child:   TextButton(
            child: Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
            onPressed: (){
              //print('hello');
            },
          )

        //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
      ),
    );
  }
}
