// import 'dart:io';
//
// import 'package:spacex/core/resources/app_colors.dart';
// import 'package:flutter/material.dart';
//
// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const MyAppBar({
//     super.key,
//     required this.title,
//     this.backgroundColor,
//     this.actions,
//     this.leading,
//   });
//
//   final Widget? title;
//   final Color? backgroundColor;
//   final List<Widget>? actions;
//   final Widget? leading;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         gradient: const LinearGradient(
//           colors: [
//             kBGGradientColor,
//             Color(0x00ffffff),
//           ],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           if(leading != null) leading!,
//           if (Navigator.canPop(context) && leading == null)
//             IconButton(
//               icon: Icon(
//                 Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
//                 color: kPrimaryColor,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           if (title != null) Center(child: Expanded(child: title!)),
//           Row(
//             children: actions ?? [],
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
