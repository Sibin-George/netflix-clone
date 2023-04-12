import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/loginpage.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void signUserOut() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    FirebaseAuth.instance.signOut().then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/mainscreen');
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          'Profiles & More',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SafeArea(
          child: Container(
        width: 360,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 17, 17, 17),
                  border: Border.all(color: kgrey)),
              child: const Icon(Icons.add)),
          kheight10,
          const Text(
            'Add Profile',
            style: TextStyle(fontSize: 10, color: kgreydark),
          ),
          kheight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.mode_edit_outlined,
                color: kgrey,
                size: 20,
              ),
              kwidth10,
              Text(
                'Manage Profiles',
                style: TextStyle(fontWeight: FontWeight.bold, color: kgrey),
              )
            ],
          ),
          kheight30,
          const Listbar(
            icon: (Icons.notifications),
            title: 'Notificartion',
          ),
          const Listbar(
            icon: (Icons.playlist_add_check_rounded),
            title: 'My List',
          ),
          const Listbar(
            icon: (Icons.settings),
            title: 'App Setting',
          ),
          const Listbar(
            icon: (Icons.account_circle_outlined),
            title: 'Account',
          ),
          const Listbar(
            icon: (Icons.help_outline),
            title: 'Help',
          ),
          TextButton(onPressed: signUserOut, child: const Text('Sign Out'))
        ]),
      )),
    );
  }
}

class Listbar extends StatelessWidget {
  const Listbar({Key? key, required this.icon, required this.title})
      : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.grey[900]),
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded,
              size: 15, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
