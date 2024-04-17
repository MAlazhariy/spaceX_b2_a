import 'package:flutter/material.dart';

import '../../../../core/network/models/RocketModel.dart';




void showBottomSheett(BuildContext context, {required rocketModel rocket}) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // Do something when the sheet is tapped
          Navigator.pop(context); // Close the bottom sheet
        },
        child: Container(
          height: 1300,
          child: ListView(

            children: <Widget>[
              Image.network(rocket.img!),
              Text(rocket.name!),
              Text(rocket.description!,style: TextStyle(fontSize: 25),),
              Text('Cost: ${rocket.cost}',style: TextStyle(fontSize: 25),),
              Text(rocket.wikipedia!,style: TextStyle(fontSize: 25),),


            ],
          ),
        ),
      );
    },
  );
}
