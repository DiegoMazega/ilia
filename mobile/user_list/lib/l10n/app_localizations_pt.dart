// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Lista de Usuários';

  @override
  String get counterMsg => 'Você pressionou o botão este número de vezes:';

  @override
  String get incrementTooltip => 'Incrementar';

  @override
  String get name => 'Nome';

  @override
  String get email => 'E-mail';

  @override
  String get save => 'Salvar';

  @override
  String get createUserTitle => 'Criar Usuário';

  @override
  String get listUserTitle => 'Lista de Usuários';

  @override
  String get invalidEmail => 'Por favor, insira um e-mail válido';

  @override
  String get invalidName => 'Por favor, insira pelo menos nome e sobrenome';

  @override
  String get userCreatedSuccess => 'Usuário criado com sucesso!';

  @override
  String get loading => 'Carregando...';

  @override
  String get error => 'Ocorreu um erro';

  @override
  String get homeTitle => 'Tela Inicial';

  @override
  String get emptyListMessage =>
      'Não há dados a serem mostrados. Puxe para baixo para recarregar a página.';

  @override
  String get tryAgain => 'Tentar novamente';
}
