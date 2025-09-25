import 'package:flutter/material.dart';
import 'package:hotelino_app/core/constants/constants.dart';
import 'package:hotelino_app/features/home/data/models/homepage_data.dart';
import 'package:hotelino_app/features/home/data/models/hotel.dart';
import 'package:hotelino_app/features/home/repositories/hotel_repository.dart';

class HomeProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  HomeProvider(this._hotelRepository) {
    fetchHotels();
  }
  List<Hotel> _hotels = [];
  List<Hotel> get hotels => _hotels;

  final HomePageData _homePageData = HomePageDataConstants.homePageData;
  HomePageData get homePageData => _homePageData;

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
    notifyListeners();
  }

  // Filter Methiode -----------------------------------------------------------------------
  List<Hotel> getPopularHotels() {
    return _hotels
        .where((hotel) => homePageData.popular.contains(hotel.id))
        .toList();
  }

  List<Hotel> getSpecialOffersHotels() {
    return _hotels
        .where((hotel) => homePageData.specialOffers.contains(hotel.id))
        .toList();
  }

  List<Hotel> getNewestHotels() {
    return _hotels
        .where((hotel) => homePageData.newest.contains(hotel.id))
        .toList();
  }

  // Story Section ---------------------------------------------------------------------------
  List<String> getStoryImages() {
    final shuffledHotels = List<Hotel>.from(_hotels)..shuffle();
    return shuffledHotels.take(3).map((hotel) => hotel.images[0]).toList();
  }

  final List<String> _storyTitles = [
    "امکانات رفاهی کامل",
    "اقامت در قلب شهر",
    "لوکس ترین هتل ها",
  ];

  List<String> get storyTitles => _storyTitles;
}
