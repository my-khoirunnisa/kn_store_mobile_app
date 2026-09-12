import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int productId;

  const DetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(productId.toString())));
  }
}
