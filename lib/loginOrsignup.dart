// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final void Function()? onTap;
  SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final eMail = TextEditingController();
  final passWord = TextEditingController();
  final CnfrmPassWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.pending_actions)),
          Text("Notes App", style: TextStyle(color: Colors.black, fontSize: 40),),
          // Email SignUp
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: eMail,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: "Email",
              ),
            ),
          ),
          // Password..
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passWord,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: "Password",
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: CnfrmPassWord,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: "Conform Password",
              ),
            ),
          ),

          GestureDetector(
            child: Container(
              height: 60,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(child: Text("Sign-Up", style: TextStyle(color: Colors.white),),),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Have an account? "),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Sign-In", style: TextStyle(color: Colors.blue),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SignIn extends StatefulWidget {
  final void Function()? onTap;
  SignIn({super.key, required this.onTap});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final eMaill = TextEditingController();
  final passWordd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.pending_actions)),
          Text("Notes App", style: TextStyle(color: Colors.black, fontSize: 40),),
          // Email SignUp
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: eMaill,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: "Email",
              ),
            ),
          ),
          // Password..
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passWordd,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: "Password",
              ),
            ),
          ),

          GestureDetector(
            child: Container(
              height: 60,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(child: Text("Sign-In", style: TextStyle(color: Colors.white),),),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Sign-Up", style: TextStyle(color: Colors.blue),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key,});
  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  bool isTrue = true;

  void Toogle() {
    setState(() {
      isTrue = !isTrue;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isTrue) {
      return SignIn(onTap: Toogle);
    }
    else {
      return SignUp(onTap: Toogle);
    }
  }
}
