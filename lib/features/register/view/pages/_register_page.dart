import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talkit/features/login/view/widgets/_custom_button.dart';
import 'package:talkit/features/login/view/widgets/_custom_textfield.dart';
import 'package:talkit/features/register/controller/_register_provider.dart';
import 'package:talkit/services/register/_firebase_register.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var genderList = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final read = ref.watch(registerProvider);
    final write = ref.read(registerProvider);

    return WillPopScope(
      onWillPop: () async => !read.isLoading,
      child: Scaffold(
        backgroundColor: theme.surface,
        appBar: AppBar(
          title: const Text('Create a new account'),
          elevation: 2,
          leading: IconButton(
            onPressed: read.isLoading
                ? null
                : () {
                    write.setLoadingData = false;
                    write.setDate = null;
                    write.setDropDownValue = "Male";
                    write.setImage = null;
                    _nameController.clear();
                    _emailController.clear();
                    _passwordController.clear();
                    Navigator.of(context).pop();
                  }, // Keeps the button visible but does nothing if isLoading is true
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                      hint: "Name",
                      prefixIconData: Icons.person,
                      isPassword: false,
                      theme: theme,
                      controller: _nameController),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: "Email",
                      prefixIconData: Icons.email,
                      isPassword: false,
                      theme: theme,
                      controller: _emailController),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: "Password",
                      prefixIconData: Icons.key,
                      isPassword: true,
                      theme: theme,
                      controller: _passwordController),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomGenderPicker(theme: theme, genderList: genderList),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    theme: theme,
                    width: double.infinity,
                    height: 55,
                    primaryColor: theme.primary.withOpacity(.2),
                    foreGroundColor: theme.onSurface.withOpacity(.5),
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1920),
                          lastDate: DateTime(DateTime.now().year));
                      if (picked != null && picked != read.getSelectedDate) {
                        write.setDate = picked;
                      }
                    },
                    label: read.getSelectedDate == null
                        ? "Select date of birth"
                        : read.getSelectedDate.toString().split(" ").first,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    theme: theme,
                    width: double.infinity,
                    height: 55,
                    primaryColor: theme.primary.withOpacity(.2),
                    foreGroundColor: theme.onSurface.withOpacity(.5),
                    onPressed: () async {
                      final ImagePicker _picker = ImagePicker();
                      final XFile? pickedImage =
                          await _picker.pickImage(source: ImageSource.gallery);

                      if (pickedImage != null) {
                        write.setImage = pickedImage;
                      }
                    },
                    label: read.getImage == null
                        ? "Pick an image"
                        : read.getImage!.name.toString(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                      theme: theme,
                      width: double.infinity,
                      height: 55,
                      primaryColor: theme.primary,
                      foreGroundColor: theme.onPrimary,
                      isLoading: read.isLoading,
                      onPressed: () async {
                        String name = _nameController.text.trim();
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();
                        String? gender = read.getDropDownValue;
                        DateTime? dob = read.getSelectedDate;
                        XFile? image = read.getImage;

                        print("Gender: $gender");
                        print("Gender: $dob");
                        print("Gender: ${image!.name}");

                        write.setLoadingData = true;

                        if (name.isNotEmpty &&
                            email.isNotEmpty &&
                            password.isNotEmpty &&
                            gender != null &&
                            dob != null &&
                            image != null) {
                          if (password.length < 6) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: theme.primary,
                                content: Text(
                                  'Enter a password more than 6 characters!',
                                  style: TextStyle(color: theme.onPrimary),
                                )));
                            return;
                          }

                          if (!EmailValidator.validate(email)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: theme.primary,
                                content: Text(
                                  'Enter a valid email!',
                                  style: TextStyle(color: theme.onPrimary),
                                )));
                            return;
                          }

                          FirebaseRegister firebaseRegister =
                              FirebaseRegister();

                          bool response = await firebaseRegister.registerUser(
                              name,
                              email,
                              password,
                              gender,
                              dob.toString(),
                              image);

                          if (response) {
                            write.setLoadingData = false;
                            write.setDate = null;
                            write.setDropDownValue = "Male";
                            write.setImage = null;
                            _nameController.clear();
                            _emailController.clear();
                            _passwordController.clear();

                            Navigator.of(context).pop();

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: theme.primary,
                                content: Text(
                                  'Account created successfully!',
                                  style: TextStyle(color: theme.onPrimary),
                                )));
                          } else {
                            write.setLoadingData = false;

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: theme.primary,
                                content: Text(
                                  'Something went wrong!',
                                  style: TextStyle(color: theme.onPrimary),
                                )));
                          }
                        } else {
                          write.setLoadingData = false;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: theme.primary,
                              content: Text(
                                'Fill all the data correctly!',
                                style: TextStyle(color: theme.onPrimary),
                              )));
                        }
                      },
                      label: "Sign up")
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}

class CustomGenderPicker extends StatelessWidget {
  const CustomGenderPicker({
    super.key,
    required this.theme,
    required this.genderList,
  });

  final ColorScheme theme;
  final List<String> genderList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: theme.primary.withOpacity(.1),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButtonFormField(
          decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: theme.primary.withOpacity(.1)),
          hint: Text(
            'Select Gender',
            style: TextStyle(color: theme.onSurface.withOpacity(.5)),
          ),
          // menuWidth: MediaQuery.of(context).size.width-60,
          items: genderList.map((String item) {
            return DropdownMenuItem(
              child: Text(item),
              value: item,
            );
          }).toList(),
          onChanged: (String? newValue) {}),
    );
  }
}
