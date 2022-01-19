import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketoken/constants/style.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
                height: height*0.25,
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: height*0.25,
                      child: Image.asset("graphic_res/logo.png",fit: BoxFit.contain,),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(FontAwesomeIcons.arrowLeft)),
                    )
                  ],
                ),
              ),
              Container(
                height: height*0.1,
                child: Text("About Ke Token",style: TextStyle(
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
              Container(
                height: height*0.65,
                child: CustomScrollView(
                  slivers: [
                    SliverList(delegate: SliverChildListDelegate(
                      [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blue, borderRadius: BorderRadius.circular(20)

                            ),
                            //height: height*0.3,
                            child: Text("Ke Token is an online payment system application to power in-app, online, and in-person contactless transactions on mobile devices, allowing users to pay with their smartphones"+
                            "Ke Token is a safer and more convenient way to pay and receive money online. Anyone can use the service to pay in any way they want, including credit cards and bank accounts, without having "
                            "to share their financial information.",textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20,color: Colors.white),),

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.green, borderRadius: BorderRadius.circular(20)

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("It's a simple way to send or receive money to or from anyone",
                                textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,
                                    letterSpacing: 1),),
                                SizedBox(height: 10,),

                                Text("Send or receive money from your bank account to almost anyone with no "
                                    "service charges. Even if your contact is not on Ke Token, you can "
                                    "receive or send money. Pay for rent, send money to relatives, "
                                    "or split lunch with a friend.",textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18,color: Colors.white),),

                              ],
                            ),

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.red, borderRadius: BorderRadius.circular(20)

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Shopping, recharging, and other activities are available",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,
                                      letterSpacing: 1),),
                                SizedBox(height: 10,),
                                Text("On Ke Token, you can recharge your phone with a single "
                                    "tap and pay your monthly bills. You can now go shopping, "
                                    "whether online or in a store. We've got you covered with "
                                    "easy access to previous transactions, so you're in command "
                                    "at all times. It can be used anywhere you see UPI or Ke Token.",textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18,color: Colors.white),),

                              ],
                            ),

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.brown, borderRadius: BorderRadius.circular(20)

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Reward systems that never run out of steam",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,
                                      letterSpacing: 1),),
                                SizedBox(height: 10,),
                                Text("As you use Ke Token, you can earn scratch cards and other rewards. There's no need to look for coupon codes. If you win, your winnings will be deposited directly into your bank account. "
                                   ,textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18,color: Colors.white),),

                              ],
                            ),

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.pink, borderRadius: BorderRadius.circular(20)

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("You have money in your account",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,
                                      letterSpacing: 1),),
                                SizedBox(height: 10,),
                                Text("Using your existing bank accounts, you can send and receive money instantly. There are no more withdrawal fees or reloading mobile wallet balances. It's your money, simplified."
                                  ,textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18,color: Colors.white),),

                              ],
                            ),

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.orange, borderRadius: BorderRadius.circular(20)

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Your money is safe",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,
                                      letterSpacing: 1),),
                                SizedBox(height: 10,),
                                Text("Ke Token safeguards your funds with a cutting-edge security system that aids in the detection of fraud and the prevention of hacking. Use a screen lock, such as your fingerprint, to protect your account. If you have any questions, please refer to the 'FAQ' section of the app."
                                  ,textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18,color: Colors.white),),

                              ],
                            ),

                          ),
                        ),

                      ]
                    ))
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
