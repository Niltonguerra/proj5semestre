import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:login/pages/home_page.dart";
import "package:login/pages/login_page.dart";

class AuthPage extends StatelessWidget{
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            // user is logged in
            return HomePage();
          }
          else{
            // user is NOT logged in
            return LoginPage();
          }

        }


      ),

    );
  }
}