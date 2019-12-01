import 'package:firecross/firecross.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Signout',
            onPressed: () {
              FirecrossAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Test'),
      ),
    );
  }
}
