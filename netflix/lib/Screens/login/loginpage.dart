import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix/main.dart';
import 'package:netflix/widgets/bottomnavigator.dart';
import 'package:netflix/widgets/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool changeIcon = true;
  bool isHover = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    final validate = _formKey.currentState!.validate();
    if (!validate) {
      return;
    } //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainScreen()),
            (Route) => false);
      });
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);
      print(e.code);
      //wrong email
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Incorrect Email',
        )));
      }
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Incorrect Email',
            )));
      }
      // //wrong password
      else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Incorrect password')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              color: Colors.black,
              child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/logo.jpg'))),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.27),
                                hintText: 'Email',
                                hintStyle: const TextStyle(color: Colors.white),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            kheight10,
                            Column(
                              children: [
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    suffixIcon: changeIcon
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                changeIcon = !changeIcon;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.visibility_off,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                changeIcon = !changeIcon;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.visibility,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.27),
                                    hintText: 'Password',
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 10.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  obscureText: changeIcon ? true : false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid password';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            kheight30,
                            OutlinedButton(
                              onPressed: signUserIn,
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.white)),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 15),
                                  ),
                                  onPressed: () => {
                                        Navigator.of(context)
                                            .pushNamed('/registerpage')
                                      },
                                  child: const Text(
                                    'Not a member yet? Start your free month!',
                                    style: TextStyle(),
                                  )),
                            ),
                            kheight10,
                            Text(
                              'Forgot Your Password?',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )))),
    );
  }
}
