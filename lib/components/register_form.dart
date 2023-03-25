import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/screens/login.dart';
import 'package:flutter_crud_ncf_app/screens/register_status.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';
import 'package:http/http.dart' as http;

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _password;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Do something with the form data, such as submitting it to a server
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return RegisterStatus(
          registerStatus: registerUser(_email, _name, _password),
        );
      }), (route) => false);
    }
  }

  Future<bool> registerUser(String email, String name, String password) async {
    final response = await http.post(
      Uri.parse('http://zz.ncf.edu.ph/public/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'name': name,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.grey[300],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                labelStyle:
                    const TextStyle(fontSize: FontSizeSetting.placeholder),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                final RegExp nameExp = RegExp(r'^[a-zA-Z\s]+$');
                if (!nameExp.hasMatch(value)) {
                  return 'Please enter only alphabetical characters';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.grey[300],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                labelStyle:
                    const TextStyle(fontSize: FontSizeSetting.placeholder),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!.toLowerCase();
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.grey[300],
            ),
            child: TextFormField(
              obscureText: !_showPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                labelStyle:
                    const TextStyle(fontSize: FontSizeSetting.placeholder),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _showPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onChanged: (value) {
                _password = value;
              },
              onSaved: (value) {
                _password = value!;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.grey[300],
            ),
            child: TextFormField(
              obscureText: !_showConfirmPassword,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                labelStyle:
                    const TextStyle(fontSize: FontSizeSetting.placeholder),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _showConfirmPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _showConfirmPassword = !_showConfirmPassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password doesn't match";
                }
                if (value != _password) {
                  return "Password doesn't match";
                }

                return null;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0)))),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }
}
