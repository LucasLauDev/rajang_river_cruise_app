import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/booking_controls_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';

/// Main View Screen for Rajang River Cruise Details & Booking with orientation adaptability.
class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sibu River Cruise & Heritage'),
            centerTitle: true,
          ),
          body: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.landscape) {
                // Landscape Layout: Side-by-Side Split Pane (Row + Expanded)
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        ),
                        child: HeaderImageWidget(
                          imagePath: viewModel.destination.imagePath,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: ListView(
                        children: [
                          TitleSectionWidget(viewModel: viewModel),
                          const ActionBarWidget(),
                          DescriptionWidget(
                            description: viewModel.destination.description,
                          ),
                          BookingControlsWidget(viewModel: viewModel),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                // Portrait Layout: Single Column Scrollable ListView
                return ListView(
                  children: [
                    HeaderImageWidget(
                      imagePath: viewModel.destination.imagePath,
                      height: 240.0,
                    ),
                    TitleSectionWidget(viewModel: viewModel),
                    const ActionBarWidget(),
                    DescriptionWidget(
                      description: viewModel.destination.description,
                    ),
                    BookingControlsWidget(viewModel: viewModel),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
