import 'package:flutter/material.dart';
import 'package:hotelino_app/features/home/presentation/provider/home_provider.dart';
import 'package:hotelino_app/features/home/widgets/add_banner.dart';
import 'package:hotelino_app/features/home/widgets/home_appbar.dart';
import 'package:hotelino_app/features/home/widgets/hotel_list_section.dart';
import 'package:hotelino_app/features/home/widgets/hotel_vertical_list.dart';
import 'package:hotelino_app/features/home/widgets/serach_bar.dart';
import 'package:hotelino_app/features/home/widgets/story_carousel.dart';
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
            SizedBox(height: 16),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return StoryCarousel(
                  images: homeProvider.getStoryImages(),
                  titles: homeProvider.storyTitles,
                );
              },
            ),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelVerticalList(
                  title: "جدیدترین هتل ها",
                  hotels: homeProvider.getNewestHotels(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
