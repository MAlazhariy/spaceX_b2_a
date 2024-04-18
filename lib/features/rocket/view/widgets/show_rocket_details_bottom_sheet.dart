import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// todo: zak - bad way to import
//  see this discussion on GitHub to know the reason
// https://github.com/dart-lang/sdk/issues/42710#issuecomment-1328246797
import '../../data/model/rocket_model.dart';

void showRocketDetailsBottomSheet(
  BuildContext context, {
  required RocketModel rocket,
}) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          height: 1300,
          child: ListView(
            children: <Widget>[
              Image.network(rocket.image),
              Text(rocket.name),
              Text(
                rocket.description,

                style: const TextStyle(fontSize: 25,color: Colors.black),
              ),
              if (rocket.cost != null)
                Text(
                  'Cost: \$ ${rocket.cost}',
                  style: const TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
                ),
              if (rocket.wikipediaUrl != null)
              GestureDetector(
                // not working for some reason
                onTap: () {
                  launchUrl(rocket.wikipediaUrl as Uri);
                },
              child:  Text(
                rocket.wikipediaUrl!,
              style: TextStyle(
                fontSize: 25,
              decoration: TextDecoration.underline,
              color: Colors.blue,
              ),
              ),
              ),


            ],
          ),
        ),
      );
    },
  );
}
