import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _namaTextboxController = TextEditingController();
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  void dispose() {
    // Jangan lupa untuk dispose controller agar tidak terjadi memory leak
    _namaTextboxController.dispose();
    _emailTextboxController.dispose();
    _passwordTextboxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Registrasi",
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment
                    .stretch, // Memastikan elemen mengambil lebar penuh
                children: [
                  _namaTextField(),
                  const SizedBox(height: 16), // Jarak antar textbox
                  _emailTextField(),
                  const SizedBox(height: 16), // Jarak antar textbox
                  _passwordTextField(),
                  const SizedBox(height: 16), // Jarak antar textbox
                  _passwordKonfirmasiTextField(),
                  const SizedBox(height: 32), // Jarak sebelum button
                  _buttonRegistrasi(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Membuat Textbox Nama
  Widget _namaTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Nama",
        border: OutlineInputBorder(), // Border pada textbox
      ),
      keyboardType: TextInputType.text,
      controller: _namaTextboxController,
      validator: (value) {
        if (value!.length < 3) {
          return "Nama harus diisi minimal 3 karakter";
        }
        return null;
      },
    );
  }

  // Membuat Textbox Email
  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(), // Border pada textbox
      ),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email harus diisi';
        }

        // Validasi format email
        Pattern pattern = r'^([a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+)$';
        RegExp regex = RegExp(pattern.toString());

        if (!regex.hasMatch(value)) {
          return "Email tidak valid";
        }

        return null;
      },
    );
  }

  // Membuat Textbox Password
  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(), // Border pada textbox
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordTextboxController,
      validator: (value) {
        if (value!.length < 6) {
          return "Password harus diisi minimal 6 karakter";
        }
        return null;
      },
    );
  }

  // Membuat Textbox Konfirmasi Password
  Widget _passwordKonfirmasiTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Konfirmasi Password",
        border: OutlineInputBorder(), // Border pada textbox
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
        if (value != _passwordTextboxController.text) {
          return "Konfirmasi Password tidak sama";
        }
        return null;
      },
    );
  }

  // Membuat Tombol Registrasi
  Widget _buttonRegistrasi() {
    return ElevatedButton(
      child: _isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : const Text("Registrasi"),
      onPressed: _isLoading
          ? null
          : () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _isLoading = true;
                });

                // Simulasi proses registrasi (misalnya, dengan Future.delayed)
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    _isLoading = false;
                  });

                  // Tambahkan logika setelah registrasi berhasil
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Registrasi berhasil!"),
                    ),
                  );
                });
              }
            },
    );
  }
}
