import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatefulWidget {

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn(){

    // sign user in method
    showDialog(
      context: context,
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
    );





    // try sign in
    try{
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );


    }on FirebaseAuthException catch  (e) {

      // print('Failed with error code: ${e.code}');
      // print(e.message);

      print("erro é esse!!!");
      // erro de versão
      // WRONG EMAIL
      if(e.code == 'user-not-found'){
        // show error to user
        wrongEmailDialog();
        // print('No user found for that email.');
        print("erro é esse!!!");
      }
      // WRONG PASSWORD
      else if(e.code == 'wrong-password'){
        // show error to user
        wrongPasswordDialog();
        print("erro é esse!!!");
        // print('Wrong password provided for that user.');
      }
      else{
        print("erro é esse!!!");
        print(e.message);
      }
    }


  //   pop the loading circle
    Navigator.pop(context);

  }


  void wrongEmailDialog(){
    showDialog(
      context: context,
      builder: (context){
        return const AlertDialog(
          title: Text("Erro"),
          content: Text("E-mail incorreto"),

        );
      }
    );
  }

  void wrongPasswordDialog(){
    showDialog(
        context: context,
        builder: (context){
          return const AlertDialog(
            title: Text("Erro"),
            content: Text("Senha incorreto"),

          );
        }
    );
  }















  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Image(
          image: NetworkImage(
              "https://ninelabs.blog/wp-content/uploads/2022/05/Group-1.png"),
          width: 140,
        ),


        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.pinkAccent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Login! :)",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),












            CupertinoTextField(
              cursorColor: Colors.pinkAccent,
              controller: emailController,
              padding: EdgeInsets.all(15),
              placeholder: "Digite o seu e-mail",
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),













            const SizedBox(height: 5),


            CupertinoTextField(
              controller: passwordController,
              padding: EdgeInsets.all(15),
              cursorColor: Colors.pinkAccent,
              placeholder: "Digite sua senha",
              obscureText: true,
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),

















            const SizedBox(height: 30),


            SizedBox(
              width: double.infinity,
              child: CupertinoButton(

                padding: const EdgeInsets.all(17),
                color: Colors.greenAccent,

                child: const Text(
                  "Acessar",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: signUserIn,

              ),
            ),


            const SizedBox(height: 7),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70, width: 0.8),
                  borderRadius: BorderRadius.circular(7)),
              child: CupertinoButton(
                child: const Text(
                  "Crie sua conta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}