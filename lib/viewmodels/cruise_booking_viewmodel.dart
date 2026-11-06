import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

/// ViewModel Layer for managing state and business logic of Rajang River Cruise Booking.
class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination _destination;

  late int _starCount;
  bool _isStarred = false;
  late DateTime _selectedDate;
  late String _selectedPackage;
  bool _isDarkMode = false;

  CruiseBookingViewModel({CruiseDestination? destination})
      : _destination = destination ?? CruiseDestination.sibuRajangCruise() {
    _starCount = _destination.initialRatingCount;
    _selectedDate = DateTime(2026, 1, 15);
    _selectedPackage = _destination.availablePackages.isNotEmpty
        ? _destination.availablePackages.first
        : 'Private River Cruise';
  }

  // Getters
  CruiseDestination get destination => _destination;
  int get starCount => _starCount;
  bool get isStarred => _isStarred;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;
  List<String> get availablePackages => _destination.availablePackages;

  /// Formatted date string (DD/MM/YYYY)
  String get formattedDate {
    final day = _selectedDate.day.toString().padLeft(2, '0');
    final month = _selectedDate.month.toString().padLeft(2, '0');
    final year = _selectedDate.year;
    return '$day/$month/$year';
  }

  /// Toggle star rating count (dynamic rating update)
  void toggleStar() {
    _isStarred = !_isStarred;
    if (_isStarred) {
      _starCount++;
    } else {
      _starCount--;
    }
    notifyListeners();
  }

  /// Update visit / booking date
  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  /// Update selected cruise package
  void setSelectedPackage(String package) {
    _selectedPackage = package;
    notifyListeners();
  }

  /// Toggle light / dark theme mode
  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
