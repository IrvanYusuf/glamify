import 'package:flutter/material.dart';
import 'package:glamify/components/textfield_custom.dart';
import 'package:glamify/pages/login_page.dart';
import 'package:glamify/pages/main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                        image: AssetImage("assets/image/register.png"),
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                          fontFamily: "Segoe",
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFieldCustom(
                        hintText: "John doe",
                        obscureText: false,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          fontFamily: "Segoe",
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFieldCustom(
                        hintText: "abc@gmail.com",
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                          fontFamily: "Segoe",
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFieldCustom(
                        hintText: "******",
                        obscureText: true,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Konfirmasi Password",
                        style: TextStyle(
                          fontFamily: "Segoe",
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFieldCustom(
                        hintText: "******",
                        obscureText: true,
                      )
                    ],
                  ),
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
                                builder: (context) => LoginPage()),
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
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginPage();
                        }));
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
                        style: TextStyle(fontWeight: FontWeight.bold),
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
