import 'package:flutter/material.dart';

class FruitsAuth extends StatefulWidget {
  const FruitsAuth({super.key});

  @override
  State<FruitsAuth> createState() => _FruitsAuthState();
}

class _FruitsAuthState extends State<FruitsAuth> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email and password auth"),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isLogin
                  ? TextFormField(
                    key: ValueKey("username"),
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      border: OutlineInputBorder(),
                    ),
                  )
                  : Container(),
              SizedBox(height: 10),

              TextFormField(
                key: ValueKey("email"),
                decoration: InputDecoration(
                  hintText: "Enter email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                key: ValueKey("password"),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.blue,
                  ),
                ),
                onPressed: () {},
                child: isLogin ? Text("Sign In") : Text("Sign Up"),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child:
                    isLogin
                        ? Text("Don't have an account Sign up ")
                        : Text("Already have an account ! Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
