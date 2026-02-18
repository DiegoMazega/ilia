import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:user_list/l10n/app_localizations.dart';
import 'package:user_list/modules/create_user/data/repositories/create_user_repository_impl.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_cubit.dart';
import 'package:user_list/modules/list_user/data/repositories/list_user_repository_impl.dart';
import 'package:user_list/modules/list_user/presentation/cubit/list_user_cubit.dart';
import 'package:user_list/modules/shared/cubit/locale_cubit.dart';
import 'package:user_list/modules/shared/extensions/translate_extension.dart';
import 'package:user_list/modules/shared/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CreateUser_CreateUserRepositoryImpl(),
        ),
        RepositoryProvider(
          create: (context) => ListUser_ListUserRepositoryImpl(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocaleCubit()),
          BlocProvider(
            create: (context) => CreateUser_CreateUserCubit(
              context.read<CreateUser_CreateUserRepositoryImpl>(),
            ),
          ),
          BlocProvider(
            create: (context) => ListUser_ListUserCubit(
              context.read<ListUser_ListUserRepositoryImpl>(),
            ),
          ),
        ],
        child: BlocBuilder<LocaleCubit, Locale?>(
          builder: (context, localeState) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              behavior: HitTestBehavior.opaque,
              child: MaterialApp.router(
                routerConfig: router,
                debugShowCheckedModeBanner: false,
                locale: localeState,
                onGenerateTitle: (context) => context.translate.appTitle,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [Locale('en'), Locale('pt')],
                localeResolutionCallback: (locale, supportedLocales) {
                  context.read<LocaleCubit>().updateLocale(locale);
                  return locale;
                },
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                  useMaterial3: true,
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.blue,
                    centerTitle: true,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    iconTheme: IconThemeData(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
