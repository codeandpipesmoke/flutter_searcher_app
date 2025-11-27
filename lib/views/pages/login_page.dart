import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  //final String confirmedPassword = '123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              /*
              ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Image.network(
                  'https://picsum.photos/seed/picsum/200/300',
                  fit: BoxFit.cover,
                  width: 250,
                  height: 250,
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image(
                  image: AssetImage('assets/backgrounds/deak.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              */
              SizedBox(height: 20.0),
              TextField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onEditingComplete: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text('SnackBar 123'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  // TODO
                },
              ),
              SizedBox(height: 25.0),
              TextField(
                controller: controllerPassword,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Jelszó',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onEditingComplete: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text('SnackBar 123'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  // TODO
                },
              ),
              SizedBox(height: 30.0),
              FilledButton(
                onPressed: () {
                  //onLoginPressed();
                },
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40.0),
                ),
                child: Text('Bejelentkezés'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*
  void onLoginPressed() {
    if (confirmedPassword == controllerPassword.text) {
      navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
        (route) => false,
      );
    }
  }
  */
}
