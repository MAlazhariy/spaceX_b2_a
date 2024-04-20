import 'package:flutter/material.dart';

import '../../data/model/rocket_model.dart';
import '../widgets/show_rocket_details_bottom_sheet.dart';

class RocketListView extends StatelessWidget {
  const RocketListView({super.key, required this.rockets});

  final List<RocketModel> rockets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: rockets.length,
        itemBuilder: (item, index) {
          final rocket = rockets[index];

          return GestureDetector(
            onTap: () {
              showRocketDetailsBottomSheet(
                context,
                rocket: rocket,
              );
            },
            child: Card(
              margin: const EdgeInsets.only(top: 25, left: 15, right: 15),
              color: Colors.white30,
              child: ListTile(
                title: Text(
                  rocket.name,
                  style: const TextStyle(fontSize: 35),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${rocket.cost}",
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      rockets[index].description,
                      style: const TextStyle(
                        height: 1.3,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                leading: FadeInImage.assetNetwork(placeholder: 'assets/images/loading (2).gif', image: rockets[index].image),
              ),
            ),
          );
        });
  }
}
