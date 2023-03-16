import 'package:flutter/material.dart';
import 'package:location_permission/views/screens/home_page.dart';
import 'package:permission_handler/permission_handler.dart';

class Camera_page extends StatefulWidget {
  const Camera_page({Key? key}) : super(key: key);

  @override
  State<Camera_page> createState() => _Camera_pageState();
}

class _Camera_pageState extends State<Camera_page> {
  @override
  void initState() {
    super.initState();
    getcamerapermission();
  }

  getcamerapermission() async {
    PermissionStatus status = await Permission.camera.request();
    if (status.isDenied) {
      Permission.camera.request();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Permissions",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: const Text(
                  "Add Camera Permission..",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () async {
                    Permission.camera.request();
                    if (await Permission.camera.isDenied) {
                      Permission.camera.request();
                    } else {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    }
                  },
                  child: const Text(
                    "Next >>",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
