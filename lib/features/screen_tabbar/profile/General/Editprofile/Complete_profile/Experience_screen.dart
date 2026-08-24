import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

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
          _Field(
            label: 'Position *',
            controller: _positionController,
            hint: 'Senior UI/UX Designer',
          ),
          _Field(
            label: 'Type of work',
            controller: _workTypeController,
            hint: 'Full time, part time, or freelance',
          ),
          _Field(
            label: 'Company name *',
            controller: _companyController,
            hint: 'Company name',
          ),
          _Field(
            label: 'Location',
            controller: _locationController,
            hint: 'City or remote',
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
