import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class Permission_Page extends StatefulWidget {
  const Permission_Page({Key? key}) : super(key: key);

  @override
  State<Permission_Page> createState() => _Permission_PageState();
}

class _Permission_PageState extends State<Permission_Page> {
  Color conColor = Colors.red.shade300;
  Color con2Color = Colors.red.shade300;
  String conCamText = "Not Allowed";
  String conLocText = "Not Allowed";

  checkCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isGranted) {
      setState(() {
        conColor = Colors.green.shade300;
        conCamText = "Allowed";
      });
    }
  }

  checkLocationPermission() async {
    PermissionStatus status = await Permission.location.status;
    if (status.isGranted) {
      setState(() {
        con2Color = Colors.green.shade300;
        conLocText = "Allowed";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkCameraPermission();
    checkLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Container(),
        centerTitle: true,
        title: Text(
          "App Permission",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    checkCameraPermission();
                    setState(() {});
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: conColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.camera_alt,
                          size: 50,
                        ),
                        Text(
                          conCamText,
                          style: GoogleFonts.firaSans(
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    checkLocationPermission();
                    setState(() {});
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: con2Color,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 50,
                        ),
                        Text(
                          conLocText,
                          style: GoogleFonts.firaSans(
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                onTap: () {
                  openAppSettings();
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade300,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.settings,
                        size: 50,
                      ),
                      Text(
                        "Settings",
                        style: GoogleFonts.firaSans(
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
