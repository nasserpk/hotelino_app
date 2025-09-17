import 'package:flutter/material.dart';
import 'package:hotelino_app/features/onboarding/data/repositories/onboarding_repository.dart';

class OnboardingProvider with ChangeNotifier {
  final OnboardingRepository repository;

  OnboardingProvider(this.repository) {
    _loadData();
  }

  int currentPage = 0;
  List<Map<String, String>> onboardingData = [];

  void _loadData() {
    onboardingData = repository.onboardingData;
    notifyListeners();
  }
}
