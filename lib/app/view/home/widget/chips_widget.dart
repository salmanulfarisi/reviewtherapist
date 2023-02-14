import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';

class ChipWidget extends StatefulWidget {
  final String? text;
  final int? index;
  const ChipWidget({Key? key, this.text, this.index}) : super(key: key);

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) {
    List chipText = [
      'All Posts',
      'Daillies',
      'Arcade',
      'Action',
      "Adventure",
      "Casual",
    ];

    String selectedChoice = chipText[widget.index!];
    void _updateSelectedList(String selected) {
      setState(() {
        selectedList.clear();
        selectedChoice = selected;

        selectedList.add(selected);
      });
    }

    return ChoiceChip(
      label: Text(
        widget.text!,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      selected: selectedList.contains(selectedChoice),
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey,
      onSelected: (bool selected) {
        setState(() {
          _updateSelectedList(selectedChoice);
        });
      },
    );
  }
}
