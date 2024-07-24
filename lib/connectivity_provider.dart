
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class ConnectivityService with ChangeNotifier {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  ConnectivityResult get connectivityResult => _connectivityResult;

  void initConnectivity() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      _updateConnectivityResult(connectivityResult as ConnectivityResult);
    } catch (e) {
      print('Error checking connectivity: $e');
    }
  }

  void _updateConnectivityResult(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      print(ConnectivityResult);
      _connectivityResult = result;
      showSnackbar();
    } else {
      _connectivityResult = result;
    }
    notifyListeners();
  }

  void updateConnectivity(ConnectivityResult result) {
    _updateConnectivityResult(result);
  }

  void showSnackbar() {
    const snackBar = SnackBar(
      content: Text('No Internet Connection'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }
}