import 'package:flutter/material.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/util.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    required this.hintText,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final void Function(String) onChanged;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final textController = TextEditingController();
  var isEmpty = true;

  @override
  void initState() {
    textController.addListener(() {
      widget.onChanged(textController.text);
      setState(() {
        isEmpty = textController.text.isEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        suffixIcon: isEmpty
            ? null
            : GestureDetector(
                onTap: () => textController.clear(),
                child: const Icon(Icons.close),
              ),
        prefixIcon: const Icon(Icons.search),
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: padding * 2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
