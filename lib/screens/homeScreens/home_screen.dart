import 'package:demo_flutter_firebase_auth/services/authentication_services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () async => await loginProvider.logout(),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
