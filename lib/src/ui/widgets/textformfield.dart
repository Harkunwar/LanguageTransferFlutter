import 'package:flutter/material.dart';
import 'package:language_transfer/src/ui/widgets/responsive_ui.dart';

class CustomTextField extends StatefulWidget {

  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  final Function validator;

  const CustomTextField({
    this.hint,
    this.textEditingController,
    this.keyboardType,
    this.icon,
    this.obscureText = false,
    this.validator,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState(
    hint: hint,
    textEditingController: textEditingController,
    keyboardType: keyboardType,
    obscureText: obscureText,
    icon: icon,
    validator: validator,
  );
}


class _CustomTextFieldState extends State<CustomTextField> {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  final Function validator;
  bool valid = true;

  _CustomTextFieldState({
    this.hint,
    this.textEditingController,
    this.keyboardType,
    this.icon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final bool large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    final bool medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Column(
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.circular(30.0),
          elevation: large ? 12 : (medium ? 10 : 8),
          child: TextFormField(
            controller: textEditingController,
            keyboardType: keyboardType,
            obscureText: obscureText,
            cursorColor: Colors.blue[200],
            onChanged: (text) => setErrorMessage(text),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.deepPurple, size: 20),
              suffixIcon: valid ? null : Icon(Icons.cancel, color: Colors.red[600], size :20),
              hintText: hint,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none
              ),
            ),
          ),
        ),
      ],
    );
  }

  void setErrorMessage(text) {
    final String error = validator(text);
      setState(() {
        valid = error == null;
      });

  }
}
