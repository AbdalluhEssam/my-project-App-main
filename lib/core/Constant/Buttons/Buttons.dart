import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Images/Images.dart';
import '../Colors/Colors.dart';
import '../Fonts/Fonts.dart';
import '../Url_launcher/url_launcher.dart';

class MainButton extends StatefulWidget {
  final String nameButton;
  final void Function()? onClickButton;

  const MainButton({super.key, required this.nameButton, this.onClickButton});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClickButton,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Container(
          width: Get.width * 0.75,
          decoration: BoxDecoration(
            color: orangeColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.nameButton,
                style: bigWhiteColor,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondButton extends StatefulWidget {
  final String nameButton;
  final void Function()? onClickButton;

  const SecondButton({super.key, required this.nameButton, this.onClickButton});

  @override
  State<SecondButton> createState() => _SecondButtonState();
}

class _SecondButtonState extends State<SecondButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: widget.onClickButton,
          child: Container(
            width: Get.width * 0.6,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: orangeColor, width: 1.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.nameButton,
                  style: bigBlackColor,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class ArrowBackButton extends StatefulWidget {
  const ArrowBackButton({super.key});

  @override
  State<ArrowBackButton> createState() => _ArrowBackButtonState();
}

class _ArrowBackButtonState extends State<ArrowBackButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.06,
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_sharp,
                      color: orangeColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SocialMediaButton extends StatefulWidget {
  final String socialMediaImage;
  final double heightSocialMediaImage;
  final double widthSocialMediaImage;
  final void Function()? onClickButton;

  const SocialMediaButton(
      {super.key,
      required this.socialMediaImage,
      this.onClickButton,
      required this.heightSocialMediaImage,
      required this.widthSocialMediaImage});

  @override
  State<SocialMediaButton> createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<SocialMediaButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClickButton,
      child: Container(
        width: Get.width * 0.14,
        height: Get.height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: orangeColor,
        ),
        child: Center(
            child: Image.asset(
          "images/${widget.socialMediaImage}",
          width: Get.width * widget.widthSocialMediaImage,
          height: Get.height * widget.heightSocialMediaImage,
          color: Theme.of(context).primaryColor,
          fit: BoxFit.cover,
        )
            // child: LocalSvgImage(
            //     localImagePath: widget.socialMediaImage,
            //     widthImage: 0.15,
            //     heightImage: 0.025,
            //   colorImage: Theme.of(context).primaryColor,
            // ),
            ),
      ),
    );
  }
}

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  final UrlLauncherController urlLauncherController =
      Get.put(UrlLauncherController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: SizedBox(
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SocialMediaButton(
              socialMediaImage: "tawasol.png",
              widthSocialMediaImage: 0.15,
              heightSocialMediaImage: 0.055,
              onClickButton: () {
                urlLauncherController
                    .launchURL("https://www.facebook.com/share/p/18hVd53x5f/");
              },
            ),
            SocialMediaButton(
              socialMediaImage: "moodle.png",
              widthSocialMediaImage: 0.15,
              heightSocialMediaImage: 0.055,
              onClickButton: () {
                urlLauncherController.launchURL("https://elearning.oi.edu.eg/");
              },
            ),
            SocialMediaButton(
              socialMediaImage: "youtube.png",
              widthSocialMediaImage: 0.08,
              heightSocialMediaImage: 0.035,
              onClickButton: () {
                urlLauncherController.launchURL(
                    "https://www.youtube.com/user/obourinstitutes/videos");
              },
            ),
            SocialMediaButton(
              socialMediaImage: "website.png",
              widthSocialMediaImage: 0.1,
              heightSocialMediaImage: 0.045,
              onClickButton: () {
                urlLauncherController.launchURL("https://elearning.oi.edu.eg/");
              },
            ),
            SocialMediaButton(
              socialMediaImage: "facebook.png",
              widthSocialMediaImage: 0.05,
              heightSocialMediaImage: 0.025,
              onClickButton: () {
                urlLauncherController.launchURL(
                    "https://web.facebook.com/obourinstitutes/?locale=ar_AR&_rdc=1&_rdr#");
              },
            ),
          ],
        ),
      ),
    );
  }
}
