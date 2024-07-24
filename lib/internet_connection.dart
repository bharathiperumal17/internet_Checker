import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity connect = Connectivity();

  void updateConnectionStatus(dynamic connectivityResult) {
    if (connectivityResult is List<ConnectivityResult>) {
      bool hasNoConnection =
          connectivityResult.contains(ConnectivityResult.none);
      if (hasNoConnection) {
        Get.to(const NoInternetScreen());
        showNoConnectionSnackbar();
      } else {
        // Close any open NoInternetScreen (optional)
        closeSnackbarIfOpen();
      }
    } else if (connectivityResult is ConnectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        Get.to(const NoInternetScreen());
        showNoConnectionSnackbar();
      } else {
        // Close any open NoInternetScreen (optional)
        closeSnackbarIfOpen();
      }
    } else {
      print('Unexpected data type received: $connectivityResult');
    }
  }

  void showNoConnectionSnackbar() {
    if (!Get.isSnackbarOpen) {
      Get.rawSnackbar(
        message: 'No Internet Connection',
        isDismissible: false,
        duration: null,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(20),
        snackStyle: SnackStyle.FLOATING,
      );
    }
  }

  void closeSnackbarIfOpen() {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
      Get.rawSnackbar(
        message: 'Network connected',
        isDismissible: true,
        duration: null,
        backgroundColor: Colors.blue,
        margin: const EdgeInsets.all(20),
        mainButton: TextButton(
            onPressed: () {
              Get.back<NoInternetScreen>();
            },
            child: const Text('ok')),
        snackStyle: SnackStyle.FLOATING,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    connect.onConnectivityChanged.listen((event) {
      updateConnectionStatus(event);
    });
  }
}

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset('asset/image/images.jpeg')),
    );
  }
}
