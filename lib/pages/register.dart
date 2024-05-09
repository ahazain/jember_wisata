import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:jember_wisata/pages/login.dart";
import "package:jember_wisata/pages/public/buttonnav.dart";
import "package:jember_wisata/pages/splash.dart";
import "package:jember_wisata/pages/public/home.dart";
import "package:jember_wisata/widget/widget_support.dart";

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  String email = "", password = "", name = "";

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();
//logika registrasi
  void registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.amber,
            content: Text(
              "Pendaftaran Berhasil",
              style: AppWidget.bold2TextFieldStyle(),
            ),
          ),
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => buttonNav()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.amber,
              content: Text(
                "Password terlalu lemah",
                style: AppWidget.bold2TextFieldStyle(),
              ),
            ),
          );
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.amber,
              content: Text(
                "Akun sudah ada",
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
      body: SingleChildScrollView(
        child: Container(
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
                    'Daftar',
                    style: AppWidget.head3TextFieldStyle(),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: namecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter nama pengguna';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Nama Pengguna",
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
                    controller: emailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email';
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
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Kata Sandi';
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
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = emailcontroller.text;
                          name = namecontroller.text;
                          password = passwordcontroller.text;
                        });
                      }
                      registration();
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
                          builder: (context) => const login(),
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sudah punya akun? ',
                            style: AppWidget.umumTextFieldStyle(),
                          ),
                          TextSpan(
                            text: 'Masuk',
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
      ),
    );
  }
}
