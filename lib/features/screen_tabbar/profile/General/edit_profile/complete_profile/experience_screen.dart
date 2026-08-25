import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/general/widgets/field.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final _positionController = TextEditingController();
  final _workTypeController = TextEditingController();
  final _companyController = TextEditingController();
  final _locationController = TextEditingController();
  final _startYearController = TextEditingController();
  final _endYearController = TextEditingController();

  @override
  void dispose() {
    _positionController.dispose();
    _workTypeController.dispose();
    _companyController.dispose();
    _locationController.dispose();
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
    if (_positionController.text.trim().isEmpty ||
        _companyController.text.trim().isEmpty) {
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
      appBar: AppBar(title: const Text('Experience'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          const Text(
            'Work experience',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'Show employers what you have accomplished.',
            style: TextStyle(color: AppColors.neutral600),
          ),
          const SizedBox(height: 24),
          Field(
            label: 'Position *',
            controller: _positionController,
            hint: 'Senior UI/UX Designer',
          ),
          Field(
            label: 'Type of work',
            controller: _workTypeController,
            hint: 'Full time, part time, or freelance',
          ),
          Field(
            label: 'Company name *',
            controller: _companyController,
            hint: 'Company name',
          ),
          Field(
            label: 'Location',
            controller: _locationController,
            hint: 'City or remote',
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
            hint: 'YYYY or present',
            icon: Icons.date_range_outlined,
            onIconTap: () => _pickYear(_endYearController),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _save,
            icon: const Icon(Icons.check_rounded),
            label: const Text('Save experience'),
          ),
        ],
      ),
    );
  }
}
