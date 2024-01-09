// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider_app/repository/auth_repository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confromPasswordController =
      TextEditingController();

  final TextEditingController _userNameController = TextEditingController();

  bool isLoading = false;
  bool isSecure = false;
  @override
  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = AuthProvider();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                // SvgPicture.asset(
                //   'images/logo.svg',
                //   height: 80,
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Please create a account",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "UserName",
                      style: TextStyle(
                          fontFamily: "Poppins", color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Please enter your userame',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          fontFamily: "Poppins", color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Please enter your email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          fontFamily: "Poppins", color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7 / 2,
                  child: TextFormField(
                    obscureText: isSecure,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'please enter your password',
                      suffix: IconButton(
                        onPressed: () {},
                        icon: Icon(
                            isSecure ? Icons.visibility_off : Icons.visibility),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Confrom Password",
                      style: TextStyle(
                          fontFamily: "Poppins", color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7 / 2,
                  child: TextFormField(
                    obscureText: isSecure,
                    controller: _confromPasswordController,
                    decoration: InputDecoration(
                      filled: true,
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'please enter your password',
                      suffix: IconButton(
                        onPressed: () {},
                        icon: Icon(
                            isSecure ? Icons.visibility_off : Icons.visibility),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 14,
                ),
                GestureDetector(
                  onTap: () async {
                    AuthRepository authRepository = AuthRepository();
                    print("this is userName: ${_userNameController.text}");
                    print("this is userName: ${_emailController.text}");

                    print("this is userName: ${_passwordController.text}");

                    authRepository.registerUser(
                      _userNameController.text.trim(),
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _confromPasswordController.text.trim(),
                      // "saqib71501",
                      // "saqib71501@gmail.com",
                      // "Admin@123",
                    );
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(
                        width: 1,
                        color: Colors.amber,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Allready have account?"),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
