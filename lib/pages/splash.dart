import "package:flutter/material.dart";
import "package:jember_wisata/pages/public/home.dart";
import "package:jember_wisata/pages/register.dart";
import "package:jember_wisata/widget/widget_support.dart";

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF344D3E),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 250,
              ),
              Text(
                'Jember Wisata',
                style: AppWidget.head2TextFieldStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
