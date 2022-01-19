import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {

  final List<MyItem> _items = <MyItem>[
    MyItem(header: "1. Is it possible to get Ke Token from the Google Play Store?",
        body: "Yes, the Ke Token app is available for download from the Google Play Store."),
    MyItem(header: "2. Which mobile number should I use to register for Ke Token?",
        body: "You can register on Ke Token with any mobile number you want as long as you have access to it at the time of registration because the OTP to complete the registration will be sent to your phone."
            "\nPlease note that the following is required in order to add a payment method to Ke Token:"
            "\n·  To add a credit/debit card to Ke Token, make sure you have access to the card's associated mobile number, as you'll be sent an OTP to that number."
            "\n·   To add a bank account to Ke Token via UPI, make sure you've already registered with the phone number associated with your account."),
    MyItem(header: "3. Is my sensitive card information stored by Ke Token?",
        body: "Ke Token does not store any of your sensitive card details on the device or the server, including the full 16-digit card number, CVV, or expiry date."),

    MyItem(header: "4. Does a Ke Token payment go directly to the bank account?",
        body: "Money can be transferred from your Ke Token to a linked bank account or debit card. The transaction with your bank account can take up to 1-3 business days."),

    MyItem(header: "5. Is Ke Token a safe platform?",
        body: "Ke Token uses one of the world's most advanced security infrastructures to help keep your account safe by encrypting your payment information with multiple layers of security. Ke Token does not share your actual card number when you pay in stores, so your information is safe."),

    MyItem(header: "6 Is a PIN from an ATM required for Ke Token?",
    body: "Google has provided some guidelines that users should follow at all times. The only time you'll need your UPI PIN is to send money. Receiving does not necessitate the use of a PIN. If you are asked to enter a PIN, it means you are authorizing an outgoing payment."),

    MyItem(header: "7. Is the UPI pin and the ATM pin the same thing?",
  body: "No, UPI and ATM Pin are not interchangeable terms. When registering a bank account in UPI apps, a UPI Pin is generated. Your Debit/Credit Card's ATM Pin is a four-digit number that is unique to you."),

    MyItem(header: "8. How long does it take for Ke Token to be processed?",
        body: "Transactions with Ke Token balance are usually quick. The transaction with your debit card is usually quick. It could take up to 24 hours in some cases. The transaction with your bank account can take up to 3–5 business days."),

    MyItem(header: "9. Is mobile data required for Ke Token?",
        body: "To add a card to Ke Token, to replenish security settings, and after a device restart, you'll need a mobile data or Wi-Fi connection."),

  ];


  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                height: height*0.3,
                width: width,
                decoration: BoxDecoration(
                //  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage(
                        'graphic_res/faq.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
                child:

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: Icon(FontAwesomeIcons.arrowLeft,color:RoyalBlue,))),
              ),
              Container(
                child: Text("FAQ",style: TextStyle(
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
              Container(height: height*0.02,),
              Container(

                height: height*0.6,
                width: width,
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                          [
                            ExpansionPanelList(
                              dividerColor: Color(0xffdedede),
                              elevation: 0,
                              expansionCallback: (int index,bool isExpanded){
                                setState(() {
                                  _items[index].isExpanded = !_items[index].isExpanded;
                                });
                              },
                              children: _items.map((MyItem item){
                                return ExpansionPanel(
                                    canTapOnHeader: true,
                                    headerBuilder: (BuildContext context,bool isExpanded){
                                      return Container(
                                          padding: EdgeInsets.fromLTRB(30, 15, 0, 15),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                           //   Icon(Icons.adjust,color:  Color(0xff57bbb4),),
                                           //   SizedBox(width: 10,),
                                              Flexible(child:
                                              Text(item.header,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),)),
                                            ],
                                          ));
                                    },
                                    isExpanded: item.isExpanded,
                                    body: Row(
                                      children: [

                                        Container(

                                          width: width,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 2),
                                          decoration:
                                          BoxDecoration(
                                              color: Color(0xffffffff),
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                          ),
                                          child: Text(
                                            item.body,style: TextStyle(
                                            color:Color(0xff989898),
                                          ),
                                          ),
                                        ),

                                      ],
                                    )
                                );
                              }).toList(),

                            )

                          ]
                      ),
                    ),
                  ]

                ),

              )
            ],
          ),
        ),

      ),
    );
  }
}

class MyItem{
  late bool isExpanded;
  late final String header;
  late final String body;

  MyItem({this.isExpanded:false, required this.header, required this.body});
}