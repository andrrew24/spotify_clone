import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone/common/widgets/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/presentation/features/authentication/widgets/custom_text_field.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({
    super.key,
  });

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          hintText: "Enter email or name",
          controller: emailController,
        ),
        const Gap(15),
        CustomTextField(
          hintText: "Password",
          controller: passwordController,
        ),
        const Gap(20),
        Text(
          "Recovery password",
          style: AppStyles.styleMedium14(),
        ),
        const Gap(20),
        BasicAppButton(title: "Sign in", onPressed: () {})
      ],
    );
  }
}

