import 'package:compass_app/ui/home/view_model/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';

const String bookingButtonKey = 'booking-button';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewmodel});

  final HomeViewmodel viewmodel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewmodel.deleteBooking.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewmodel.deleteBooking.removeListener(_onResult);
    widget.viewmodel.deleteBooking.addListener(_onResult);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: () => context.go(Routes.search),
        label: Text("Book New Trip"),
        icon: const Icon(Icons.add_location_outlined),
        key: const ValueKey(bookingButtonKey),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: ListenableBuilder(
          listenable: widget.viewmodel.load,
          builder: (context, child) {
            if (widget.viewmodel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (widget.viewmodel.load.error) {
              return ErrorIndicator();
            }
          }),
      ),
    );
  }
  
  void _onResult() {
    if (widget.viewmodel.deleteBooking.completed) {
      widget.viewmodel.deleteBooking.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Booking deleted"))
      );
    }
    
    if (widget.viewmodel.deleteBooking.error) {
      widget.viewmodel.deleteBooking.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error while deleting booking"))
      );
    }
  }
}
