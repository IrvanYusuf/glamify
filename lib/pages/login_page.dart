import 'package:flutter/material.dart';
import 'package:glamify/components/textfield_custom.dart';
import 'package:glamify/pages/main_page.dart';
import 'package:glamify/pages/register_page.dart';
import 'package:glamify/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://i.ibb.co.com/jGx0g5C/login.png"),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Masuk",
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
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          isConfirmPassword: false,
                          errorMessage: 'Email tidak boleh kosong',
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
                          isConfirmPassword: false,
                          errorMessage: 'Password tidak boleh kosong',
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
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
                const Text("Belum punya akun?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    " Daftar",
                    style: TextStyle(
                      color: Color(0xff333A73),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formState.currentState?.validate() != false) {
                    final response = await AuthServices()
                        .signInWithEmailAndPassword(email, password, context);
                    print(response);

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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
