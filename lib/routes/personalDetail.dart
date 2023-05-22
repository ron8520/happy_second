import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../states/app.dart';
import '../utils/hexColor.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key});

  @override
  _PersonalDetailPageState createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController contactNumberController;
  late TextEditingController passwordController;

  String selectedAvatar =
      'lib/assets/wangzainiunai.jpeg'; // Default avatar image

  @override
  void initState() {
    super.initState();
    final app = Provider.of<AppModel>(context, listen: false);
    nameController = TextEditingController(text: app.currentUser!.username);
    emailController =
        TextEditingController(text: app.currentUser!.emailAddress);
    contactNumberController =
        TextEditingController(text: app.currentUser!.number);
    passwordController = TextEditingController(text: app.currentUser!.password);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    contactNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _saveChanges() async {
    // Handle saving changes to a database or performing any necessary actions
    // with the updated information.
    final app = Provider.of<AppModel>(context, listen: false);
    String updatedName = nameController.text;
    String updatedNumber = contactNumberController.text;
    String updatedPassword = passwordController.text;
    await app
        .updateUserDetails(context, updatedName, updatedNumber, updatedPassword)
        .then((value) => {
              EasyLoading.showSuccess("Update Successful"),
              Navigator.pop(context)
            });
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _changeAvatar,
              child: SizedBox(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(selectedAvatar),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                focusColor: Color.fromRGBO(94, 119, 55, 1),
                fillColor: Color.fromRGBO(94, 119, 55, 1),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(94, 119, 55, 1))),
                labelStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(94, 119, 55, 1),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              enabled: false,
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: 'Email address',
                  labelStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(94, 119, 55,
                        1), // Replace 'FF0000FF' with your desired RGB value in hex
                  )),
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: contactNumberController,
              decoration: const InputDecoration(
                  labelText: 'Contact number',
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(94, 119, 55, 1))),
                  labelStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(94, 119, 55,
                        1), // Replace 'FF0000FF' with your desired RGB value in hex
                  )),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: 'Password',
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(94, 119, 55, 1))),
                  labelStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(94, 119, 55,
                        1), // Replace 'FF0000FF' with your desired RGB value in hex
                  )),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor.fromHex("#5E7737"),
                fixedSize: const Size(400, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Change the value to adjust the radius
                ),
              ),
              child: const Text('Save Changes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
