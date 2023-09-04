import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/notifications';

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              print("click");
            },
            child: const Text('test'),
          ),
        ],
      ),
    );
  }
}
