import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission/views/screens/gps.dart';
import 'package:permission_handler/permission_handler.dart';

class Camera_Page extends StatefulWidget {
  const Camera_Page({Key? key}) : super(key: key);

  @override
  State<Camera_Page> createState() => _Camera_PageState();
}

class _Camera_PageState extends State<Camera_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: Colors.grey.shade500,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://static.vecteezy.com/system/resources/previews/004/968/640/original/camera-access-permission-for-app-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                  bottom: 30,
                ),
                child: Text(
                  "Enable Camera",
                  style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "Please provide us access to your camera, which is required for Augmented Reality.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                ),
                child: GestureDetector(
                  onTap: () async {
                    PermissionStatus status = await Permission.camera.request();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Location_Page(),
                      ),
                    );
                  },
                  child: Container(
                    height: 70,
                    width: 270,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "ALLOW PERMISSION",
                      style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
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
