import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'firstName': 'Ivan',
      'lastName': 'Ivanov',
      'email': 'ivan@gmail.com',
      'password': '123456',
      'role': 'admin'
    };
    return Scaffold(
      appBar: AppBar(title: const Text('Inputs and Forms')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'First Name',
                  hintText: 'Ivan',
                  suffixicon: Icons.group_outlined,
                  formProperty: 'firstName',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Last Name',
                  hintText: 'Ivanov',
                  suffixicon: Icons.group_outlined,
                  formProperty: 'lastName',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Email',
                  hintText: 'ivan@gmail.com',
                  suffixicon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Password',
                  hintText: '123456',
                  suffixicon: Icons.password_outlined,
                  obscureText: true,
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: 'admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'superuser', child: Text('Superuser')),
                    DropdownMenuItem(value: 'developer', child: Text('Developer')),
                    DropdownMenuItem(value: 'jrdeveloper', child: Text('JrDeveloper')),
                  ],
                  onChanged: (value) {
                    formValues['role'] = value ?? 'Admin';
                  }),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (!formKey.currentState!.validate()) {
                        print('Form is not valid!');
                        return;
                      }
                      print(formValues);
                    },
                    child: const Center(child: Text('Save'))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
