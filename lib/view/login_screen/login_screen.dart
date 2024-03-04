import 'package:flutter/material.dart';
import 'package:packages_samples_dec/view/home_screen/home_screen.dart';
import 'package:packages_samples_dec/view/reg_screen/reg_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: c1,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: c2,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    String? savedUserName = prefs.getString("username");
                    String? savedPass = prefs.getString("pass");

                    if (c1.text == savedUserName && c2.text == savedPass) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Login success")));

                      prefs.setBool("isLogged", true);

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Login Failed")));
                    }
                  },
                  child: Text("Login")),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
// navigate to register screen
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegScreen(),
                        ));
                  },
                  child: Text("Register now"))
            ],
          ),
        ),
      ),
    );
  }
}
