import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio/internet_connection.dart';
import 'package:radio/my_home_page.dart';

void main() {
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const MyHomePage(),
            );
  }
}





// import 'package:flutter/material.dart';
// import 'package:radio/my_home_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Connectivity Checker',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }



// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:radio/my_home_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late StreamSubscription subscription;
//   bool isDeviceConnected = false;
//   bool isAlertSet = false;

//   @override
//   void initState() {
//     getConnection();
//     super.initState();
//   }

//   showDialogBox() {
//   return  showCupertinoDialog(context: context, builder:  (context)=> CupertinoAlertDialog(
//       title:const  Text('No Connection'),
//       content: const Text('Please check your internet Connectivity'),
//       actions: [TextButton(onPressed: (){
//         Navigator.pop(context);
//         setState(() async{
//           isAlertSet=false;
//           isDeviceConnected=await InternetConnectionChecker().hasConnection;
//           if (!isDeviceConnected) {
//             showDialogBox();
//             setState(() {
//               isAlertSet=true;
//             });
            
//           } else {
            
//           }
//         });
//       }, child: const Text('ok'))],
//     ));
//   }

  // getConnection() {
  //   subscription = Connectivity().onConnectivityChanged.listen((event) {
  //     (ConnectivityResult result) async {
  //       isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //       if (!isDeviceConnected && isAlertSet == false) {
  //         showDialogBox();
  //         setState(() {
  //           isAlertSet = true;
  //         });
  //       }
  //     };
  //   });
  // }

//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

/* 
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ConnectivityResult _connectivityResult = ConnectivityResult.none;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    // printIps();
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        if (result is ConnectivityResult) {
          _connectivityResult = result as ConnectivityResult ;
        } else if (result.isNotEmpty) {
          _connectivityResult = result.first;
        } else {
          _connectivityResult = ConnectivityResult.none;
        }
      });
    });
  }

  Future<void> initConnectivity() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      setState(() {
        if (connectivityResult is ConnectivityResult) {
          _connectivityResult = connectivityResult as ConnectivityResult;
        } else if (connectivityResult.isNotEmpty) {
          _connectivityResult = connectivityResult.first;
        } else {
          _connectivityResult = ConnectivityResult.none;
        }
      });
    } catch (e) {
      print('Error checking connectivity: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const  Text('Network Connectivity Example'),
        ),
        body: Center(
          child: Text('Network Status: $_connectivityResult'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
 */




// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:radio/connectivity_provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => ConnectivityService(),
//       builder: (context, _) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         navigatorKey: navigatorKey,
//         home: const FirstView(),
//       ),
//     );
//   }
// }

// class FirstView extends StatefulWidget {
//   const FirstView({Key? key}) : super(key: key);

//   @override
//   _FirstViewState createState() => _FirstViewState();
// }

// class _FirstViewState extends State<FirstView> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<ConnectivityService>(context, listen: false).initConnectivity();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final connectivityService = context.watch<ConnectivityService>();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Network Connectivity Example'),
//       ),
//       body: Center(
//         child: Text(
//           'Network Status: ${connectivityService.connectivityResult}',
//         ),
//       ),
//     );
//   }
// }
