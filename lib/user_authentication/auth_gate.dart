import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo_app/constants/colors.dart';
import 'package:flutter_todo_app/screens/home.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: tdBGColor,
            elevation: 0,
          ),
          preferredSize: Size.fromHeight(8)),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              headerBuilder: (context, constraints, shrinkOffset) => Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              providerConfigs: [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(
                    clientId:
                        '757292871569-2b4jd0lgnab860iv8fp2cqr13geo88gr.apps.googleusercontent.com')
              ],
              subtitleBuilder: (context, action) => Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(action == AuthAction.signIn
                    ? 'Welcome to ToDo App! Please Sign in to continue.'
                    : "Welcome to ToDo App! Please create an account to continue."),
              ),
              footerBuilder: (context, action) => const Padding(
                padding: EdgeInsets.only(top: 14),
                child: Text(
                  "By signing in, you agree to our terms and conditions.",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            );
          }
          return Home();
        },
      ),
    );
  }
}
