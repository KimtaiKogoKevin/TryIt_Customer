import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tryit_customer_app/Authentication//animation/animation.dart';

import '../Authentication/login.dart';
import '../Authentication/signup.dart';
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';           // new

import 'package:tryit_customer_app/firebase_options.dart';                    // new
import 'package:tryit_customer_app/Authentication/authentication.dart';

import '../main.dart';                  // new


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 250,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/illustration.png')
                        )
                    ),
                  ),
                   const Text("Welcome", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),),
                  const SizedBox(height: 20,),
                   Text("Automatic identity verification which enables you to verify your identity",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15
                    ),),
                ],
              ),

              Column(
                children: <Widget>[
                  // MaterialButton(
                  //   minWidth: double.infinity,
                  //   height: 60,
                  //   onPressed: () {
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  //   },
                  //   shape: RoundedRectangleBorder(
                  //       side: const BorderSide(
                  //           color: Colors.black
                  //       ),
                  //       borderRadius: BorderRadius.circular(50)
                  //   ),
                  //   child: const Text("Login", style: const TextStyle(
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: 18
                  //   ),),
                  // ),
                  // const SizedBox(height: 20,),

                      Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: const Border(
                          bottom: const BorderSide(color: Colors.black),
                          top: const BorderSide(color: Colors.black),
                          left: const BorderSide(color: Colors.black),
                          right: const BorderSide(color: Colors.black),
                        )
                    ),
                    child:  Consumer<ApplicationState>(
                      builder: (context, appState, _) => Authentication(
                        email: appState.email,
                        loginState: appState.loginState,
                        startLoginFlow: appState.startLoginFlow,
                        verifyEmail: appState.verifyEmail,
                        signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
                        cancelRegistration: appState.cancelRegistration,
                        registerAccount: appState.registerAccount,
                        signOut: appState.signOut,
                      ),
                    ),
                    // MaterialButton(
                    //   minWidth: double.infinity,
                    //   height: 60,
                    //   onPressed: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                    //   },
                    //   color: Colors.yellow,
                    //   elevation: 0,
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(50)
                    //   ),
                    //   child: const Text("Sign up", style: TextStyle(
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 18
                    //   ),),
                    // ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
