import 'package:compass_app/domain/models/booking/booking_summary.dart';
import 'package:compass_app/ui/core/themes/dimens.dart';
import 'package:compass_app/ui/core/ui/date_format_start_end.dart';
import 'package:compass_app/ui/home/view_model/home_viewmodel.dart';
import 'package:compass_app/ui/home/widgets/home_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/themes/colors.dart';
import '../../core/ui/error_indicator.dart';

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
              return ErrorIndicator(
                title: 'Error while loading home',
                label: 'Try Again',
                onPressed: widget.viewmodel.load.execute,
              );
            }

            return child!;
          },
          child: ListenableBuilder(
            listenable: widget.viewmodel,
              builder: (context, _) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Dimens.of(context).paddingScreenVertical,
                          horizontal: Dimens.of(context).paddingScreenHorizontal
                        ),
                        child: HomeHeader(viewModel: widget.viewmodel),
                      )
                    ),
                    SliverList.builder(
                      itemCount: widget.viewmodel.bookings.length,
                      itemBuilder: (_, index) => _Booking(
                        key: ValueKey(widget.viewmodel.bookings[index].id),
                        booking: widget.viewmodel.bookings[index],
                        onTap: () => context.push(Routes.bookingWithId(
                          widget.viewmodel.bookings[index].id)),
                        confirmDismiss: (_) async {
                          await widget.viewmodel.deleteBooking.execute(
                            widget.viewmodel.bookings[index].id
                          );

                          if (widget.viewmodel.deleteBooking.completed) {
                            return true;
                          } else {
                            return false;
                          }
                        }
                      ),
                    )
                  ],
                );
              }),
        ),
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

class _Booking extends StatelessWidget {
  const _Booking({
    super.key,
    required this.booking,
    required this.onTap,
    required this.confirmDismiss
  });

  final BookingSummary booking;
  final GestureTapCallback onTap;
  final ConfirmDismissCallback confirmDismiss;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(booking.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: confirmDismiss,
      background: Container(
        color: AppColors.grey1,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: Dimens.paddingHorizontal),
              child: Icon(Icons.delete),
            )
          ],
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.of(context).paddingScreenHorizontal,
            vertical: Dimens.paddingVertical
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(booking.name, style: Theme.of(context).textTheme.titleLarge),
              Text(dateFormatStartEnd(
                DateTimeRange(start: booking.startDate, end: booking.endDate)),
                style: Theme.of(context).textTheme.bodyLarge
              )
            ],
          ),
        ),
      ));
  }
}
