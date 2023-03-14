import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission/views/screens/home.dart';
import 'package:permission_handler/permission_handler.dart';

class Location_Page extends StatefulWidget {
  const Location_Page({Key? key}) : super(key: key);

  @override
  State<Location_Page> createState() => _Location_PageState();
}

class _Location_PageState extends State<Location_Page> {
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
                      "https://img.freepik.com/free-vector/green-world-map_1035-6409.jpg?w=740&t=st=1678706986~exp=1678707586~hmac=439fed8cbd4d26ceaedeab92347491da4b23fab6fd61d61c80038ba593f09011",
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
                  "Enable Location",
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
                  "Please provide us access to your location, which is required for Augmented Reality.",
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
                    PermissionStatus status =
                        await Permission.location.request();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Permission_Page(),
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
