import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,String text){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 151, 230, 115),
        content: Center(
          child: Text(
            "Successfully Saved",
            style: TextStyle(
              color: Colors.green.shade700
            ),
          ),
        ),
      ),
    );
}