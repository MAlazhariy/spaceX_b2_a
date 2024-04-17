// todo: zak - file naming convention `snake_case` + Expressive name.

import 'package:flutter/material.dart';

// todo: zak - bad way to import
//  see this discussion on GitHub to know the reason
// https://github.com/dart-lang/sdk/issues/42710#issuecomment-1328246797
import '../../../../core/network/models/RocketModel.dart';



// todo: zak - naming convention of the function.
// the name of the function is not easy to understand by you or the others
//
// You could make it something like `showRocketDetailsBottomSheet`
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
        // todo: zak - why using Container?
        // Could you use something better?
        child: Container(
          height: 1300,
          child: ListView(

            children: <Widget>[
              // todo: zak - why did you use this operator `!`?
              // todo: zak - make the variables non-nullable.
              // هو انت كل ما تستعمل المتغير هتكتب قدامه !
              // طالما هتستخدمها كل مرة أمال عملت المتغير nullable ليه؟
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
