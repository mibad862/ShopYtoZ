import 'package:flutter/material.dart';
import 'package:shop_y_z/models/dashboard_model.dart';

class DashboardItemView extends StatelessWidget {
  const DashboardItemView({
    super.key,
    required this.omPress,
    required this.model,
  });

  final Function(String) omPress;
  final DashboardModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => omPress(model.routeName),
      child: Card(
        elevation: 3.0,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                model.iconData,
                size: 50,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              Text(
                model.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
