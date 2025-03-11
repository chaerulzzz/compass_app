import 'package:compass_app/ui/auth/logout/view_models/logout_view_model.dart';
import 'package:compass_app/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key, required this.viewModel});

  final LogoutViewModel viewModel;

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.logout.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LogoutButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.logout.removeListener(_onResult);
    widget.viewModel.logout.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.logout.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: 40.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey1),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.transparent
        ),
        child: InkResponse(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            widget.viewModel.logout.execute();
          },
          child: Center(
            child: Icon(
              size: 24.0,
              Icons.logout,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }

  void _onResult() {
    /// Tidak perlu kita mengubah navigasi ke '/login'
    /// karena sudah otomotasi dilakukan oleh GoROuter
    if (widget.viewModel.logout.error) {
      widget.viewModel.logout.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error while try to logout"),
            action: SnackBarAction(
                label: "Please try again",
                onPressed: widget.viewModel.logout.execute),
          )
      );
    }
  }
}
