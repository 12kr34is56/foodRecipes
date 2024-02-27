import 'package:flutter/material.dart';
import 'package:simple_chips_input/select_chips_input.dart';

class UnitButton extends StatelessWidget {
  const UnitButton({
    super.key,
    required this.chipsText,
    required this.title,
    required this.sourceTitle,
    required this.onTapCallback,
  });

  final List<String> chipsText;
  final String title;
  final String sourceTitle;
  final Function(String) onTapCallback;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            String outputSelectChipsInput = '';

            return AlertDialog(
              titlePadding: const EdgeInsets.only(bottom: 20, left: 15, top: 5),
              actionsPadding: const EdgeInsets.only(top: 10),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              contentTextStyle: const TextStyle(fontSize: 14),
              title: Text(
                title,
                textAlign: TextAlign.center,
              ),
              content: SelectChipsInput(
                marginBetweenChips:
                const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                widgetContainerDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                chipsText: chipsText,
                onlyOneChipSelectable: true,
                unselectedChipDecoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                unselectedChipTextStyle: const TextStyle(color: Colors.black),
                selectedChipDecoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                selectedChipTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                onTap: (output, index) {
                  outputSelectChipsInput = output;
                  print('Selected Chips: $outputSelectChipsInput');
                },
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
                TextButton(
                  onPressed: () {
                    onTapCallback(outputSelectChipsInput);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
      child: Text(sourceTitle),
    );
  }
}