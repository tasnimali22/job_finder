import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  int? _expandedIndex;

  final List<_FaqItem> _faqs = const [
    _FaqItem(
      question: 'How do I update my profile?',
      answer:
          'Open your profile, choose Edit profile, then update your details and save the changes.',
    ),
    _FaqItem(
      question: 'How can I apply for a job?',
      answer:
          'Open a job that matches your experience and tap Apply. Complete the requested information before submitting.',
    ),
    _FaqItem(
      question: 'How do I upload my CV?',
      answer:
          'Go to Portfolio from your profile and choose Add file to select a document from your device.',
    ),
    _FaqItem(
      question: 'How do I manage notifications?',
      answer:
          'Open Notifications from your profile and turn each job alert on or off according to your preference.',
    ),
    _FaqItem(
      question: 'I forgot my password. What should I do?',
      answer:
          'Use the password recovery option on the login screen and follow the verification steps.',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help Center'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          const Text(
            'How can we help?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'Search our answers or browse the most common questions.',
            style: TextStyle(color: AppColors.neutral600),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _searchController,
            onChanged: (value) => setState(() {
              _searchText = value.trim().toLowerCase();
              _expandedIndex = null;
            }),
            decoration: InputDecoration(
              hintText: 'Search questions',
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: _searchText.isEmpty
                  ? null
                  : IconButton(
                      tooltip: 'Clear search',
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _searchText = '';
                          _expandedIndex = null;
                        });
                      },
                      icon: const Icon(Icons.close_rounded),
                    ),
              filled: true,
              fillColor: AppColors.neutral100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 24),
          ..._faqs
              .asMap()
              .entries
              .where((entry) {
                return _searchText.isEmpty ||
                    entry.value.question.toLowerCase().contains(_searchText);
              })
              .map((entry) {
                final index = entry.key;
                final faq = entry.value;
                final isExpanded = _expandedIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () => setState(() {
                        _expandedIndex = isExpanded ? null : index;
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    faq.question,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up_rounded
                                      : Icons.keyboard_arrow_down_rounded,
                                ),
                              ],
                            ),
                            if (isExpanded) ...[
                              const SizedBox(height: 12),
                              Text(
                                faq.answer,
                                style: const TextStyle(
                                  color: AppColors.neutral600,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
          if (_faqs.every(
            (faq) =>
                _searchText.isNotEmpty &&
                !faq.question.toLowerCase().contains(_searchText),
          ))
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: Center(child: Text('No matching questions found.')),
            ),
        ],
      ),
    );
  }
}

class _FaqItem {
  const _FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;
}
