import 'package:flutter_test/flutter_test.dart';
import '../../../lib/src/utils/validator.dart';

void main() {
  // Email Validation Tests
  test('Validator.validateEmail', () {
    var result = Validator.validateEmail('');
    expect(result, 'Email is Required');
  });

  test('Validator.validateEmail', () {
    var result = Validator.validateEmail('BogusEmail.com');
    expect(result, 'Invalid Email');
  });

  test('Validator.validateEmail', () {
    var result = Validator.validateEmail('languageTransfer@gmail.com');
    expect(result, null);
  });

  // Password Validation tests
  test('Validator.validatePasswordLength', () {
    var result = Validator.validatePasswordLength('');
    expect(result, "Password can't be empty");
  });

  test('Validator.validatePasswordLength', () {
    var result = Validator.validatePasswordLength('123456789');
    expect(result, "Password must be longer than 10 characters");
  });

  test('Validator.validatePasswordLength', () {
    var result = Validator.validatePasswordLength('12345678910');
    expect(result, null);
  });

  // mobile number validation
  test('Validator.validateMobile', () {
    var result = Validator.validateMobile('');
    expect(result, "Mobile is Required");
  });

  test('Validator.validateMobile', () {
    var result = Validator.validateMobile('123456789');
    expect(result, "Mobile number must be 10 digits");
  });

  test('Validator.validatePasswordLength', () {
    var result = Validator.validatePasswordLength('1234567891');
    expect(result, null);
  });

  // Name validation Tests
  test('Validator.validateName', () {
    var result = Validator.validateName('');
    expect(result, "Name is Required");
  });

  test('Validator.validateName', () {
    var result = Validator.validateName('123456789');
    expect(result, "Name must be a-z and A-Z");
  });

  test('Validator.validateName', () {
    var result = Validator.validateName('LanTran');
    expect(result, null);
  });

}
