import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ketoken/screens/paymoney.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  _ScanQrCodeScreenState createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  String result = "";
  Future _scanQR() async {
    var cameraStatus = await Permission.camera.status;

    if(cameraStatus.isGranted){
      try {
        String? cameraScanResult = await scanner.scan();
        setState(() {
          result = cameraScanResult!; // setting string result with cameraScanResult
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scanQR();
  }
  // String qrCode = 'Scan QR';
  // String _scanBarcode = 'Unknown';
  // Future<void> scanQRCode() async {
  //   try {
  //     final qrCode = await FlutterBarcodeScanner.scanBarcode(
  //       '#ff6666',
  //       'Cancel',
  //       true,
  //       ScanMode.QR,
  //     );
  //
  //     if (!mounted) return;
  //
  //     setState(() {
  //       this.qrCode = qrCode;
  //     });
  //   } on PlatformException {
  //     qrCode = 'Failed to get platform version.';
  //   }
  // }

  // Future<void> startBarcodeScanStream() async {
  //   FlutterBarcodeScanner.getBarcodeStreamReceiver(
  //       '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
  //       .listen((barcode) => print(barcode));
  // }
  //
  // Future<void> scanQR() async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.QR);
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _scanBarcode = barcodeScanRes;
  //   });
  // }
  //
  // // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> scanBarcodeNormal() async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.BARCODE);
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _scanBarcode = barcodeScanRes;
  //   });
  // }
  // Future<void> scanQRCode() async {
  //   try {
  //     final qrCode = await FlutterBarcodeScanner.scanBarcode(
  //       '#ff6666',
  //       'Cancel',
  //       true,
  //       ScanMode.QR,
  //     );
  //
  //     if (!mounted) return;
  //
  //     setState(() {
  //       this.qrCode = qrCode;
  //     });
  //   } on PlatformException {
  //     qrCode = 'Failed to get platform version.';
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Scan Result',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: '$result',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                    // recognizer: TapGestureRecognizer()
                    //   ..onTap = () {
                    //     // if (await canLaunch(url))
                    //     // await launch(url);
                    //     // else
                    //     // // can't launch url, there is some error
                    //     // throw "Could not launch $url";
                    //     print('Privacy Policy"');
                    //   },
                ),
              ),
              SizedBox(height: 72),
              TextButton(
                child: Text("Pay"),
                onPressed: (){
                  //scanBarcodeNormal();
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PayMoneyScreen())
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
