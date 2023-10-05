import 'package:flutter/material.dart';

Widget dataEntry(
    BuildContext context, String title, List<String> ls, List<DateTime> lst) {
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
              onSaved: (vale) {
                ls.add(vale!);
              },
              onChanged: (value) {},
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                labelText: title,
                // hintText: 'Enter Your Name',
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green.withOpacity(0.2)),
            child: Center(
              child: Text("selectedTime".toString()),
            )),
        SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: () async {
              var selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (selectedTime != null) {
                final now = DateTime.now();
                var alarmDateTime = DateTime(now.year, now.month, now.day,
                    selectedTime.hour, selectedTime.minute);
                lst.add(alarmDateTime);
              }
            },
            icon: Icon(Icons.watch_later))
      ],
    ),
  );
}
