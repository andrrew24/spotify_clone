import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone/presentation/features/authentication/widgets/custom_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hintText: "Full Name", controller: nameController),
        const Gap(25),
        CustomTextField(hintText: "Enter Email", controller: emailController),
        const Gap(25),
        CustomTextField(hintText: "Password", controller: passwordController),
      ],
    );
  }
}
