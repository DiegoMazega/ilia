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
  String get error =>
      'Um erro aconteceu, verifique sua internet ou tente novamente mais tarde';

  @override
  String get homeTitle => 'Tela Inicial';

  @override
  String get emptyListMessage =>
      'Não há dados a serem mostrados. Puxe para baixo para recarregar a página.';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get errorEmailAlreadyExists => 'Este e-mail já está em uso.';

  @override
  String get errorInvalidNameFormat => 'Formato de nome inválido.';

  @override
  String get errorInvalidEmailFormat => 'Formato de e-mail inválido.';

  @override
  String get errorInvalidPayload => 'Dados inválidos enviados.';

  @override
  String get errorFetchUsers => 'Erro ao buscar usuários.';

  @override
  String get errorInternalServer => 'Erro interno do servidor.';

  @override
  String get errorRateLimit =>
      'Muitas requisições. Tente novamente mais tarde.';

  @override
  String get createAnotherUser => 'Cadastrar outro usuário';

  @override
  String get viewRegisteredUsers => 'Ver usuários cadastrados';
}
