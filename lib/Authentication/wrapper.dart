import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tryit_customer_app/Authentication/Login.dart';
import 'package:tryit_customer_app/Authentication/auth_file.dart';
import 'package:tryit_customer_app/screens/welcomeScreen.dart';

import '../models/UserModel.dart';
import '../screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<UserAttributes?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<UserAttributes?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final UserAttributes? user = snapshot.data;
            print(user);
            return user == null ? WelcomeScreen() : HomeScreen();
          } else {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }
        });
  }
}
