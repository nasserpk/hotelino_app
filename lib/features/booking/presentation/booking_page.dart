import 'package:flutter/material.dart';
import 'package:hotelino_app/features/booking/presentation/booking_provider.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();

  void resetForm() {
    Future.delayed(Duration(milliseconds: 100), () {
      _formKey.currentState?.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'فرم رزرو هتل',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Consumer<BookingProvider>(
            builder: (context, BookingProvider, child) {},
          ),
        ),
      ),
    );
  }
}
