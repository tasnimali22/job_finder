import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/general/widgets/field.dart';

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
          Field(
            label: 'University *',
            controller: _universityController,
            hint: 'University name',
          ),
          Field(
            label: 'Degree or title *',
            controller: _titleController,
            hint: 'Bachelor of Art and Design',
          ),
          Field(
            label: 'Start year',
            controller: _startYearController,
            hint: 'YYYY',
            icon: Icons.date_range_outlined,
            onIconTap: () => _pickYear(_startYearController),
          ),
          Field(
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
