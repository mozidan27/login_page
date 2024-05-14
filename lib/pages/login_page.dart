import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/components/my_button.dart';
import 'package:login/components/my_text_feild.dart';
import 'package:login/components/squre_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // wrong email
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmail();
      } else if (e.code == 'wrong-password') {
        // show error to user
        wrongPassword();
      }
    }
  }

// wrong email method
  void wrongEmail() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email is wrong'),
        );
      },
    );
  }

// wrong password method
  void wrongPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Password is wrong'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 40,
              ),
              // welcome text
              const Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),

              // email text feild
              MyTextFeild(
                hintText: 'User Name',
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              // password text feild
              MyTextFeild(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              // forget password
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.grey.shade700),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // sing in button
              MyButton(
                onTap: signUserIn,
              ),
              const SizedBox(
                height: 50,
              ),
              // continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Or'),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade500,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // another login way
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SqureTile(
                    imagePath: 'assets/google.png',
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SqureTile(
                    imagePath: 'assets/apple.png',
                    onTap: () {},
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              // not a memeber ? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member? ',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const Text(
                    'Register note',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
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
