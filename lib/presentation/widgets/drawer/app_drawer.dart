import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer ({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFF80DEEA),
              ),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Noufal Rahim',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal
                      ),
                    )
                  ],
                ),
              )
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle navigation or actions
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      );
  }
}