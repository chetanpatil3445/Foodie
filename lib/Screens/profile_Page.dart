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
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'john.doe@example.com',
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
              subtitle: Text('123 Main St, City'),
              trailing: Icon(Icons.edit),
              onTap: () {
                // TODO: Implement address editing functionality
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Payment Method'),
              subtitle: Text('Visa ending in 1234'),
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
