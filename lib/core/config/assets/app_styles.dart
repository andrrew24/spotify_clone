import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle defaultStyle() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 16, color: Colors.white);
  }

  static TextStyle styleBold16() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 16, fontWeight: FontWeight.bold);
  }

  static TextStyle styleBold18() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 18, fontWeight: FontWeight.bold);
  }

  static TextStyle styleRegular12() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 12, fontWeight: FontWeight.normal);
  }

  static TextStyle styleBold12() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 12, fontWeight: FontWeight.bold);
  }

  static TextStyle styleRegular15() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 15, fontWeight: FontWeight.normal);
  }

  static TextStyle styleRegular17() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 17, fontWeight: FontWeight.normal);
  }

  static TextStyle styleMedium19() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 19, fontWeight: FontWeight.w700);
  }

  static TextStyle styleBold20() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 20, fontWeight: FontWeight.bold);
  }

  static TextStyle styleRegular20() {
    return const TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 20,
    );
  }

  static TextStyle styleMedium20() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 20, fontWeight: FontWeight.w500);
  }

  static TextStyle styleBold22() {
    return const TextStyle(
        color: Colors.white,
        fontFamily: 'Satoshi',
        fontSize: 22,
        fontWeight: FontWeight.bold);
  }

  static TextStyle styleBold25() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 25, fontWeight: FontWeight.bold);
  }

  static TextStyle styleBold30() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 30, fontWeight: FontWeight.bold);
  }

  static TextStyle styleBold13() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 13, fontWeight: FontWeight.bold);
  }

  static TextStyle styleMedium16() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 16, fontWeight: FontWeight.w500);
  }

  static TextStyle styleMedium14() {
    return const TextStyle(
        fontFamily: 'Satoshi', fontSize: 14, fontWeight: FontWeight.w500);
  }
}
