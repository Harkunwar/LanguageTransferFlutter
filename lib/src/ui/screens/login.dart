import 'package:flutter/material.dart';
import 'package:language_transfer/src/utils/routes.dart';
import 'package:language_transfer/src/ui/widgets/custom_shape.dart';
import 'package:language_transfer/src/ui/widgets/responsive_ui.dart';
import 'package:language_transfer/src/ui/widgets/textformfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Material(
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                clipShape(context),
                welcomeTextRow(context),
                signInTextRow(context),
                form(context),
                forgetPassTextRow(context),
                SizedBox(height: size.height / 12),
                button(context),
                signUpTextRow(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final large = ResponsiveWidget.isScreenLarge(size.width, pixelRatio);
    final medium = ResponsiveWidget.isScreenMedium(size.width, pixelRatio);
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: large
                  ? size.height / 4
                  : (medium ? size.height / 3.75 : size.height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.blue[700]],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: large
                  ? size.height / 4.5
                  : (medium ? size.height / 4.25 : size.height / 6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.blue[400]],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/login.png',
            height: size.height / 2.5,
            width: size.width / 2.5,
          ),
        ),
      ],
    );
  }

  Widget welcomeTextRow(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final large = ResponsiveWidget.isScreenLarge(size.width, pixelRatio);
    final medium = ResponsiveWidget.isScreenMedium(size.width, pixelRatio);
    return Container(
      margin: EdgeInsets.only(left: size.width / 20, top: size.height / 100),
      child: Row(
        children: <Widget>[
          Text(
            'Welcome',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: large ? 60 : (medium ? 50 : 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final large = ResponsiveWidget.isScreenLarge(size.width, pixelRatio);
    final medium = ResponsiveWidget.isScreenMedium(size.width, pixelRatio);
    return Container(
      margin: EdgeInsets.only(left: size.width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            'Sign in to your account',
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: large ? 20 : (medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget form(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: size.width / 12.0,
          right: size.width / 12.0,
          top: size.height / 15.0),
      child: Form(
        key: key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: size.height / 40.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      icon: Icons.email,
      hint: 'Email ID',
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: passwordController,
      icon: Icons.lock,
      obscureText: true,
      hint: 'Password',
    );
  }

  Widget forgetPassTextRow(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final large = ResponsiveWidget.isScreenLarge(size.width, pixelRatio);
    final medium = ResponsiveWidget.isScreenMedium(size.width, pixelRatio);
    return Container(
      margin: EdgeInsets.only(top: size.height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Forgot your password?',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: large ? 14 : (medium ? 12 : 10)),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              print('Routing');
            },
            child: Text(
              'Recover',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Widget button(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final large = ResponsiveWidget.isScreenLarge(size.width, pixelRatio);
    final medium = ResponsiveWidget.isScreenMedium(size.width, pixelRatio);

    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        print('Routing to your account');
        Scaffold.of(context)
            .showSnackBar(const SnackBar(content: Text('Login Successful')));
      },
      textColor: Colors.black,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: large
            ? size.width / 4
            : (medium ? size.width / 3.75 : size.width / 3.5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.deepPurpleAccent, Colors.blue[500]],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('SIGN IN',
            style: TextStyle(fontSize: large ? 14 : (medium ? 14 : 13))),
      ),
    );
  }

  Widget signUpTextRow(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final large = ResponsiveWidget.isScreenLarge(size.width, pixelRatio);
    final medium = ResponsiveWidget.isScreenMedium(size.width, pixelRatio);

    return Container(
      margin: EdgeInsets.only(top: size.height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account?',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: large ? 14 : (medium ? 12 : 10)),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.SIGNUP);
              print('Routing to Sign up screen');
            },
            child: Text(
              'Sign up',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: large ? 19 : (medium ? 17 : 15)),
            ),
          )
        ],
      ),
    );
  }
}
