import 'package:flutter/material.dart';
import 'package:hotelino_app/features/home/data/models/hotel.dart';
import 'package:hotelino_app/features/home/data/models/profile.dart';
import 'package:hotelino_app/features/home/repositories/hotel_repository.dart';
import 'package:hotelino_app/features/home/repositories/profile_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _profileRepository;
  final HotelRepository _hotelRepository;

  List<Hotel> _hotels = [];
  Profile? _profile;
  Profile? get profile => _profile;

  ProfileProvider(this._profileRepository, this._hotelRepository) {
    fetchHotels();
    loadUserProfile();
  }

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
  }

  loadUserProfile() async {
    _profile = await _profileRepository.fetchUserProfile();
  }

  //Recently Viewed Hotels -------------------------------------------
  final List<String> _recentlyViewedHotels = [];

  List<Hotel> get recentlyViewedHotels =>
      _hotels
          .where((hotel) => _recentlyViewedHotels.contains(hotel.id))
          .toList();

  void addRecentlyViewd(String hotelId) {
    if (!recentlyViewedHotels.contains(hotelId)) {
      _recentlyViewedHotels.add(hotelId);
      notifyListeners();
    } else {
      _recentlyViewedHotels.remove(hotelId);
      _recentlyViewedHotels.add(hotelId);
      notifyListeners();
    }
  }
}
