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
          Navigator.pop(context);
        },
        // todo: zak - why using Container?
        // Could you use something better?
        child: Container(
          height: 1300,
          child: ListView(

            children: <Widget>[
              // todo: why did you use this operator `!`?
              // todo: make the variables non-nullable.
              // هو كل ما تستعمل المتغير هتكتب قدامه العلامة دي !
              // طالما هتستخدمها كل مرة أمال عملت المتغير nullable ليه؟
              Image.network(rocket.img!),
              Text(rocket.name!),
              Text(rocket.description!,style: TextStyle(fontSize: 25),),
              // todo: what if the cost is null?
              Text('Cost: ${rocket.cost}',style: TextStyle(fontSize: 25),),
              // todo: what if the var is null?
              // todo: what is the main functionality of this variable `wikipedia`?
              // لو اهتميت بتسمية المتغير صح هتقدر بسهولة تميز انه رابط المفروض يفتح للمستخدم مش نص يتعرض
              Text(rocket.wikipedia!,style: TextStyle(fontSize: 25),),
            ],
          ),
        ),
      );
    },
  );
}
