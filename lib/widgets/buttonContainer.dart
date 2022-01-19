import 'package:flutter/material.dart';
import 'package:ketoken/constants/style.dart';

class ButtonContainer extends StatefulWidget {

  late String name;
  late Color colorname;

  ButtonContainer(this.name,this.colorname);

  @override
  _ButtonContainerState createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;

    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return Container(
      width: width,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      height: height*0.09,
      color: Colors.white,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color:widget.colorname,
              borderRadius: BorderRadius.circular(40)),
          child:   TextButton(
            child: Text(widget.name,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
            onPressed: (){
              //print('hello');
            },
          )

        //Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
      ),
    );
  }
}
