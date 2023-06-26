import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  final Uint8List? image;
  final String displayName;
  final String phoneNumber;

  const ContactInfo(
      {Key? key,
      required this.image,
      required this.displayName,
      required this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contact Info'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image(image: image!),
            const SizedBox(height: 20),
            Text(
              displayName,
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(height: 20),
            Text(
              phoneNumber,
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20),
            IconButton(
              onPressed: () {
                if (phoneNumber.isNotEmpty) {
                  launchUrl(
                    Uri(
                      scheme: 'tel',
                      path: phoneNumber,
                    ),
                  );
                }
              },
              icon: const Icon(Icons.call),
            ),
          ],
        ),
      ),
    );
  }
}
