import 'package:flutter/material.dart';
import 'package:user_list/modules/shared/extensions/translate_extension.dart';

class ListUser_EmptyBody extends StatelessWidget {
  const ListUser_EmptyBody({super.key, required this.onRefresh});

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  context.translate.emptyListMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
