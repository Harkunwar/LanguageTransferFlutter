class Validator {
  static String validateName(String value) {
    const String pattern = r'(^[a-zA-Z ]*$)';
    final RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Name is Required';
    } else if (!regExp.hasMatch(value)) {
      return 'Name must be a-z and A-Z';
    }
    return null;
  }

  static String validateMobile(String value) {
    const String pattern = r'(^[0-9]*$)';
    final RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Mobile is Required';
    } else if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    } else if (!regExp.hasMatch(value)) {
      return 'Mobile Number must be digits';
    }
    return null;
  }

  static String validatePasswordLength(String value) {
    if (value.isEmpty) {
      return 'Password can\'t be empty';
    } else if (value.length < 10) {
      return 'Password must be longer than 10 characters';
    }
    return null;
  }

  static String validateEmail(String value) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Email is Required';
    } else if (!regExp.hasMatch(value)) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }
}
