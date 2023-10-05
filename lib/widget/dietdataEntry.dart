import 'package:flutter/material.dart';

Widget dietdataEntry(BuildContext context, String title, List<String> ls) {
  TextEditingController textEditingController = TextEditingController();
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            child: TextFormField(
              controller: textEditingController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter name";
                }
                return null;
              },
              onEditingComplete: () {
                ls.add(textEditingController.text);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: title,
                // hintText: 'Enter Your Name',
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}
