import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CupertinoActivityIndicator(),
          Text(
            ' Loading',
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}
