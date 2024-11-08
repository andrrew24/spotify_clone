import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/functions/fuctions.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/data/models/auth/signin_user_model.dart';
import 'package:spotify_clone/data/sources/song/song_remote_data_source.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/login/cubit/login_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/widgets/custom_text_field.dart';
import 'package:spotify_clone/presentation/features/home/manager/get_new_songs_cubit/get_new_songs_cubit.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({
    super.key,
  });

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          isLoading = false;
        }
        if (state is LoginLoading) {
          isLoading = true;
        }
        if (state is LoginSuccess) {
          isLoading = false;
          GoRouter.of(context).pushReplacement(AppConstants.kHomePage);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recovery password",
                  style: AppStyles.styleMedium14(),
                ),
              ),
              const Gap(20),
              isLoading
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : BasicAppButton(
                      title: "Sign in",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await BlocProvider.of<LoginCubit>(context).loginUser(
                              SigninUserModel(
                                  email: emailController.text,
                                  password: passwordController.text));
                        }
                      })
            ],
          ),
        );
      },
    );
  }
}
