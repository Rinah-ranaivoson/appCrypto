import 'dart:developer';

import 'package:encrypto_flutter/encrypto_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String encryptedString = '';
  String decryptedString = '';
  bool _isEditingText = true;
  late List<TextEditingController> controllers;
  late Encrypto encrypto;

  @override
  void initState() {
    controllers = List.generate(3, (_) => TextEditingController());
    encrypto = Encrypto(Encrypto.RSA, bitLength: 128);
    log(encrypto.sterilizePublicKey()); // Enter this in the 1st field while testing
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Encryption Demo'),
          leading: Image.asset('assets/logo.jpg'), // Change 'your_logo.png' to your logo's file name
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Offstage(
                  offstage: true,
                  child: _buildTextBox(0, "ZotPublicKey sterilized string"),
                ),
                const SizedBox(height: 16.0),
                _buildTextBox(1, "Message"),
                const SizedBox(height: 16.0),
                _buildTextBox(2, "Encrypted Message"),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _encryptAndDecrypt,
                  child: const Text("Encrypt and Decrypt"),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _resetFields,
                  child: const Text("Reset All Fields"),
                ),
                const SizedBox(height: 16.0),
                _buildOutputBox("Encrypted Message:", encryptedString),
                const SizedBox(height: 8.0),
                _buildOutputBox("Decrypted Message:", decryptedString),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextBox(int index, String label) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: _isEditingText
          ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          autofocus: true,
          controller: controllers[index],
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
          ),
        ),
      )
          : InkWell(
        onTap: () {
          setState(() {
            _isEditingText = true;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controllers[index].text.isEmpty ? label : controllers[index].text,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOutputBox(String title, String content) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: TextEditingController(text: content),
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Message will be displayed here',
                suffixIcon: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: content));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Copied to Clipboard'),
                    ));
                  },
                  icon: const Icon(Icons.content_copy),
                ),
              ),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }

  void _encryptAndDecrypt() {
    setState(() {
      if (controllers[2].text.isNotEmpty) {
        decryptedString = encrypto.decrypt(controllers[2].text);
        encryptedString = '';
      }
      if (controllers[1].text.isNotEmpty) {
        final publicKey = controllers[0].text.isNotEmpty
            ? Encrypto.desterilizePublicKey(controllers[0].text)
            : encrypto.getPublicKey();
        encryptedString = encrypto.encrypt(controllers[1].text, publicKey: publicKey);
      }
    });
  }

  void _resetFields() {
    setState(() {
      controllers.forEach((controller) => controller.clear());
      encryptedString = '';
      decryptedString = '';
    });
  }
}