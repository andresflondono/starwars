import 'package:flutter/material.dart';

class MyError extends StatelessWidget {
  const MyError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Failed to Load Data',
      style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.red),
    );
  }
}
