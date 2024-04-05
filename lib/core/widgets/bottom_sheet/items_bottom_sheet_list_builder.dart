import 'package:spacex/core/widgets/bottom_sheet/my_bottom_sheet_drag_widget.dart';
import 'package:spacex/core/utils/extensions/context_extension.dart';
import 'package:spacex/core/utils/extensions/mediaquery_size.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/resources/app_size.dart';

class ItemsBottomSheetListBuilder<T> extends StatefulWidget {
  const ItemsBottomSheetListBuilder({
    super.key,
    required this.items,
    required this.onItemSelected,
    this.initSelection,
    required this.title,
    this.subTitle,

    /// set how does you want to show your item text,
    ///
    /// i.e: when select [WorkTime] show `"${e.from} - ${e.to}"`.
    required this.selectedItemTitle,
  });

  final List<T> items;
  final T? initSelection;
  final void Function(T value) onItemSelected;
  final String title;
  final String? subTitle;
  final String Function(T value) selectedItemTitle;

  @override
  State<ItemsBottomSheetListBuilder<T>> createState() => _ItemsBottomSheetListBuilderState<T>();
}

class _ItemsBottomSheetListBuilderState<T> extends State<ItemsBottomSheetListBuilder<T>> {
  late T? _selected = widget.initSelection;
  late ScrollController _scrollController;
  final _itemExtent = 50.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedItem();
    });
  }

  void _scrollToSelectedItem() {
    final selectedIndex = _selected != null ? widget.items.indexOf(_selected as T) : -1;
    final index = selectedIndex != -1 ? selectedIndex : 2.5;
    final offset = index * _itemExtent;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.querySize.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingExtraLarge,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MyBottomSheetDragWidget(),
            Text(
              widget.title,
              style: context.styleHeader1,
            ),
            if (widget.subTitle != null)
              Text(
                widget.subTitle!,
              ),
            const SizedBox(height: AppSize.paddingSmall),
            // content
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemExtent: _itemExtent,
                itemCount: widget.items.length,
                itemBuilder: (context, index){
                  final item = widget.items[index];
                  final isSelected = item == _selected;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selected = item;
                        _scrollToSelectedItem();
                        widget.onItemSelected(item);
                      });
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.paddingLarge,
                        vertical: AppSize.paddingDefault,
                      ),
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: isSelected ? kMainColor.withOpacity(0.22) : null,
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        widget.selectedItemTitle(item),
                        textDirection: TextDirection.ltr,
                        style: context.styleHeader2.copyWith(
                          fontSize: isSelected ? AppSize.fontDefault + 1 : AppSize.fontDefault - 1,
                          color: kTitleHeadColor.withOpacity(isSelected ? 1 : 0.5),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
