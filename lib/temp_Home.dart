import 'package:flutter/material.dart';
import 'package:medlistweb/widget/DietEntry.dart';
import 'package:medlistweb/widget/ExcerciseEntry.dart';
import 'package:medlistweb/widget/MedicineEntry.dart';
import 'package:medlistweb/widget/dietdataEntry.dart';
class TempHome extends StatefulWidget {
  const TempHome({super.key});

  @override
  State<TempHome> createState() => _TempHomeState();
}

class _TempHomeState extends State<TempHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MedicineEntry(context),
          ExerciseEntry(context),
          DietEntry(context),

        ],
      ),
    );
  }
}
