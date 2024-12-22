import 'package:flutter/material.dart';

Widget Button({required void Function() onPressed, required String text}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 185, 235, 162),
        foregroundColor: Colors.black,
        side: const BorderSide(
          color: Colors.black,
        )),
    child: Text(
      text,
      style: const TextStyle(fontSize: 15),
    ),
  );
}

Widget SquareButton(
    {required void Function() onPressed, required String text}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 185, 235, 162),
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(
            color: Colors.black,
          )),
    ),
    child: Text(
      text,
      style: const TextStyle(fontSize: 15),
    ),
  );
}
