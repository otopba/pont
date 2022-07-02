import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef ImageBuilder = Widget Function({
  required double width,
  required double height,
  Color? color,
});

class PontImage {
  static Widget login({
    required double? width,
    required double? height,
  }) {
    return Image.asset(
      'assets/login.gif',
      width: width,
      height: height,
    );
  }

  static Widget pontCircle({
    required double width,
    required double height,
  }) {
    return Image.asset(
      'assets/pont_circle.png',
      width: width,
      height: height,
    );
  }

  static Widget plus({
    required double width,
    required double height,
  }) {
    return SvgPicture.asset(
      'assets/plus.svg',
      width: width,
      height: height,
    );
  }

  static Widget check({
    required double width,
    required double height,
  }) {
    return SvgPicture.asset(
      'assets/check.svg',
      width: width,
      height: height,
    );
  }

  static Widget shop({
    required double width,
    required double height,
  }) {
    return SvgPicture.asset(
      'assets/shop.svg',
      width: width,
      height: height,
    );
  }

  static Widget shopActive({
    required double width,
    required double height,
  }) {
    return SvgPicture.asset(
      'assets/shop_active.svg',
      width: width,
      height: height,
    );
  }

  static Widget nftList({
    required double width,
    required double height,
  }) {
    return SvgPicture.asset(
      'assets/nft_list.svg',
      width: width,
      height: height,
    );
  }

  static Widget nftListActive({
    required double width,
    required double height,
  }) {
    return SvgPicture.asset(
      'assets/nft_list_active.svg',
      width: width,
      height: height,
    );
  }

  static Widget profile({
    required double width,
    required double height,
  }) {
    return SvgPicture.asset(
      'assets/profile.svg',
      width: width,
      height: height,
    );
  }

  static Widget profileActive({
    required double width,
    required double height,
  }) {
    return SvgPicture.asset(
      'assets/profile_active.svg',
      width: width,
      height: height,
    );
  }

  static Widget pontCasual({
    required double width,
    required double height,
  }) {
    return Image.asset(
      'assets/pont_casual.png',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  static Widget pontClassic({
    required double width,
    required double height,
  }) {
    return Image.asset(
      'assets/pont_classic.png',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  static Widget pontHype({
    required double width,
    required double height,
  }) {
    return Image.asset(
      'assets/pont_hype.png',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  static Widget pontPlatinum({
    required double width,
    required double height,
  }) {
    return Image.asset(
      'assets/pont_platinum.png',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  static Widget back({
    required double width,
    required double height,
  }) {
    return SvgPicture.asset(
      'assets/back.svg',
      width: width,
      height: height,
    );
  }

  static Widget buyOk({
    required double width,
    required double height,
  }) {
    return Image.asset(
      'assets/buy_ok.png',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  static Widget exit({
    required double width,
    required double height,
  }) {
    return SvgPicture.asset(
      'assets/exit.svg',
      width: width,
      height: height,
    );
  }

  static Widget copy({
    required double width,
    required double height,
  }) {
    return SvgPicture.asset(
      'assets/copy.svg',
      width: width,
      height: height,
    );
  }

  static Widget otopba1({
    required double width,
    required double height,
  }) {
    return Image.asset(
      'assets/otopba1.png',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  static Widget idrewha({
    required double width,
    required double height,
  }) {
    return Image.asset(
      'assets/idrewha.png',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  static Widget emil151997({
    required double width,
    required double height,
  }) {
    return Image.asset(
      'assets/emil151997.png',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  static Widget telegram({
    required double width,
    required double height,
  }) {
    return Image.asset(
      'assets/telegram.png',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
