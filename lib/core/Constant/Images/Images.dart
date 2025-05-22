import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';

class LocalImage extends StatefulWidget {
  final String localImagePath;
  final double widthImage;
  final double heightImage;
  final BoxFit? fitImage;
  final Color? colorImage;

  const LocalImage({
    super.key,
    required this.localImagePath,
    required this.widthImage,
    required this.heightImage,
    this.fitImage = BoxFit.contain,
    this.colorImage = blackColor,
  });

  @override
  State<LocalImage> createState() => _LocalImageState();
}

class _LocalImageState extends State<LocalImage> {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("images/${widget.localImagePath}"),
      width: Get.width * widget.widthImage,
      height: Get.height * widget.heightImage,
      fit: widget.fitImage,
      color: widget.colorImage,
    );
  }
}

class LocalImageWithoutColor extends StatefulWidget {
  final String localImagePath;
  final double widthImage;
  final double heightImage;
  final BoxFit? fitImage;

  const LocalImageWithoutColor({
    super.key,
    required this.localImagePath,
    required this.widthImage,
    required this.heightImage,
    this.fitImage = BoxFit.contain,
  });

  @override
  State<LocalImageWithoutColor> createState() => _LocalImageWithoutColorState();
}

class _LocalImageWithoutColorState extends State<LocalImageWithoutColor> {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("images/${widget.localImagePath}"),
      width: Get.width * widget.widthImage,
      height: Get.height * widget.heightImage,
      fit: widget.fitImage,
    );
  }
}

class LocalSvgImage extends StatefulWidget {
  final String localImagePath;
  final double widthImage;
  final double heightImage;

  const LocalSvgImage({
    super.key,
    required this.localImagePath,
    required this.widthImage,
    required this.heightImage,
  });

  @override
  State<LocalSvgImage> createState() => _LocalSvgImageState();
}

class _LocalSvgImageState extends State<LocalSvgImage> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "images/${widget.localImagePath}",
      width: Get.width * widget.widthImage,
      height: Get.height * widget.heightImage,
      fit: BoxFit.contain,
    );
  }
}

class LottieImage extends StatefulWidget {
  final String lottieImagePath;

  const LottieImage({super.key, required this.lottieImagePath});

  @override
  State<LottieImage> createState() => _LottieImageState();
}

class _LottieImageState extends State<LottieImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("lottie/${widget.lottieImagePath}",
          height: 200, width: 200, fit: BoxFit.contain),
    );
  }
}
