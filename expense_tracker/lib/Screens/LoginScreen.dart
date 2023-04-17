import 'package:expense_tracker/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

import '../Controllers/UserController.dart';
import '../Models/User.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  Widget userNameTextFormField(TextEditingController tx) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          controller: tx,
          decoration: InputDecoration(
            labelText: 'UserName',
            hintText: 'Enter your Username',
            prefixIcon: Icon(Icons.account_circle_rounded),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            fillColor: Colors.white,
            contentPadding: const EdgeInsetsDirectional.all(16),
          )),
    );
  }

  Widget passwordTextFormField(TextEditingController tx) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          controller: tx,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            prefixIcon: Icon(Icons.password),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            fillColor: Colors.white,
            contentPadding: const EdgeInsetsDirectional.all(16),
          )),
    );
  }

  displayToast(String msg, Color color) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: color),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameTx = TextEditingController();
    TextEditingController passwordTx = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset('assets/images/signincover.jpg'),
              Column(
                children: [
                  userNameTextFormField(userNameTx),
                  passwordTextFormField(passwordTx),
                  ElevatedButton(
                    onPressed: () async {
                      User currUser = User(userNameTx.text, passwordTx.text);
                      print("signInClicked" +
                          userNameTx.text +
                          " " +
                          passwordTx.text);

                      String res = await userController.loginStatus(currUser);
                      if (res == "2") {
                        userController.updateUserName(currUser.userName!);
                        displayToast(
                            "You are successfully logged in!", Colors.green);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      } else if (res == "1") {
                        displayToast("Wrong Password!", Colors.red);
                      } else {
                        displayToast(
                            "No UserName found! Creating user", Colors.yellow);

                        await userController.addUser(currUser);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                        displayToast(
                            "You are successfully logged in!", Colors.green);
                      }
                    },
                    child: Text('SIGN IN'),
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
