import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todo_app/screens/home.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Drawer(
      //we are putting here drawer in a separate scaffold body
      child: Column(
        //consider the whole drawer as a column in which there are mainy childs container for diff UI widgets
        children: [
          Column(
            children: [
              Container(
                //container for profile view which contain a column and children containers are present there in column for image(BoxDecoration) and centerText
                width: double.infinity, //as of the drawer
                color: Color.fromARGB(23, 243, 33, 177),
                child: Container(
                    margin: EdgeInsets.only(top: 25, bottom: 10),
                    width: 70,
                    height: 90,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/avatar.jpg')))),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Container(
                  child: Text(
                    "User Name",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              //container for listTiles(the childrens of a column)
              padding: EdgeInsets.only(top: 15),
              margin: EdgeInsets.only(left: 25),
              child: Column(
                children: [
                  ListTile(
                    title: Icon(Icons.home),
                    leading: Text(
                      "Home",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Home())));
                    },
                  ),
                  ListTile(
                      title: Icon(Icons.logout),
                      leading: Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      onTap: (() {
                        Navigator.of(context)
                            .pop(); //delete my route from(.of(context)) from the place where i came from //.of(context) means where the link of locations of my widgets exists
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LogoutPage())));
                      }))
                ],
              ))
        ],
      ),
    ));
  }
}

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Logout ",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
