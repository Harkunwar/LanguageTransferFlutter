import 'package:flutter/material.dart';
import '../../utils/routes.dart';
import '../widgets/custom_shape.dart';
import '../widgets/customappbar.dart';
import '../widgets/responsive_ui.dart';
import '../widgets/textformfield.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88, child: CustomAppBar()),
                clipShape(context),
                form(context),
                acceptTermsTextRow(context),
                SizedBox(
                  height: size.height / 35,
                ),
                button(context),
                infoTextRow(context),
                socialIconsRow(context),
                //signInTextRow(),
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
                  ? size.height / 8
                  : (medium ? size.height / 7 : size.height / 6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
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
                  ? size.height / 12
                  : (medium ? size.height / 11 : size.height / 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: size.height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: () {
                print('Adding photo');
              },
              child: Icon(
                Icons.add_a_photo,
                size: large ? 40 : (medium ? 33 : 31),
                color: Colors.orange[200],
              )),
        ),
//        Positioned(
//          top: height/8,
//          left: width/1.75,
//          child: Container(
//            alignment: Alignment.center,
//            height: height/23,
//            padding: EdgeInsets.all(5),
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color:  Colors.orange[100],
//            ),
//            child: GestureDetector(
//                onTap: (){
//                  print('Adding photo');
//                },
//                child: Icon(Icons.add_a_photo, size: large? 22: (medium? 15: 13),)),
//          ),
//        ),
      ],
    );
  }

  Widget form(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final large = ResponsiveWidget.isScreenLarge(size.width, pixelRatio);
    final medium = ResponsiveWidget.isScreenMedium(size.width, pixelRatio);
    return Container(
      margin: EdgeInsets.only(
          left: size.width / 12.0,
          right: size.width / 12.0,
          top: size.height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: size.height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: size.height / 60.0),
            emailTextFormField(),
            SizedBox(height: size.height / 60.0),
            phoneTextFormField(),
            SizedBox(height: size.height / 60.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "First Name",
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Last Name",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email ID",
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      hint: "Mobile Number",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.lock,
      hint: "Password",
    );
  }

  Widget acceptTermsTextRow(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final large = ResponsiveWidget.isScreenLarge(size.width, pixelRatio);
    final medium = ResponsiveWidget.isScreenMedium(size.width, pixelRatio);
    return Container(
      margin: EdgeInsets.only(top: size.height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              // TODO: Need to fix this
              activeColor: Colors.orange[200],
              value: false,
              onChanged: (bool newValue) {
                // to be fixed
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: large ? 12 : (medium ? 11 : 10)),
          ),
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
        print("Routing to your account");
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: height / 20,
        width: large
            ? size.width / 4
            : (medium ? size.width / 3.75 : size.width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'SIGN UP',
          style: TextStyle(fontSize: large ? 14 : (medium ? 12 : 10)),
        ),
      ),
    );
  }

  Widget infoTextRow(BuildContext context) {
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
            "Or create using social media",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: large ? 12 : (medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget socialIconsRow(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height / 80.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/googlelogo.png"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/fblogo.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/twitterlogo.jpg"),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(Routes.LOGIN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
