import 'package:flutter/material.dart';
import 'package:hotelino_app/features/home/homePage.dart';
import 'package:hotelino_app/features/onboarding/data/presentation/onboardin_page.dart';

class AppRoute {
  static const String home = '/home';
  static const String hotelDetail = '/hotel-detail';
  static const String bookingForm = '/booking-form';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String onboarding = '/onboarding';

  static final Map<String, WidgetBuilder> routes = {
    onboarding: (ctx) => const OnboardinPage(),
    home: (ctx) => const Homepage(),
  };
}
