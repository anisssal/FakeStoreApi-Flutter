import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';

class ErrorFetchDataWidget extends StatelessWidget {
  final String? msg;

  const ErrorFetchDataWidget({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity  ,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/error.png',
                fit: BoxFit.fill,
                width: 0.45.sw,
                height: 0.45.sw,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Something went wrong!',
                style: TextStyles.h4,
              ),
              const SizedBox(
                height: 4,
              ),
              if (msg != null)
                Text(
                  msg!,
                  textAlign: TextAlign.center,
                  style: TextStyles.h6,
                )
            ]),
      ),
    );
  }
}
