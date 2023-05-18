import 'package:flutter/material.dart';
import '../utils/hexColor.dart';

class PersonalDetailPage extends StatefulWidget {
  final String name;
  final String email;
  final String contactNumber;
  final String address;
  final String password;

  PersonalDetailPage({  
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.address,
    required this.password,
  });

  @override
  _PersonalDetailPageState createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController contactNumberController;
  late TextEditingController addressController;
  late TextEditingController passwordController;

  String selectedAvatar = 'lib/assets/wangzainiunai.jpeg'; // Default avatar image

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    contactNumberController = TextEditingController(text: widget.contactNumber);
    addressController = TextEditingController(text: widget.address);
    passwordController = TextEditingController(text: widget.password);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    contactNumberController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // Handle saving changes to a database or performing any necessary actions
    // with the updated information.
    String updatedName = nameController.text;
    String updatedEmail = emailController.text;
    String updatedContactNumber = contactNumberController.text;
    String updatedAddress = addressController.text;
    String updatedPassword = passwordController.text;

    // Perform necessary operations with the updated information.
    // For example, you can send it to an API or update a local database.
    final snackBar = SnackBar(content: Text('Changes saved!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _changeAvatar() async {
    // Implement the logic to select or change the avatar image
    // This can be achieved by showing a dialog, launching the image picker, or any other method you prefer
    // Once the new avatar image is selected, update the 'selectedAvatar' variable
    // For example:
    // String newAvatar = await showImagePickerDialog();
    // if (newAvatar != null) {
    //   setState(() {
    //     selectedAvatar = newAvatar;
    //   });
    // }

    // For demonstration purposes, we'll use a placeholder image for now
    String newAvatar = 'lib/assets/logo.jpg';
    setState(() {
      selectedAvatar = newAvatar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal Details",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: HexColor.fromHex("#5E7737"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _changeAvatar,
              child: Container(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(selectedAvatar),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(94, 119, 55, 1),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email address',
                  labelStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(94,119,55,1), // Replace 'FF0000FF' with your desired RGB value in hex
                  )),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: contactNumberController,
              decoration: InputDecoration(labelText: 'Contact number',
                  labelStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(94,119,55,1), // Replace 'FF0000FF' with your desired RGB value in hex
                  )),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address',
                  labelStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(94,119,55,1), // Replace 'FF0000FF' with your desired RGB value in hex
                  )),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(94,119,55,1), // Replace 'FF0000FF' with your desired RGB value in hex
                  )),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor.fromHex("#5E7737"),
                fixedSize: const Size(400, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Change the value to adjust the radius
                ),
              ),
              child: const Text('Save Changes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}