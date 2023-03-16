import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location_permission/views/screens/camera_page.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyHomepage());
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  double lat = 0;
  double long = 0;
  Placemark place = Placemark();
  @override
  void initState() {
    super.initState();
    getlocationpermission();
  }

  getlocationpermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isDenied) {
      Permission.location.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Builder(builder: (context) {
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
                      "Add Location Permission..",
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
                        Permission.location.request();
                        if (await Permission.location.isDenied) {
                          Permission.location.request();
                        } else {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const Camera_page()));
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
      }),
    );
  }
}
