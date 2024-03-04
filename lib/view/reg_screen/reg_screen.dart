import 'package:flutter/material.dart';
import 'package:packages_samples_dec/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
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
                obscureText: true,
                controller: c2,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    if (c1.text.isNotEmpty && c2.text.isNotEmpty) {
                      prefs.setString("username", c1.text);
                      prefs.setString("pass", c2.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("user name and pass is required")));
                    }
                  },
                  child: Text("Register")),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Text("Login now"))
            ],
          ),
        ),
      ),
    );
  }
}
