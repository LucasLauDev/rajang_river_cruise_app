import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

/// Modular Widget: Interactive form and picker controls (Date Picker, Cruise Package Dropdown, Theme Switch).
class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({
    super.key,
    required this.viewModel,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != viewModel.selectedDate) {
      viewModel.setSelectedDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trip Preferences & Booking',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(height: 24.0),

              // 1. Visit Date Picker
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.calendar_month,
                    color: theme.colorScheme.primary),
                title: const Text('Visit / Cruise Date'),
                subtitle: Text(
                  viewModel.formattedDate,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: ElevatedButton.icon(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.edit_calendar, size: 18.0),
                  label: const Text('Pick Date'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),

              // 2. Cruise Package Selection (Dropdown)
              InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Cruise Package / Transport Mode',
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(Icons.directions_boat,
                      color: theme.colorScheme.secondary),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 4.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: viewModel.selectedPackage,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        viewModel.setSelectedPackage(newValue);
                      }
                    },
                    items: viewModel.availablePackages
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // 3. Dark Mode Theme Switch
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                secondary: Icon(
                  viewModel.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: viewModel.isDarkMode ? Colors.amber : Colors.orange,
                ),
                title: const Text('Dark Mode Theme'),
                subtitle: Text(
                  viewModel.isDarkMode
                      ? 'Dark Theme Active'
                      : 'Light Theme Active',
                ),
                value: viewModel.isDarkMode,
                onChanged: (bool value) {
                  viewModel.toggleDarkMode(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
