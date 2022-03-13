import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class Name extends FormzInput<String, EmailValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);

  // static final RegExp emailRegExp = RegExp(
  //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static final RegExp emailRegExp = RegExp(r'^.{1,50}$');
  @override
  EmailValidationError? validator(String value) {
    return emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}
