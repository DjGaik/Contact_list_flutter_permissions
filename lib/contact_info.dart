import 'package:flutter/material.dart';
import 'package:flutter_contact_list/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contact Info'),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
