import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// {@template AccountDrawer}
/// Main Scaffold drawer for logged in users.
/// {@endtemplate}
class AccountDrawer extends StatelessWidget {
  /// {@macro AccountDrawer}
  const AccountDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = GetIt.I<BaseAuthRepository<AuthUser>>();
    final user = authRepo.lastUser.$1;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(user.id),
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: authRepo.logOut,
          ),
        ],
      ),
    );
  }
}
