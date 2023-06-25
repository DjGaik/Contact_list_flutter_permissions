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
    return Center(
      child: ElevatedButton(
          onPressed: getContactPermission, child: const Text('Get contacts')),
    );
  }
}
