import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saga_kart/authentication/model/auth_model.dart';
import 'package:saga_kart/authentication/provider/auth_provider.dart';
import 'package:saga_kart/authentication/view/login_screen.dart';


class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // final confirmPasswordController = TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future signUp() async {
      String username = usernameController.text;
      String password = passwordController.text;
      if (formKey.currentState!.validate()) {
        User user = User(username: username, password: password);

        AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
        await authProvider.signUp(user);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LogInScreen(),
            ));

      }
    }

    return Scaffold(
      backgroundColor: Colors.blue[700],
      // resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const SizedBox(
           // height: double.infinity,
           // width: double.infinity,
          //  child: Image.network('https://wallpapercave.com/wp/wp4390828.jpg',)
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 150
                  // horizontal: 16.0,
                  // vertical: 70,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      buildTextField('Enter Username', TextInputType.text,
                          usernameController),
                      const SizedBox(
                        height: 16,
                      ),
                      buildTextField(
                          'Enter password',
                          const TextInputType.numberWithOptions(),
                          passwordController),
                      const SizedBox(
                        height: 16,
                      ),
                      // buildTextField(
                      //     'Confirm password',
                      //     TextInputType.numberWithOptions(),
                      //     confirmPasswordController),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            signUp();
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.black),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an Account ?',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LogInScreen(),
                                  ));
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.lime,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Text(
                        'Forgot password ?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildTextField(
      String hintText, TextInputType type, TextEditingController controller) {
    return TextFormField(
      validator: (
          String? value,
          ) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
      },

      obscureText: true,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}