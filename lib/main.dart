import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'home.dart';
import 'notification.dart';
import 'cart.dart';
import 'account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      title: "Login Page",
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '/Home': (context) => MyHome(),
        '/Notification': (context) => MyNotifications(),
        '/Cart': (context) => MyCart(),
        '/Account': (context) => MyAccount(),
      },
    );
  }
}

var secureTxt = true;
final formKey = GlobalKey<FormState>();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(
                        'https://previews.123rf.com/images/piren/piren1806/piren180600150/102964890--hey-on-black-background-.jpg'),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            enabled: true,
                            hintText: "Email Address",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Email address cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              enabled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  togglepassword();
                                },
                                icon: Icon(secureTxt
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password should be atleast 6";
                            }
                            return null;
                          },
                          obscureText: secureTxt,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Create Account",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text("Forgot Password ?",
                                  style: TextStyle(fontSize: 12))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                Navigator.pushNamed(context, '/Home');
                              }
                            },
                            splashColor: Colors.black,
                            // padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void togglepassword() {
    secureTxt = !secureTxt;
    setState(() {});
  }
}
