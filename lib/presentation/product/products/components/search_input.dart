import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/presentation/components/outlined_text_input.dart';

class SearchInput extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String hint;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClearIconClick;
  final bool disable ;

  const SearchInput({
    super.key,
    this.onChanged,
    required this.hint,
    this.onSubmitted,
    this.onClearIconClick,  this.disable = false,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<bool> showClearBtn = ValueNotifier<bool>(false);
  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    showClearBtn.dispose();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedTextInput(
      enable: !widget.disable,
      hint: widget.hint,
      onClearIconClick: widget.onClearIconClick,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      prefixIcon: const Icon(Icons.search),
      contentPadding: EdgeInsets.zero,
    );
  }
}
