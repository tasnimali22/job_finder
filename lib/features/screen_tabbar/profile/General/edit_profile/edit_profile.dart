import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/general/widgets/fieldlabel.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _nameController = TextEditingController(text: 'tasnim');
  final _bioController = TextEditingController(text: 'flutter developer');
  final _addressController = TextEditingController();
  String _selectedCountry = 'Egypt';
  PlatformFile? _profileImage;

  final List<String> _countries = const [
    'Egypt',
    'Saudi Arabia',
    'United Arab Emirates',
    'Jordan',
    'United Kingdom',
    'United States',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _pickProfileImage() async {
    final result = await FilePicker.pickFile(type: FileType.image);
    if (result != null && mounted) {
      setState(() => _profileImage = result);
    }
  }

  void _saveProfile() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your name.')));
      return;
    }
    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit profile'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundColor: AppColors.primary100,
                  backgroundImage: _profileImage?.path == null
                      ? null
                      : FileImage(File(_profileImage!.path!)),
                  child: _profileImage?.path == null
                      ? const Icon(
                          Icons.person_rounded,
                          size: 56,
                          color: AppColors.primary700,
                        )
                      : null,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: IconButton(
                    tooltip: 'Change photo',
                    onPressed: _pickProfileImage,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.camera_alt_outlined, size: 20),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const FieldLabel('Full name'),
          const SizedBox(height: 8),
          TextField(
            controller: _nameController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Enter your full name',
              prefixIcon: Icon(Icons.person_outline_rounded),
            ),
          ),
          const SizedBox(height: 20),
          const FieldLabel('Bio'),
          const SizedBox(height: 8),
          TextField(
            controller: _bioController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Tell employers about yourself',
              prefixIcon: Icon(Icons.notes_outlined),
            ),
          ),
          const SizedBox(height: 20),
          const FieldLabel('Address'),
          const SizedBox(height: 8),
          TextField(
            controller: _addressController,
            decoration: const InputDecoration(
              hintText: 'Enter your address',
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
          ),
          const SizedBox(height: 20),
          const FieldLabel('Country'),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            initialValue: _selectedCountry,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.public_rounded),
            ),
            items: _countries
                .map(
                  (country) =>
                      DropdownMenuItem(value: country, child: Text(country)),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => _selectedCountry = value);
            },
          ),
          const SizedBox(height: 28),
          FilledButton.icon(
            onPressed: _saveProfile,
            icon: const Icon(Icons.check_rounded),
            label: const Text('Save changes'),
          ),
        ],
      ),
    );
  }
}
