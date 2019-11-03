import 'package:flutter_test/flutter_test.dart';
import '../lib/src/utils/validator.dart';

void main() {

  test('Empty Email Test', () {
    var result = Validator.validateEmail('');
    expect(result, 'Email is Required');
  });

  test('Invalid Email Test', () {
    var result = Validator.validateEmail('BogusEmail.com');
    expect(result, 'Invalid Email');
  });

  test('Valid Email', () {
    var result = Validator.validateEmail('languageTransfer@gmail.com');
    expect(result, null);
  });
}
