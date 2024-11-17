import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saga_kart/authentication/model/auth_model.dart';
import 'package:saga_kart/authentication/provider/auth_provider.dart';
import 'package:saga_kart/authentication/view/sign_up_screen.dart';
import 'package:saga_kart/dashboard/view/dashboard_screen.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future logInAccount() async {
      String email = emailController.text;
      String password = passwordController.text;
      if (formKey.currentState!.validate()) {
        User authModel = User(username: email, password: password);
        AuthProvider authProvider =
            Provider.of<AuthProvider>(context, listen: false);
        bool success = await authProvider.logIn(authModel);
        if (success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DashboardScreen(username: email, password: password)),
          );
        } else {}
      }
    }

    return Scaffold(
      backgroundColor: Colors.yellow,
      // appBar: AppBar(
      //   title: const Text('Log In Screen'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [

                const SizedBox(
                  height: 200,
                ),
                const Center(
                    child: Text(
                  'LOG IN',
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(

                  obscureText: true,
                  controller: emailController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.verified_user_outlined),
                      hintText: 'Enter username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field are required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      hintText: 'Enter password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'password must be required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lime[100],
                        ),
                    onPressed: () {
                      logInAccount();
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(' Do you have no Account'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                      },
                      child: const Text('SIGN UP',style: TextStyle(color: Colors.blue,),),
                    )
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
