import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController(text: "Jane Doe");
  final TextEditingController _addressController = TextEditingController(text: "123 Kandy Street");
  final TextEditingController _postalCodeController = TextEditingController(text: "20000");
  final TextEditingController _emailController = TextEditingController(text: "jane@example.com");
  final TextEditingController _phoneController = TextEditingController(text: "0771234567");
  final TextEditingController _dobController = TextEditingController(text: "1998-06-15");
  String _gender = "Female";

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: _gender,
        decoration: InputDecoration(
          labelText: 'Gender',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        items: ['Male', 'Female', 'Other'].map((gender) {
          return DropdownMenuItem(
            value: gender,
            child: Text(gender),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _gender = value!;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : AssetImage('assets/user.jpg') as ImageProvider,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Tap image to change", style: TextStyle(color: Colors.grey)),
                _buildTextField("Full Name", _nameController),
                _buildTextField("Address", _addressController),
                _buildTextField("Postal Code", _postalCodeController),
                _buildTextField("Email", _emailController),
                _buildTextField("Phone Number", _phoneController),
                _buildTextField("Date of Birth", _dobController),
                _buildGenderDropdown(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Save or update logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Profile updated")),
                    );
                  },
                  child: Text("Update Profile"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
