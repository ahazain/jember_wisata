import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jember_wisata/pages/public/buttonnav.dart';
import 'package:jember_wisata/pages/register.dart';
import 'package:jember_wisata/widget/widget_support.dart';

class login extends StatefulWidget {
  const login({Key? key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String email = "", password = "";

  final _formkey = GlobalKey<FormState>();

  TextEditingController publicemailcontroller = new TextEditingController();
  TextEditingController publicpasswordcontroller = new TextEditingController();

  publicLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "No User Found with that email",
                style: AppWidget.bold2TextFieldStyle(),
              ),
            ),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Wrong password provided by user",
                style: AppWidget.bold2TextFieldStyle(),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 250,
                ),
                SizedBox(height: 20),
                Text(
                  'Masuk',
                  style: AppWidget.head3TextFieldStyle(),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: publicemailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w200,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: publicpasswordcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Kata Sandi";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Kata Sandi",
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w200,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Tambahkan fungsi untuk menangani lupa kata sandi di sini
                    },
                    child: Text(
                      "Lupa Kata Sandi?",
                      style: AppWidget.umumTextFieldStyle(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate())
                      setState(() {
                        email = publicemailcontroller.text;
                        password = publicpasswordcontroller.text;
                      });
                    publicLogin();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF344D3E)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  child: Text(
                    "Kirim",
                    style: AppWidget.head4TextFieldStyle(),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const register(),
                      ),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Belum punya akun? ',
                            style: AppWidget.umumTextFieldStyle()),
                        TextSpan(
                          text: 'Daftar',
                          style: AppWidget.umumTextFieldStyle()
                              .copyWith(color: Colors.blue[300]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
