import 'package:flutter/material.dart';
import 'package:radio/second_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondScreen(),
                )),
            child: const Text('Second Screen')),
      ),
    );
  }
}
// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:radio/second_screen.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late StreamSubscription subscription;
//   bool isDeviceConnected = false;
//   bool isAlertSet = false;

//   @override
//   void initState() {
//     getConnection();
//     super.initState();
//   }
   

//   getConnection() {
//   subscription = Connectivity().onConnectivityChanged.listen((event) {
//     if (event != ConnectivityResult.none) {
//       showDialogBox();
//       setState(() {
//         isAlertSet = false;
//       });
//     } else {
//       // Device is disconnected, show the dialog if it's not already shown
//       if (!isAlertSet) {
//         showDisconnectedDialog();
//       }
//     }
//   });
// }

// Future<void> showDisconnectedDialog() async {
//   bool isConnected = await InternetConnectionChecker().hasConnection;
//   if (!isConnected) {
//     showDialogBox();
//     setState(() {
//       isAlertSet = true;
//     });
//   }
// }


//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Connectivity Checker'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const SecondScreen()),
//           ),
//           child: const Text('Next Page'),
//         ),
//       ),
//     );
//   }

//   showDialogBox() => showCupertinoDialog<String>(
//         context: context,
//         builder: (BuildContext context) => CupertinoAlertDialog(
//           title: const Text('No Connection'),
//           content: const Text('Please check your internet connectivity'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () async {
//                 Navigator.pop(context, 'Cancel');
//                 setState(() => isAlertSet = false);
//                 isDeviceConnected =
//                     await InternetConnectionChecker().hasConnection;
//                 if (!isDeviceConnected && isAlertSet == false) {
//                   showDialogBox();
//                   setState(() => isAlertSet = true);
//                 }
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
// }
