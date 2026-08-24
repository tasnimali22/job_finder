import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final _universityController = TextEditingController();
  final _titleController = TextEditingController();
  final _startYearController = TextEditingController();
  final _endYearController = TextEditingController();

  @override
  void dispose() {
    _universityController.dispose();
    _titleController.dispose();
    _startYearController.dispose();
    _endYearController.dispose();
    super.dispose();
  }

  Future<void> _pickYear(TextEditingController controller) async {
    final year = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (year != null) controller.text = '${year.year}';
  }

  void _save() {
    if (_universityController.text.trim().isEmpty ||
        _titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete the required fields.')),
      );
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Education'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          const Text(
            'Education history',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add your academic background to complete your profile.',
            style: TextStyle(color: AppColors.neutral600),
          ),
          const SizedBox(height: 24),
          _Field(
            label: 'University *',
            controller: _universityController,
            hint: 'University name',
          ),
          _Field(
            label: 'Degree or title *',
            controller: _titleController,
            hint: 'Bachelor of Art and Design',
          ),
          _Field(
            label: 'Start year',
            controller: _startYearController,
            hint: 'YYYY',
            icon: Icons.date_range_outlined,
            onIconTap: () => _pickYear(_startYearController),
          ),
          _Field(
            label: 'End year',
            controller: _endYearController,
            hint: 'YYYY',
            icon: Icons.date_range_outlined,
            onIconTap: () => _pickYear(_endYearController),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _save,
            icon: const Icon(Icons.check_rounded),
            label: const Text('Save education'),
          ),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.controller,
    required this.hint,
    this.icon,
    this.onIconTap,
  });

  final String label;
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final VoidCallback? onIconTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.neutral600,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: icon == null
                  ? null
                  : IconButton(onPressed: onIconTap, icon: Icon(icon)),
            ),
          ),
        ],
      ),
    );
  }
}
