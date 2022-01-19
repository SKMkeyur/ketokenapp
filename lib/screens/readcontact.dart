
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:ketoken/models/contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class Pagel extends StatefulWidget {
  const Pagel({Key? key}) : super(key: key);

  @override
  _PagelState createState() => _PagelState();
}

class _PagelState extends State<Pagel> {

  @override
  void initState() {
    refresh_contacts();
    // TODO: implement initState
    super.initState();
  }

  refresh_contacts() async{
    PermissionStatus permissionStatus = await _getContactPermission();
    if(permissionStatus==PermissionStatus.granted){
      var contacts = (await ContactsService.getContacts()).toList();
      for(int i=0;i<contacts.length;i++){
       // contacts[0].
        print(contacts[i].displayName.toString());
      }
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
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: InkWell(

          onTap: (){
            refresh_contacts();
          },
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blue,

          ),
        ),
      ),
    );
  }
}
