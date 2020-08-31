import 'package:flutter/material.dart';
import 'package:tamween_edafi/screens/register-login/forgot-password-confirm.dart';
import 'package:tamween_edafi/screens/register-login/forgot-password.dart';
import 'package:tamween_edafi/screens/register-login/login.dart';
import 'package:tamween_edafi/screens/register-login/reset-password.dart';
import 'screens/register-login/registeration.dart';
import 'components/navigation-bar/navigation.dart';

void main() => runApp(TamweenEdafi());

class TamweenEdafi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => RegistrationScreen(),
          '/home': (context) => MyHomePage(),
          '/login': (context) => Login(),
          '/forget': (context) => ForgotPass(),
          '/confirm': (context) => ForgotPassConfirm(),
          '/reset': (context) => ResetPass(),
        }
    );
  }
}
