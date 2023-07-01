import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/*

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String _savedName = '';
  String _savedEmail = '';
  String _savedMobileNumber = '';
  String _savedAddress = '';

  bool _isEditing = true; // Flag to check if the user is still editing the profile

  File? _userImage; // Stores the selected user image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _isEditing ? _pickUserImage : null, // Open gallery when editing is allowed
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _userImage != null
                        ? FileImage(_userImage!) // Display the selected image
                        : AssetImage('assets/images/user.png') as ImageProvider<Object>?, // Display a default image if no image is selected
                  ),
                ),
              ),



              SizedBox(height: 20),
              Text(
                'Name:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? TextField(
                onChanged: (value) {
                  setState(() {
                    _savedName = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              )
                  : _buildProfileItem('Name', _savedName),

              SizedBox(height: 20),
              Text(
                'Email:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? TextField(
                onChanged: (value) {
                  setState(() {
                    _savedEmail = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                ),
                keyboardType: TextInputType.emailAddress,
              )
                  : _buildProfileItem('Email', _savedEmail),

              SizedBox(height: 20),
              Text(
                'Mobile Number:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? TextField(
                onChanged: (value) {
                  setState(() {
                    _savedMobileNumber = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your mobile number',
                ),
                keyboardType: TextInputType.phone,
              )
                  : _buildProfileItem('Mobile Number', _savedMobileNumber),

              SizedBox(height: 20),
              Text(
                'Address:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? TextField(
                onChanged: (value) {
                  setState(() {
                    _savedAddress = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                ),
                maxLines: 3,
              )
                  : _buildProfileItem('Address', _savedAddress),

              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isEditing = false; // Set editing flag to false after saving
                    });

                    // Show a snackbar to indicate successful profile update
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile Updated Successfully!')),
                    );
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickUserImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _userImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Widgets/getstart_page.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String _savedName = '';
  String _savedEmail = '';
  String _savedMobileNumber = '';
  String _savedAddress = '';

  bool _isEditing = true; // Flag to check if the user is still editing the profile

  File? _userImage; // Stores the selected user image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _isEditing ? _pickUserImage : null, // Open gallery when editing is allowed
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _userImage != null
                        ? FileImage(_userImage!) // Display the selected image
                        : AssetImage('assets/images/pizza.png') as ImageProvider<Object>?, // Display a default image if no image is selected
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Name:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? TextField(
                onChanged: (value) {
                  setState(() {
                    _savedName = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              )
                  : _buildProfileItem('Name', _savedName),

              SizedBox(height: 20),
              Text(
                'Email:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? TextField(
                onChanged: (value) {
                  setState(() {
                    _savedEmail = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                ),
                keyboardType: TextInputType.emailAddress,
              )
                  : _buildProfileItem('Email', _savedEmail),

              SizedBox(height: 20),
              Text(
                'Mobile Number:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? TextField(
                onChanged: (value) {
                  setState(() {
                    _savedMobileNumber = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your mobile number',
                ),
                keyboardType: TextInputType.phone,
              )
                  : _buildProfileItem('Mobile Number', _savedMobileNumber),

              SizedBox(height: 20),
              Text(
                'Address:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? TextField(
                onChanged: (value) {
                  setState(() {
                    _savedAddress = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                ),
                maxLines: 3,
              )
                  : _buildProfileItem('Address', _savedAddress),

              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isEditing = false; // Set editing flag to false after saving
                    });

                    // Show a snackbar to indicate successful profile update
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile Updated Successfully!')),
                    );
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickUserImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _userImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
