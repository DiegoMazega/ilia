import 'package:user_list/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension GetTranslate on BuildContext {
  AppLocalizations get translate {
    final translate = AppLocalizations.of(this);

    assert(
      translate != null,
      'AppLocalizations not found in context. '
      'Look MaterialApp AppLocalizations.delegate',
    );

    return translate!;
  }
}
