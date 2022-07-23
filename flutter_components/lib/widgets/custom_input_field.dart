import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? suffixicon;
  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText, 
    this.suffixicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {
        print(value);
      },
      validator: (value) {
        if (value == null) {
          return 'This field is required!';
        }
        return value.length < 3
            ? 'Username must be at least 3 characters long!'
            : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixicon == null ? null : Icon(suffixicon),
        // focusedBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.black87
        //   )
        // ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10)
        // )
      ),
    );
  }
}
