// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  TextEditingController? textcontroller;
  String? hint;
  int? maxLines;
  TextFormWidget({
    
    Key? key,
    this.textcontroller,
    this.hint,
    this.maxLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          hintText: hint),
      controller: textcontroller,
      textAlign: TextAlign.right,
      keyboardType: TextInputType.text,
    );
  }
}
