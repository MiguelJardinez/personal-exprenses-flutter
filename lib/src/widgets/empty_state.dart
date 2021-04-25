import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'No transaction yet!',
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(height: 40.0),
          Container(
            height: 200.0,
            child: Image.asset(
              'assets/image/waiting.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
