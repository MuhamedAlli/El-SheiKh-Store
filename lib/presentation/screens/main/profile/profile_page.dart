import 'package:elsheikh_store/app/app_prefs.dart';
import 'package:elsheikh_store/app/dependancy_injection.dart';
import 'package:elsheikh_store/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final AppPreferences appPreferences = instance();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: () {
            appPreferences.setUserLoggedOut();
            Navigator.of(context).pushNamed(Routes.loginRoute);
          },
          title: const Text(
            "Log Out",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          trailing: const Icon(
            Icons.arrow_circle_right_outlined,
            size: 28,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
