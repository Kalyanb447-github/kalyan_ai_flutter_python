import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  CustomField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: 300.0,
          child: Column(
            children: [
              TextField(
                controller: controller,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 21.0,
                  ),
                  labelText: 'Enter a search term: ',
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
