import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:packages_samples_dec/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController c1 = TextEditingController();

  String? savedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                prefs.clear();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: c1,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                  onPressed: () async {
                    // instance of shared preference
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

//save data to share preference
                    prefs.setString("text", c1.text);
                  },
                  child: const Text("save")),
              const SizedBox(height: 100),
              GestureDetector(
                  onTap: () {
                    print("tap up");
                  },
                  child: Text(savedData.toString())),
              const SizedBox(height: 100),
              ElevatedButton(
                  onPressed: () async {
                    // instance of shared preference
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    // get

                    savedData = prefs.getString("text");
                    setState(() {});
                  },
                  child: Text("get"))
            ],
          ),
        ),
      ),
    );
  }
}
