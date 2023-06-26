import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class PermissionView extends StatefulWidget {
  const PermissionView({super.key});

  @override
  State<PermissionView> createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView> {
  getContactPermission() async {
    PermissionStatus permissionStatus = await Permission.contacts.status;

    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Потрібно надати доступ до контактів!',
          style: TextStyle(
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            getContactPermission();
          },
          child: const Text('Надати доступ'),
        ),
      ],
    );
  }
}
