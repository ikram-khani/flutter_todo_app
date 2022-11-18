import 'package:flutter/material.dart';
import 'package:flutter_todo_app/user_authentication/auth_gate.dart';
import 'package:flutterfire_ui/auth.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Drawer(
            //we are putting here drawer in a separate scaffold body
            child: ProfileScreen(
      actions: [
        SignedOutAction((context) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return AuthGate();
          }));
        })
      ],
      avatarSize: 80,
      providerConfigs: [
        EmailProviderConfiguration(),
        PhoneProviderConfiguration(),
        GoogleProviderConfiguration(
            clientId:
                "757292871569-2b4jd0lgnab860iv8fp2cqr13geo88gr.apps.googleusercontent.com")
      ],
    )));
  }
}
