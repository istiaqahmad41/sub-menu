import 'package:flutter/material.dart';

void main() {
  runApp(Menu_submanu_MenuAnchor_126_demo());
}

class Menu_submanu_MenuAnchor_126_demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Submenu Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SubmenuExample(),
    );
  }
}

class SubmenuExample extends StatefulWidget {
  @override
  _SubmenuExampleState createState() => _SubmenuExampleState();
}

class _SubmenuExampleState extends State<SubmenuExample> {
  void _onMenuItemSelected(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Selected: $value'),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Submenu Example'),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu),
            onSelected: _onMenuItemSelected,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text('Profile'),
                value: 'Profile',
              ),
              PopupMenuItem(
                child: Text('Settings'),
                value: 'Settings',
                onTap: () {
                  _showSettingsSubMenu(context);
                },
              ),
              PopupMenuItem(
                child: Text('Help'),
                value: 'Help',
                onTap: () {
                  _showHelpSubMenu(context);
                },
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('Select a menu item from the top right corner'),
      ),
    );
  }

  void _showSettingsSubMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Settings Submenu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Account Settings'),
                onTap: () {
                  Navigator.of(context).pop();
                  _onMenuItemSelected('Account Settings');
                },
              ),
              ListTile(
                title: Text('Privacy Settings'),
                onTap: () {
                  Navigator.of(context).pop();
                  _onMenuItemSelected('Privacy Settings');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showHelpSubMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Help Submenu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('User Guide'),
                onTap: () {
                  Navigator.of(context).pop();
                  _onMenuItemSelected('User Guide');
                },
              ),
              ListTile(
                title: Text('FAQ'),
                onTap: () {
                  Navigator.of(context).pop();
                  _onMenuItemSelected('FAQ');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
