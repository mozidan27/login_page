import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/components/my_button.dart';
import 'package:login/components/my_text_feild.dart';
import 'package:login/components/squre_tile.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user in method
  void signUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
// try sign in
    try {
      // check if hte passwrod and the confirmed are teh same
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show error meesge
        showErrorMessage('Password don\'t match');
      }
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

// wrong email method
  void showErrorMessage(String message) {
    showDialog(
      barrierColor: Colors.white24,
      context: context,
      builder: (context) {
        return Center(
          child: AlertDialog(
            backgroundColor: Colors.purple,
            title: Center(
                child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            )),
          ),
        );
      },
    );
  }

// wrong password method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                // welcome text
                const Text(
                  'Let\'s create account for you',
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
                MyTextFeild(
                  hintText: 'Confirm password',
                  obscureText: true,
                  controller: confirmPasswordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                // forget password

                const SizedBox(
                  height: 20,
                ),
                // sing in button
                MyButton(
                  onTap: signUserUp,
                  text: 'Sign Up',
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
                  height: 25,
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
                  height: 25,
                ),
                // not a memeber ? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login Now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
