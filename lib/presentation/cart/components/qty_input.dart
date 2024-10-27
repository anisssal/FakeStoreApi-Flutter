import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';

class QtyInput extends StatefulWidget {
  final int initialValue;
  final ValueNotifier<int> value;
  final int minimumValue;
  final int? maximumValue;

  final void Function(int value)? onValueChanged;
  final void Function(int currentValue)? onIncreasedClick;
  final void Function(int currentValue)? onDecreaseClick;

  QtyInput(
      {super.key,
      required this.initialValue,
      this.minimumValue = 0,
      this.onValueChanged,
      this.onIncreasedClick,
      this.onDecreaseClick,
      this.maximumValue})
      : value = ValueNotifier(initialValue);

  @override
  State<QtyInput> createState() => _QtyInputState();
}

class _QtyInputState extends State<QtyInput> {
  void onDecreaseValue() {
    if (widget.value.value == widget.minimumValue) {
      return;
    }
    widget.value.value = widget.value.value - 1;
    widget.onValueChanged?.call(widget.value.value);
    widget.onDecreaseClick?.call(widget.value.value);
  }

  void onIncreaseValue() {
    if (widget.maximumValue!=null && widget.value.value == widget.maximumValue) return;
    widget.value.value = widget.value.value + 1;
    widget.onValueChanged?.call(widget.value.value);
    widget.onIncreasedClick?.call(widget.value.value);
  }

  @override
  void didUpdateWidget(covariant QtyInput oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: widget.value,
          builder: (BuildContext context, int value, Widget? child) {
            return IconButton(
              icon: child!,
              onPressed: onDecreaseValue,
              color: value == widget.minimumValue
                  ? ResColor.whiteColor40
                  : ResColor.primary,
            );
          },
          child: Icon(
            Icons.remove_circle_outline_outlined,
            size: 24.h,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: ValueListenableBuilder(
            valueListenable: widget.value,
            builder: (BuildContext context, int value, Widget? child) {
              return Text(
                '$value',
                style: TextStylesLp.h4,
              );
            },
          ),
        ),
        ValueListenableBuilder(
          valueListenable: widget.value,
          builder: (BuildContext context, int value, Widget? child) {

            final color = widget.maximumValue == null
                ? ResColor.primary
                : value == widget.maximumValue
                    ? ResColor.whiteColor40
                    : ResColor.primary;
            return IconButton(
              icon: child!,
              onPressed: onIncreaseValue,
              color: color,
            );
          },
          child: Icon(
            Icons.add_circle_outline_outlined,
            size: 24.h,
          ),
        ),
      ],
    );
  }
}
