import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/common/helper/is_dark_mode.dart';
import 'package:spotify_clone/presentation/features/choosemode/manager/cubit/theme_cubit.dart';

class HomeBasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeBasicAppBar({
    super.key,
    this.title,
    required this.leadinIcon,
    required this.hasBG,
    required this.leadingonPressed,
    required this.trailing,
  });

  final Widget? title;
  final IconData leadinIcon;
  final bool hasBG;
  final Widget trailing;
  final void Function() leadingonPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [trailing],
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
            color: isLightMode(context) ? Colors.black : Colors.white,
          ),
        ),
      ),
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
