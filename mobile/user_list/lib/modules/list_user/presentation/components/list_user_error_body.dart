import 'package:flutter/material.dart';
import 'package:user_list/modules/shared/extensions/translate_extension.dart';

class ListUser_ErrorBody extends StatelessWidget {
  const ListUser_ErrorBody({super.key, required this.onTryAgain});

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    final translate = context.translate;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 64),
            Text(
              translate.error,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ElevatedButton.icon(
              onPressed: onTryAgain,
              icon: const Icon(Icons.refresh),
              label: Text(translate.tryAgain),
            ),
          ],
        ),
      ),
    );
  }
}
