import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('asset/images/chetan.png'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Chetan Patil',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'patilc146@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement edit profile functionality
              },
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('sandip university nashik'),
              trailing: Icon(Icons.edit),
              onTap: () {
                // TODO: Implement address editing functionality
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Mobile Number '),
              subtitle: Text('9511234218'),
              trailing: Icon(Icons.edit),
              onTap: () {
                // TODO: Implement payment method editing functionality
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // TODO: Implement logout functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
