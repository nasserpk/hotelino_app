import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hotelino_app/bootstrap.dart';
import 'package:hotelino_app/core/theme/app_theme.dart';
import 'package:hotelino_app/core/theme/theme_provider.dart';
import 'package:hotelino_app/features/home/presentation/provider/home_provider.dart';
import 'package:hotelino_app/features/home/presentation/provider/profile_provider.dart';
import 'package:hotelino_app/features/home/repositories/hotel_repository.dart';
import 'package:hotelino_app/features/home/repositories/profile_repository.dart';
import 'package:hotelino_app/features/onboarding/data/presentation/onboarding_provider.dart';
import 'package:hotelino_app/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:hotelino_app/routes/app_route.dart';
import 'package:hotelino_app/shared/services/json_data_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await lazyBootStrap();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  final hotelRepository = HotelRepository(jsonDataService: JsonDataService());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) => ThemeProvider(
                WidgetsBinding.instance.platformDispatcher.platformBrightness,
              ),
        ),
        ChangeNotifierProvider(
          create: (_) => OnboardingProvider(OnboardingRepository()),
        ),
        ChangeNotifierProvider(create: (_) => HomeProvider(hotelRepository)),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(ProfileRepository(), hotelRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).updatedBrightness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeModeProvider, child) {
        return MaterialApp(
          title: 'Hotelino',
          theme:
              themeModeProvider.brightness == Brightness.light
                  ? AppTheme.lightTheme
                  : AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          routes: AppRoute.routes,
          initialRoute: AppRoute.onboarding,
        );
      },
    );
  }
}
