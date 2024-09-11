import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/presentation/features/choosemode/manager/cubit/theme_cubit.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({
    super.key,
    this.title,
    required this.leadinIcon,
    required this.hasBG,
    required this.leadingonPressed,
    this.trailingIcon,
    this.trailingonPressed,
  });

  final Widget? title;
  final IconData leadinIcon;
  final IconData? trailingIcon;
  final bool hasBG;
  final void Function() leadingonPressed;
  final void Function()? trailingonPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        trailingIcon == null
            ? const SizedBox()
            : IconButton(
                onPressed: trailingonPressed,
                icon: Icon(
                  trailingIcon,
                  size: 20,
                ))
      ],
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        onPressed: leadingonPressed,
        splashRadius: 1,
        icon: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: hasBG ? Colors.white.withOpacity(0.03) : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            leadinIcon,
            size: 15,
            color:
                BlocProvider.of<ThemeCubit>(context).state == ThemeState.light
                    ? Colors.black
                    : Colors.white,
          ),
        ),
      ),
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
