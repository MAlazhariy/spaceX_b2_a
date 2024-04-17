import 'package:spacex/core/utils/common/languages.dart';
import 'package:spacex/core/widgets/main/main_background.dart';
import 'package:spacex/core/widgets/main/main_button.dart';
import 'package:spacex/core/widgets/main/main_leading_padding.dart';
import 'package:spacex/core/widgets/snk_bar.dart';
import 'package:spacex/core/utils/extensions/context_extension.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/features/language/data/model/language_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String? _selectedLang;
  final List<LanguageModel> _languages = Language.languages;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _init();
    });
  }

  void _init() {
    _selectedLang = context.locale.toString();
    setState(() {});
  }

  Future<void> _onChangeLanguage(BuildContext context) async {
    await Language.changeLanguage(context, locale: Locale(_selectedLang!));
    if (!context.mounted) return;
    SnkBar.show(context, 'language_changed_success'.tr());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'change_language'.tr(),
        ),
        leading: const MyBackLeading(),
      ),
      extendBodyBehindAppBar: true,
      body: MainGalaxyBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsetsDirectional.only(
                start: AppSize.paddingLarge,
                end: AppSize.paddingLarge,
                top: AppSize.paddingSmall,
                bottom: AppSize.paddingSmall,
              ),
              child: Text(
                'select_language'.tr(),
                style: context.styleHeader2,
              ),
            ),
            Expanded(
              child: Scrollbar(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                    itemCount: _languages.length,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSize.paddingDefault,
                      horizontal: AppSize.paddingLarge,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final lang = _languages[index];

                      return _languageWidget(
                        context: context,
                        isSelected: _selectedLang == lang.code,
                        languageModel: lang,
                        index: index,
                      );
                    },
                    separatorBuilder: (_, index) => const SizedBox(height: AppSize.paddingDefault),
                  ),
                ),
              ),
            ),

            // save button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.paddingExtraLarge,
                vertical: AppSize.paddingDefault,
              ),
              child: MainButton(
                title: 'save'.tr(),
                onPressed: _selectedLang != null && _selectedLang != context.locale.toString()
                    ? () async {
                        _onChangeLanguage(context);
                      }
                    : null,
                fit: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _languageWidget({
    required bool isSelected,
    required BuildContext context,
    required LanguageModel languageModel,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        if (_selectedLang != languageModel.code) {
          setState(() {
            _selectedLang = languageModel.code;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? kBackgroundColor : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppSize.radius40,
            ),
          ),
          border: Border.all(
            color: isSelected ? kBorderNeutralColor : kBorderColor,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingLarge,
          vertical: AppSize.paddingDefault,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // language with flag
            Row(
              children: [
                // flag
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppSize.radiusDefault,
                  ),
                  child: Image.asset(
                    languageModel.image,
                    height: isSelected ? 35 : 32,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: AppSize.paddingDefault),
                Text(
                  languageModel.title,
                  style: isSelected ? context.styleBodyBold : context.styleSubtitle,
                ),
              ],
            ),
            isSelected
                ? const Icon(
                    Icons.check,
                    size: AppSize.extraLarge,
                    color: kMainColor,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
