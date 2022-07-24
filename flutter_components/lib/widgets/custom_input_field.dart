import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? suffixicon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.suffixicon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: (value) {
        formValues[formProperty] = value;
      },
      validator: (value) {
        if (formProperty == 'firstName' && value == '') {
          return 'First name is required!';
        }
        if (formProperty == 'firstName' && value!.length < 3) {
          return 'First name must be at least 3 characters long!';
        }
        if (formProperty == 'lastName' && value == '') {
          return 'Last name is required!';
        }
        if (formProperty == 'lastName' && value!.length < 3) {
          return 'Last name must be at least 3 characters long!';
        }
        // ToDo logic for invalid email: regex for example!
        if (formProperty == 'email' && value == '') {
          return 'Email is required!';
        }
        // ToDo logic for invalid password: regex for example!
        if (formProperty == 'password' && value == '') {
          return 'Password is required!';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText, labelText: labelText, suffixIcon: suffixicon == null ? null : Icon(suffixicon)
      ),
    );
  }
}
