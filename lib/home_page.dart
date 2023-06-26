import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter_contact_list/permission.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_contact_list/contact_info.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    getContact();
  }

  void getContact() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final List<Contact> contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_permissionDenied) return const Center(child: PermissionView());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: (_contacts) == null
          ? const Center(
              child: Text('Contacts List Is Empty'),
            )
          : ListView.builder(
              itemCount: _contacts!.length,
              itemBuilder: (BuildContext context, int index) {
                Uint8List? image = _contacts![index].photo;
                String num = (_contacts![index].phones.isNotEmpty)
                    ? (_contacts![index].phones.first.number)
                    : _contacts![index].displayName;
                return ListTile(
                  leading: (_contacts![index].photo == null)
                      ? const CircleAvatar(child: Icon(Icons.person))
                      : CircleAvatar(backgroundImage: MemoryImage(image!)),
                  title: Text(_contacts![index].displayName),
                  subtitle: Text(num),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Route route = MaterialPageRoute(
                      builder: (context) => ContactInfo(
                        image: _contacts![index].photo,
                        displayName: _contacts![index].displayName,
                        phoneNumber: _contacts![index].phones.first.number,
                      ),
                    );
                    Navigator.push(context, route);
                  },
                );
              },
            ),
    );
  }
}
