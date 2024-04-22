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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(


            children: <Widget> [
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
              ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse(rocket.wikipediaUrl!));
                },
                child: const Text('Wikipedia'),
              ),
            ],
          ),
        );

      },
    );
  }





