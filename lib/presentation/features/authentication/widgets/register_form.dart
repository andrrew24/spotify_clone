import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/common/widgets/basic_app_button.dart';
import 'package:spotify_clone/data/models/auth/create_user_model.dart';
import 'package:spotify_clone/domain/usecases/auth/register_usecase.dart';
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
        const Gap(25),
        BasicAppButton(
            title: "Create",
            onPressed: () async {
              var result = await serviceLocator<RegisterUsecase>().call(
                  params: CreateUserModel(
                      fullname: nameController.text,
                      email: emailController.text,
                      password: passwordController.text));
              print(result);
            }),
      ],
    );
  }
}
