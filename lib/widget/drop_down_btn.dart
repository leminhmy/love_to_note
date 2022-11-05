import 'package:flutter/material.dart';
import 'package:your_money/widget/text_header3.dart';

import '../uitls/theme_color.dart';

class DropDownBtn extends StatefulWidget {
  const DropDownBtn({Key? key, required this.listItemDrop, required this.indexSelected}) : super(key: key);

  final List<String> listItemDrop;
  final ValueChanged<int> indexSelected;

  @override
  State<DropDownBtn> createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  String dropdownValue = 'ToDay';

  @override
  void initState() {
    dropdownValue = widget.listItemDrop[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),

      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        elevation: 13,
        isDense: true,
        style: const TextStyle(color: Colors.grey,fontSize: 16),
        underline: const SizedBox(),

        onChanged: (String? newValue) {
          if(newValue!.isNotEmpty){
            widget.indexSelected(widget.listItemDrop.indexOf(newValue));
            setState(() {
              dropdownValue = newValue;
            });
          }
        },
        items: widget.listItemDrop
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: TextHeader3(text: value,colorText: ThemeColor.colorBlue,),
          );
        }).toList(),
      ),
    );
  }
}