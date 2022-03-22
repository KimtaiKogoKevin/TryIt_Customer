import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tryit_customer_app/main.dart';
import 'package:tryit_customer_app/screens/welcomeScreen.dart';

import '../../Authentication/auth_file.dart';
class MyAccount extends StatelessWidget {

  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Container(

            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 8),
                  child: MaterialButton(
                    onPressed: () async{
                      try{
                        await authService.signOut();
                        Navigator.pushNamed(context, '/');

                      }
                      on FirebaseAuthException catch (e) {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('OhOh! Logout Failed'),
                            content: Text('${e.message}'),
                          ),
                        );
                      }
                    },
                    child: const Text('LOGOUT'),
                  ),
                ),
              ],
            )
        ),

      ]
    );
  }
}
void signOut() {
  FirebaseAuth.instance.signOut();
}
