import 'package:flutter/gestures.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:happy_second/database/db.dart';
import 'package:happy_second/utils/hexColor.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../routes/register.dart';
import '../../utils/storage/sharedPreferences_util.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  bool _isLoading = false;

  Future<bool> _handleLogin() async {
    try {
      String email = _emailController.text;
      String password = _passwordController.text;
      final db = Provider.of<AppDatabase>(context, listen: false);

      User? user = await db.findUserByEmail(email);
      if(user == null){
        EasyLoading.showInfo("User not found!");
        return false;
      }else if (password != user.password){
        EasyLoading.showInfo("Login information is not correct!");
        return false;
      } else {
        EasyLoading.showSuccess("Login successful!");
        await SharedPreferencesUtil.setStringItem('email', email);
        return true;
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      rethrow;
    }
  }

  String? _validateEmailAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Email address is invalid";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is invalid";
    }
    return null;
  }

  void showInSnackBar(String value) {
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState
        ?.showSnackBar(SnackBar(content: Text(value)));
  }

  Future<void> _handleSubmitted() async {
    setState(() {
      _isLoading = true;
    });
    final form = _formKey.currentState;
    if (!form!.validate()) {
      showInSnackBar(
        'Oops! can not submit.',
      );
    } else {
      _handleLogin().then((value) => {
        if(value) {
          Navigator.pushNamed(context, "/")
        }
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Image(
            image: AssetImage("lib/assets/clothes.png"),
          ),
          Text(
            "Log In",
            style: TextStyle(
                color: HexColor.fromHex("#5E7737"),
                fontWeight: FontWeight.bold,
                fontSize: 32.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              cursorColor: HexColor.fromHex("#5E7737"),
              validator: _validateEmailAddress,
              decoration: InputDecoration(
                  hintText: 'Email',
                  icon: Icon(EvaIcons.phoneOutline,
                      color: HexColor.fromHex("#5E7737")),
                  focusColor: Colors.white,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor.fromHex("#5E7737")),
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
                icon: Icon(EvaIcons.lockOutline,
                    color: HexColor.fromHex("#5E7737")),
                focusColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: HexColor.fromHex("#5E7737")),
                )),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 360 ,
            child: IgnorePointer(
              ignoring: _isLoading,
              child: ElevatedButton(
                onPressed: _handleSubmitted,
                style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor.fromHex("#5E7737"),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text("Login"),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Does’t have account? Sign up now',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: HexColor.fromHex("#5E7737"),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()),
                      );
                    },
                ),
              ],
            ),
          )
        ]));
  }
}
