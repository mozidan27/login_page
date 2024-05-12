import 'package:flutter/material.dart';
import 'package:login/components/my_button.dart';
import 'package:login/components/my_text_feild.dart';
import 'package:login/components/squre_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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

              // user name text feild
              MyTextFeild(
                hintText: 'User Name',
                obscureText: false,
                controller: usernameController,
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
              const MyButton(),
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
