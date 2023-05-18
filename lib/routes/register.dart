import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:happy_second/database/db.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../model/user.dart';
import '../utils/hexColor.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;

  Future<void> _handleSubmitted() async {
    try {
      EasyLoading.show(status: "Loading...");
      setState(() {
        _isLoading = true;
      });
      final form = _formKey.currentState;
      if (!form!.validate()) {
      } else {
        final db = Provider.of<AppDatabase>(context, listen: false);
        User newUser = User(
            uuid: const Uuid().v4().toString(),
            emailAddress: _emailController.text,
            username: _usernameController.text,
            password: _passwordController.text,
            usertype: UserType.normal,
            cart: [],
            cards: []
        );

        await db.createUser(newUser.toUsersCompanion()).then((value) =>
            {EasyLoading.dismiss(), Navigator.pushNamed(context, "/login")});
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      rethrow;
    } finally {
      EasyLoading.dismiss();
    }
  }

  String? _validateEmailAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Email address is invalid";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? _validateUsername( String? value) {
    if (value == null || value.isEmpty) {
      return "Username is invalid";
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is invalid";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm Password cannot be empty";
    }
    if (value != _passwordController.text) {
      return "Confirm Password is not the same";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: HexColor.fromHex("#5E7737"),
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "One more step to join us",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Create an account",
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      cursorColor: HexColor.fromHex("#5E7737"),
                      validator: _validateEmailAddress,
                      decoration: InputDecoration(
                          hintText: 'Email Address',
                          focusColor: Colors.white,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: HexColor.fromHex("#5E7737")),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _usernameController,
                      cursorColor: HexColor.fromHex("#5E7737"),
                      validator: (value) => _validateUsername(value),
                      decoration: InputDecoration(
                          hintText: 'Username',
                          focusColor: Colors.white,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: HexColor.fromHex("#5E7737")),
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    controller: _passwordController,
                    obscureText: true,
                    cursorColor: HexColor.fromHex("#5E7737"),
                    validator: _validatePassword,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        focusColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: HexColor.fromHex("#5E7737")),
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: _confirmPasswordController,
                        obscureText: true,
                        cursorColor: HexColor.fromHex("#5E7737"),
                        validator: _validateConfirmPassword,
                        decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            focusColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor.fromHex("#5E7737")),
                            )),
                      )),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 360,
                    child: IgnorePointer(
                      ignoring: _isLoading,
                      child: ElevatedButton(
                        onPressed: () => _handleSubmitted(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: HexColor.fromHex("#5E7737"),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text("Register"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have account? Sign up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: HexColor.fromHex("#5E7737"),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                        ),
                      ],
                    ),
                  )
                ],
              )),
        )));
  }
}
