import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final user = FirebaseAuth.instance.currentUser!;

  // singout user method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Center(
        child: Text("LODDED IN AS : ${user.email}"),
      ),
    );
  }
}
