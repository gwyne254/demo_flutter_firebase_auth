import 'package:demo_flutter_firebase_auth/services/authentication_services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  final Function toggleScreen;
  const Register({Key? key, required this.toggleScreen}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 60),
                const Text('Welcome',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text('Create account to continue',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 30),
                TextFormField(
                    controller: _emailController,
                    validator: (val) =>
                        val!.isNotEmpty ? null : "Please enter a email address",
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail),
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                const SizedBox(height: 30),
                TextFormField(
                    controller: _passwordController,
                    validator: (val) =>
                        val!.length < 6 ? null : "Enter more than 6 characters",
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.vpn_key),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                const SizedBox(height: 30),
                MaterialButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      // print("Email: ${_emailController.text}");
                      // print("Password: ${_passwordController.text}");
                      await loginProvider.register(_emailController.text.trim(),
                          _passwordController.text.trim());
                    }
                  },
                  height: 60,
                  minWidth: loginProvider.isLoading ? null : double.infinity,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: loginProvider.isLoading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    const SizedBox(height: 5),
                    TextButton(
                      onPressed: () => widget.toggleScreen(),
                      child: const Text('Login'),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                if (loginProvider.errorMessage != null)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.amberAccent,
                    child: ListTile(
                      title: Text(loginProvider.errorMessage),
                      leading: const Icon(Icons.error),
                      trailing: IconButton(
                          onPressed: () => loginProvider.setMessage(null),
                          icon: const Icon(Icons.close)),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
