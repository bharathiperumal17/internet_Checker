import 'package:flutter/material.dart';
import 'package:radio/my_home_page.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                )),
            icon: const Icon(Icons.home)),
      ),
    );
  }
}