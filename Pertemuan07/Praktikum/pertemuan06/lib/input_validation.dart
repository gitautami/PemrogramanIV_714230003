import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  const MyFormValidation({
    super.key
  });

  @override
  State < MyFormValidation > createState() => _MyFormValidationState();
}
class _MyFormValidationState extends State < MyFormValidation > {
  final GlobalKey < FormState > _formKey = GlobalKey < FormState > ();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerNama.dispose();
    super.dispose();
  }

  String ? validateEmail(String ? value) {
    const String expression = '^[a-zA-Z0-9+._%-]{1,256}\@[a-zA-Z0-9][a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';

    final RegExp regex = RegExp(expression);

    if (value == null || value.isEmpty) {
      return 'Email wwajib diisi';
    }

    if (!regex.hasMatch(value)) {
      return 'Tolong inputkan email yang valid';
    }
    return null;
  }
  String ? validateNama(String ? value) {
    if (value!.length < 3) {
      return 'Masukkan setidaknya 3 karakter';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                        decoration: const InputDecoration(
                          hintText: 'Write Your Email Here...',
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          fillColor: Color.fromARGB(255, 222, 254, 255),
                          filled: true
                        ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _controllerNama,
                        validator: validateNama,
                        decoration: const InputDecoration(
                          hintText: 'Write Your Email Here...',
                          labelText: 'Nama',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          fillColor: Color.fromARGB(255, 222, 254, 255),
                          filled: true
                        ),
                      ),
                  ),
                  ElevatedButton(
                    child: const Text("Submit"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Processing Data'),
                              duration: Duration(seconds: 2),
                              ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please complate the form'),
                              ),
                          );
                        }
                      },
                  ),
                ],
              ),
            ),
        ),
      ));
  }
}