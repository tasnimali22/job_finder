import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  String _selectedLanguage = 'English';

  final List<_LanguageOption> _languages = const [
    _LanguageOption(name: 'English', nativeName: 'English', code: 'EN'),
    _LanguageOption(name: 'Arabic', nativeName: 'العربية', code: 'AR'),
    _LanguageOption(name: 'French', nativeName: 'Francais', code: 'FR'),
    _LanguageOption(name: 'German', nativeName: 'Deutsch', code: 'DE'),
    _LanguageOption(name: 'Spanish', nativeName: 'Espanol', code: 'ES'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          const Text(
            'Choose your language',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'Select the language you prefer for the Jobsque app.',
            style: TextStyle(color: AppColors.neutral600, height: 1.5),
          ),
          const SizedBox(height: 24),
          ..._languages.map(
            (language) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RadioListTile<String>(
                value: language.name,
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => _selectedLanguage = value);
                },
                activeColor: AppColors.primary500,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(
                    color: language.name == _selectedLanguage
                        ? AppColors.primary300
                        : AppColors.neutral300,
                  ),
                ),
                title: Text(
                  language.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(language.nativeName),
                secondary: CircleAvatar(
                  backgroundColor: AppColors.primary100,
                  child: Text(
                    language.code,
                    style: const TextStyle(
                      color: AppColors.primary700,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(_selectedLanguage),
            child: const Text('Save language'),
          ),
        ],
      ),
    );
  }
}

class _LanguageOption {
  const _LanguageOption({
    required this.name,
    required this.nativeName,
    required this.code,
  });

  final String name;
  final String nativeName;
  final String code;
}
