import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: SignInPage());
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final controllerEmail = TextEditingController();
  final controllerPwd = TextEditingController();
  bool isTandCEnabled = false;

  final _keyForm = GlobalKey<FormState>();
  String? validateEmail(String? content) {
    if (content != null && content.isNotEmpty && content.contains("@")) {
      return null;
    }
    return "Renseignez un e-mail";
  }

  String? validatePassword(String? content) {
    if (content != null && content.isNotEmpty) {
      return null;
    }
    return "Renseignez un mot de passe";
  }

  void submitForm() {
    _keyForm.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('appbarTitle')),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            spacing: 8,
            children: [
              TextFormField(
                controller: controllerEmail,
                validator: validateEmail,
                onChanged: (a) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  labelText: "E-mail",
                  hintText: "john@doe.com",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: controllerPwd,
                onChanged: (a) {
                  setState(() {});
                },
                validator: validatePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "MdpTr€Komplïke",
                ),
                obscureText: true,
              ),
              CheckboxListTile(
                isError: !isTandCEnabled,
                value: isTandCEnabled,
                onChanged: (value) {
                  setState(() {
                    isTandCEnabled = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("Accepts Terms & Conditions"),
              ),
              !isTandCEnabled ? Text("You must accept the T&C") : Container(),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text("Me connecter"),
                  onPressed:
                      _keyForm.currentState?.validate() == true &&
                              isTandCEnabled
                          ? submitForm
                          : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
