import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:glamify/components/textfield_custom.dart';
import 'package:glamify/pages/login_page.dart';
import 'package:glamify/pages/main_page.dart';
import 'package:glamify/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController konfirmasiPassword = TextEditingController();

  String? uid;

  final _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://i.ibb.co.com/qgps9VB/register.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Daftar",
                    style: TextStyle(
                      fontFamily: "Segoe",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Form(
                      key: _formState,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Username",
                                style: TextStyle(
                                  fontFamily: "Segoe",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFieldCustom(
                                hintText: "John doe",
                                obscureText: false,
                                keyboardType: TextInputType.text,
                                controller: username,
                                errorMessage: "Username tidak boleh kosong",
                                isConfirmPassword: false,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Email",
                                style: TextStyle(
                                  fontFamily: "Segoe",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFieldCustom(
                                hintText: "abc@gmail.com",
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                errorMessage: 'Email tidak boleh kosong',
                                isConfirmPassword: false,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Password",
                                style: TextStyle(
                                  fontFamily: "Segoe",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFieldCustom(
                                hintText: "******",
                                obscureText: true,
                                controller: password,
                                errorMessage: 'Password tidak boleh kosong',
                                isConfirmPassword: false,
                                suffixIcon: Icon(Icons.remove_red_eye),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Konfirmasi Password",
                                style: TextStyle(
                                  fontFamily: "Segoe",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFieldCustom(
                                hintText: "******",
                                obscureText: true,
                                controller: konfirmasiPassword,
                                errorMessage:
                                    'Konfirmasi Password tidak boleh kosong',
                                isConfirmPassword: true,
                                originalPasswordController: password,
                                suffixIcon: Icon(Icons.remove_red_eye),
                              )
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Sudah punya akun?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          " Masuk",
                          style: TextStyle(
                            color: Color(0xff333A73),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32, bottom: 24),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formState.currentState?.validate() != false) {
                          final Map<String, dynamic> payload = {
                            "uid": null,
                            "username": username.text,
                            "email": email.text,
                            "password": password.text,
                            "photo_url": null
                          };
                          final response = await AuthServices()
                              .createUserWithEmailAndPassword(
                                  email, password, setState, uid, payload);
                          if (response == "Success") {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return const MainPage();
                            }), (route) => false);
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(response),
                            backgroundColor: Colors.red[700],
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff333A73),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
