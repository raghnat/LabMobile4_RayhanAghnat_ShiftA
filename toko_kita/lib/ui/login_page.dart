import 'package:flutter/material.dart';
import 'package:toko_kita/ui/registrasi_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  void dispose() {
    _emailTextboxController.dispose();
    _passwordTextboxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Login Rehan',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        // Memposisikan seluruh konten di tengah
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Padding di sekitar form
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Mengatur agar berada di tengah vertikal
                crossAxisAlignment: CrossAxisAlignment
                    .stretch, // Memastikan elemen mengambil lebar penuh
                children: [
                  _emailTextField(),
                  const SizedBox(height: 16), // Jarak antar textbox
                  _passwordTextField(),
                  const SizedBox(height: 32), // Jarak sebelum button
                  _buttonLogin(),
                  const SizedBox(height: 30), // Margin bawah untuk button
                  _menuRegistrasi(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Membuat Textbox email
  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(), // Tambahkan border pada textbox
      ),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email harus diisi';
        }
        return null;
      },
    );
  }

  // Membuat Textbox password
  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(), // Tambahkan border pada textbox
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password harus diisi";
        }
        return null;
      },
    );
  }

  // Membuat Tombol Login
  Widget _buttonLogin() {
    return ElevatedButton(
      child: _isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : const Text("Login"),
      onPressed: _isLoading
          ? null
          : () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _isLoading = true;
                });

                // Simulasi proses login (misalnya, dengan Future.delayed)
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    _isLoading = false;
                  });

                  // Tambahkan logika setelah login berhasil
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Login berhasil!"),
                    ),
                  );
                });
              }
            },
    );
  }

  // Membuat menu untuk membuka halaman registrasi
  Widget _menuRegistrasi() {
    return Center(
      child: InkWell(
        child: const Text(
          "Registrasi",
          style: TextStyle(color: Colors.blue),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegistrasiPage()),
          );
        },
      ),
    );
  }
}
