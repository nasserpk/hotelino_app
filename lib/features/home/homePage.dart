import 'package:flutter/material.dart';
import 'package:hotelino_app/features/home/presentation/provider/home_provider.dart';
import 'package:hotelino_app/features/home/widget/add_banner.dart';
import 'package:hotelino_app/features/home/widget/home_appbar.dart';
import 'package:hotelino_app/features/home/widget/hotel_list_section.dart';
import 'package:hotelino_app/features/home/widget/serach_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16),
            SerachBarWidget(),
            SizedBox(height: 16),
            AddBaner(),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  title: "محبوب ترین هتل ها",
                  hotels: homeProvider.getPopularHotels(),
                  onSeeAllPressed: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
