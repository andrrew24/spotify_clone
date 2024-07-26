import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/core/config/assets/images.dart';
import 'package:spotify_clone/core/config/assets/vectors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsImages.imagesIntroBg),
          ),
        ),
        child: Column(
          children: [
            SvgPicture.asset(AssetsVectors.vectorsSpotifyLogo),
            Spacer(),
            Text("Enjoy Listening To Music")
          ],
        ),
      ),
    );
  }
}
