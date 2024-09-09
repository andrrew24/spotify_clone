import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/functions/fuctions.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/common/widgets/snackbar/custom_snack_bar.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/core/constants/const.dart';
import 'package:spotify_clone/data/models/auth/signin_user_model.dart';
import 'package:spotify_clone/data/sources/song/song_remote_data_source.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/login/cubit/login_cubit.dart';
import 'package:spotify_clone/presentation/features/authentication/widgets/custom_text_field.dart';
import 'package:spotify_clone/presentation/features/home/manager/cubit/get_new_songs_cubit.dart';

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
          ScaffoldMessenger.of(context)
              .showSnackBar(buildSnackBar("Failure", state.errorMessage));
        }
        if (state is LoginLoading) {
          isLoading = true;
        }
        if (state is LoginSuccess) {
          isLoading = false;
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(buildSnackBar("Success", "Register success"));
          GoRouter.of(context).pushReplacement(kHomePage);
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
                // validator: (value) => validateEmail(value) ,
              ),
              const Gap(15),
              CustomTextField(
                hintText: "Password",
                controller: passwordController,
                // validator: (p0) => null,
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
