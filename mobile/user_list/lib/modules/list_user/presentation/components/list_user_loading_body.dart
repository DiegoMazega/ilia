import 'package:flutter/material.dart';

class ListUser_LoadingBody extends StatelessWidget {
  const ListUser_LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
