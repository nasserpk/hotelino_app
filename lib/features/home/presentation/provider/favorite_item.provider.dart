import 'package:flutter/material.dart';
import 'package:hotelino_app/features/home/data/models/hotel.dart';
import 'package:hotelino_app/features/home/repositories/hotel_repository.dart';

class FavoriteItemProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  FavoriteItemProvider(this._hotelRepository) {
    fetchHotels();
  }
  final List<String> _favoriteHotelIds = [];
  List<Hotel> get favoriteHotelId =>
      _hotels.where((hotel) => _favoriteHotelIds.contains(hotel.id)).toList();

  List<Hotel> _hotels = [];

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
    notifyListeners();
  }

  bool isfavorite(String hotelId) {
    return _favoriteHotelIds.contains(hotelId);
  }

  void toggleFavorite(String hotelId) {
    if (_favoriteHotelIds.contains(hotelId)) {
      _favoriteHotelIds.remove(hotelId);
    } else {
      _favoriteHotelIds.add(hotelId);
    }
    notifyListeners();
  }
}
