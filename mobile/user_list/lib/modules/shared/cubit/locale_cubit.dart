import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale?> {
  LocaleCubit() : super(null);

  void updateLocale(Locale? locale) {
    if (locale == null) {
      return;
    }

    if (locale.languageCode != 'pt' && locale.languageCode != 'en') {
      _emitLocale(const Locale('en'));
      return;
    }

    _emitLocale(locale);
  }

  void _emitLocale(Locale locale) {
    if (state?.languageCode == locale.languageCode) {
      return;
    }

    emit(locale);
  }
}
