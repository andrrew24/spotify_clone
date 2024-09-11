import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/config/app_urls.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/core/widgets/basic_appbar.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';

class PlaySongPage extends StatelessWidget {
  const PlaySongPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final song = state.extra as SongEntity;
    return Scaffold(
      appBar: BasicAppBar(
        leadingonPressed: () {
          GoRouter.of(context).pop();
        },
        hasBG: true,
        leadinIcon: Icons.arrow_back_ios_new_rounded,
        title: Text(
          "Now Playing",
          style: AppStyles.styleBold18(),
        ),
        trailingIcon: FontAwesomeIcons.ellipsisVertical,
        trailingonPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "${AppConstants.appApi}${song.id}/${song.coverLink}"))),
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      song.title,
                      style: AppStyles.styleBold20(),
                    ),
                    Text(
                      song.artist,
                      style: AppStyles.styleRegular17(),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.favorite_outline_outlined),
                  onPressed: () {},
                  color: AppColors.darkGrey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
