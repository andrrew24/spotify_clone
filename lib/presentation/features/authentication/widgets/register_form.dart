import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/common/functions/fuctions.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/common/widgets/snackbar/custom_snack_bar.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/core/constants/const.dart';
import 'package:spotify_clone/data/models/auth/create_user_model.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/register/cubit/register_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/widgets/custom_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(buildSnackBar("Failure", state.errorMessage));
        }
        if (state is RegisterLoading) {
          isLoading = true;
        }
        if (state is RegisterSuccess) {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(buildSnackBar("Success", "Register success"));

          GoRouter.of(context).pushReplacement(kHomePage);
        }
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                hintText: "Full Name",
                controller: nameController,
                validator: (value) => validateName(value) ,
              ),
              const Gap(25),
              CustomTextField(
                hintText: "Enter Email",
                controller: emailController,
                validator: (value) => validateEmail(value) ,
              ),
              const Gap(25),
              CustomTextField(
                hintText: "Password",
                controller: passwordController,
                validator: (value) => validatePassword(value) ,
              ),
              const Gap(25),
              isLoading
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : BasicAppButton(
                      title: "Create",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await BlocProvider.of<RegisterCubit>(context)
                              .registerUser(CreateUserModel(
                                  fullname: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text));
                        }
                      }),
            ],
          ),
        );
      },
    );
  }
}

