import 'package:spacex/core/utils/extensions/context_extension.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.items,
    this.backgroundColor,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedColorOpacity,
    this.itemShape = const StadiumBorder(),
    this.margin = const EdgeInsets.symmetric(
      horizontal: AppSize.paddingLarge,
    ),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuint,
  });

  /// A list of tabs to display, ie `Home`, `Likes`, etc
  final List<CustomBottomBarItem> items;

  /// The tab to display.
  final int currentIndex;

  /// Returns the index of the tab that was tapped.
  final Function(int)? onTap;

  /// The background color of the bar.
  final Color? backgroundColor;

  /// The color of the icon and text when the item is selected.
  final Color? selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  final Color? unselectedItemColor;

  /// The opacity of color of the touchable background when the item is selected.
  final double? selectedColorOpacity;

  /// The border shape of each item.
  final ShapeBorder itemShape;

  /// A convenience field for the margin surrounding the entire widgets.
  final EdgeInsets margin;

  /// The transition duration
  final Duration duration;

  /// The transition curve
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: const StadiumBorder(),
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 23,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: AppSize.paddingLarge,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.paddingExtraSmall,
          ),
          child: SafeArea(
            minimum: margin,
            child: Row(
              /// Using a different alignment when there are 2 items or less
              /// so it behaves the same as BottomNavigationBar.
              mainAxisAlignment: items.length <= 2 ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.spaceAround,
              children: List.generate(
                items.length,
                (index) {
                  final item = items[index];
                  final isSelected = index == currentIndex;
                  return TweenAnimationBuilder<double>(
                    tween: Tween(
                      end: isSelected ? 1.0 : 0.0,
                    ),
                    curve: curve,
                    duration: duration,
                    builder: (context, t, _) {
                      final selectedColor = item.selectedColor ?? selectedItemColor ?? kMainColor;
                      final unselectedColor = item.unselectedColor ?? unselectedItemColor ?? kBorderNeutralColor;

                      return InkWell(
                        onTap: () => onTap?.call(index),
                        focusColor: selectedColor.withOpacity(0.1),
                        highlightColor: selectedColor.withOpacity(0.1),
                        splashColor: selectedColor.withOpacity(0.1),
                        hoverColor: selectedColor.withOpacity(0.1),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: AppSize.paddingSmall),
                            // icon
                            IconTheme(
                              data: IconThemeData(
                                color: Color.lerp(unselectedColor, selectedColor, t),
                                size: 24,
                              ),
                              child: isSelected ? item.activeIcon ?? item.icon : item.icon,
                            ),
                            ClipRect(
                              clipBehavior: Clip.antiAlias,
                              child: Text(
                                item.title,
                                style: context.styleBodySmall.copyWith(
                                  color: Color.lerp(kBorderNeutralColor, kPrimaryTitleColor, t),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSize.paddingSmall),
                            Container(
                              width: 80 * t,
                              height: 3,
                              decoration: const ShapeDecoration(
                                shape: StadiumBorder(),
                                color: kMainColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
        /*// Slide animation for the line
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: (currentIndex) * context.querySize.width / items.length),
          duration: duration,
          curve: curve,
          builder: (context, value, _) {
            return PositionedDirectional(
              start: value,
              child: Container(
                width: width,
                height: 3,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  color: kMainColor,
                ),
              ),
            );
          },
        ),*/
      ],
    );
  }
}

/// A tab to display in a [CustomBottomBar]
class CustomBottomBarItem {
  /// An icon to display.
  final Widget icon;

  /// An icon to display when this tab bar is active.
  final Widget? activeIcon;

  /// Text to display, ie `Home`
  final String title;

  /// A primary color to use for this tab.
  final Color? selectedColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  CustomBottomBarItem({
    required this.icon,
    required this.title,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
  });
}
