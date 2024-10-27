import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';

class OutlinedTextInput extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String hint;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClearIconClick;
  final Widget? prefixIcon;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final String? initialText;
  final bool enable ;

  const OutlinedTextInput({
    Key? key,
    this.onChanged,
    required this.hint,
    this.onSubmitted,
    this.onClearIconClick,
    this.prefixIcon,
    this.contentPadding,
    this.hintStyle,
    this.initialText,  this.enable = true,
  }) : super(key: key
  );

  @override
  State<OutlinedTextInput> createState() => _OutlinedTextInputState();
}

class _OutlinedTextInputState extends State<OutlinedTextInput> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<bool> showClearBtn = ValueNotifier<bool>(false);
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    if (widget.initialText != null && widget.initialText!.isNotEmpty) {
      _controller.text = widget.initialText!;
      showClearBtn.value = true;
    }

    super.initState();
  }

  @override
  void dispose() {
    showClearBtn.dispose();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _controller.clear();
    showClearBtn.value = false;
    widget.onClearIconClick?.call();
    _focusNode.unfocus();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: showClearBtn,
      builder: (BuildContext context, bool value, Widget? child) {
        return TextField(
          enabled: widget.enable,
          controller: _controller,
          focusNode: _focusNode,
          onSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            contentPadding: widget.contentPadding,
            isDense: false,
            prefixIcon: widget.prefixIcon,
            suffixIcon: value
                ? IconButton(
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: ResColor.whiteColor20,
                    ),
                    onPressed: _clearSearch,
                  )
                : null,
            hintText: widget.hint,
            hintStyle: widget.hintStyle,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
          onChanged: (text) {
            if (text.isNotEmpty) {
              showClearBtn.value = true;
            } else {
              showClearBtn.value = false;
            }
            widget.onChanged?.call(text);
          },
        );
      },
    );
  }
}
