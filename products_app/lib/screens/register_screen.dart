import 'package:flutter/material.dart';
import 'package:products_app/providers/login_form_provider.dart';
import 'package:products_app/services/services.dart';
import 'package:products_app/ui/input_decorations.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 180),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Register',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: ((context) => LoginFormProvider()),
                      child: const _LoginForm(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.indigo.withOpacity(0.5))),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'login'),
                child: const Text(
                  "Already have an account? Please login!",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logingFormProvider = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: logingFormProvider.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => logingFormProvider.email = value,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.inputDecoration(
                  labelText: 'Email', suffixIcon: Icons.email_outlined),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Email is not valid!';
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              onChanged: (value) => logingFormProvider.password = value,
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.inputDecoration(
                  labelText: 'Password', suffixIcon: Icons.lock_open_rounded),
              validator: (value) {
                if (value != null && value.length >= 6) {
                  return null;
                } else {
                  return 'Password must be at least 6 characters long!';
                }
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              onPressed: logingFormProvider.isLoading
                  ? null
                  : () async {
                      // Remove the keyboard
                      FocusScope.of(context).unfocus();
                      final authService = Provider.of<AuthService>(context, listen: false);
                      if (!logingFormProvider.isValidForm()) {
                        return;
                      } else {
                        logingFormProvider.isLoading = true;
                        String? errorMessage = await authService.createUser(
                            logingFormProvider.email,
                            logingFormProvider.password);
                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(context, 'login');
                        } else {
                          // Show eerror message!
                          logingFormProvider.isLoading = false;                        
                        }
                      }
                    },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  logingFormProvider.isLoading ? 'Please wait...' : 'Register',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
