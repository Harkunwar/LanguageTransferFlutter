import 'package:flutter_test/flutter_test.dart';
import 'package:language_transfer/src/utils/validator.dart';

void main() {
  // Email Validation Tests
  test('Empty Email Test', () {
    final result = Validator.validateEmail('');
    expect(result, 'Email is Required');
  });

  test('Invalid Email Test', () {
    final result = Validator.validateEmail('BogusEmail.com');
    expect(result, 'Invalid Email');
  });

  test('Valid Email Test', () {
    final result = Validator.validateEmail('languageTransfer@gmail.com');
    expect(result, null);
  });

  // Password Validation tests
  test('Empty Password Test', () {
    final result = Validator.validatePasswordLength('');
    expect(result, "Password can't be empty");
  });

  test('Invalid Password length test', () {
    final result = Validator.validatePasswordLength('123456789');
    expect(result, "Password must be longer than 10 characters");
  });

  test('Valid password length test', () {
    final result = Validator.validatePasswordLength('12345678910');
    expect(result, null);
  });

  // mobile number validation
  test('Empty mobile number Test', () {
    final result = Validator.validateMobile('');
    expect(result, "Mobile is Required");
  });

  test('Invalid mobile number Test', () {
    final result = Validator.validateMobile('123456789');
    expect(result, "Mobile number must be 10 digits");
  });

  test('Valid mobile number Test', () {
    final result = Validator.validateMobile('1234567891');
    expect(result, null);
  });

  // Name validation Tests
  test('Empty Name Test', () {
    final result = Validator.validateName('');
    expect(result, "Name is Required");
  });

  test('Invalid name Test', () {
    final result = Validator.validateName('123456789');
    expect(result, "Name must be a-z and A-Z");
  });

  test('Valid name Test', () {
    final result = Validator.validateName('LanTran');
    expect(result, null);
  });

}