import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';
import 'package:ketoken/models/transactiondata.dart';
import 'package:ketoken/screens/feedback02new.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    int _roundcolorcount = 0;
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    int _selectedOption = 0;
    int transaction_lenth = transactions.length;
  // // Color _colors[] = new _colors[transaction_lenth];

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
                      child: Text("Transactions",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),)),
                  Container(
                    width: width*.33,
                    // child: Text("data",style: TextStyle(color: DarkBlue ),)),
                  )
                ],
              ),
            ),
            Container(
              //color: Colors.white,
              width: width,
              padding: EdgeInsets.all(10),
                height: height1-height1*.1586,
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                slivers: [

                  SliverList(delegate: SliverChildListDelegate(
                      List.generate(transactions.length, (idx) {
                        return
                          Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child:
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => FeedBack02NewScreen("JC", "Justin Cabrial", transactions[idx].money.toString()))
                              );
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration:BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: height1*0.1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: height1*0.06,
                                      width: height1*0.06,
                                      decoration: BoxDecoration(
                                        color: colors[idx].color1,
                                        //color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(transactions[idx].shortform,
                                        style: TextStyle(color: Colors.white,fontSize: 18),),
                                    ),
                                  ),

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: width*0.4,
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(transactions[idx].title,style: TextStyle(fontSize: 20),),
                                          Text(transactions[idx].time,style: TextStyle(fontSize: 14,color: Colors.grey),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(transactions[idx].money,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                        Text(transactions[idx].status,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color:
                                              transactions[idx].status == "SUCCESS" ? Colors.green : Colors.red
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            ),
                          ),
                        );
                      })
                  ))


                ],
              ),

            )

          ],
        ),
      ),

    );
  }
}
