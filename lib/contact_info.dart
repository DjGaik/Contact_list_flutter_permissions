import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  final dynamic contactImage;
  final String displayName;
  final String phoneNumber;

  const ContactInfo(
      {Key? key,
      required this.contactImage,
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
            Image(
                image: contactImage,
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(
              displayName,
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1, color: Colors.black),
            Column(
              children: [
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
                const Text('Call'),
                const SizedBox(height: 10),
                const Divider(thickness: 1, color: Colors.black),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              phoneNumber,
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
