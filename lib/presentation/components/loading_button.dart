import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final double? width;
  final VoidCallback onPressed ;
  final bool isLoading ;
  final Widget content;
  const LoadingButton({Key? key, this.width, required this.onPressed, required this.isLoading, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child:  ElevatedButton(
        onPressed: !isLoading ? onPressed : null,
        child: !isLoading ? content  : const SizedBox(
          height: 12.0,
          width: 12.0,
          child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              )
          ),
        ),
      ),
    );
  }
}
