import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class PortfolioProfile extends StatefulWidget {
  const PortfolioProfile({super.key});

  @override
  State<PortfolioProfile> createState() => _PortfolioProfileState();
}

class _PortfolioProfileState extends State<PortfolioProfile> {
  final List<PlatformFile> _files = [];
  bool _isPicking = false;

  Future<void> _pickFiles() async {
    setState(() => _isPicking = true);
    final result = await FilePicker.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'png', 'jpg', 'jpeg'],
    );
    if (!mounted) return;
    if (result.isNotEmpty) {
      setState(() {
        for (final file in result) {
          if (!_files.any((item) => item.name == file.name)) {
            _files.add(file);
          }
        }
      });
    }
    setState(() => _isPicking = false);
  }

  IconData _fileIcon(String name) {
    final extension = name.split('.').last.toLowerCase();
    if (extension == 'pdf') return Icons.picture_as_pdf_outlined;
    if (['png', 'jpg', 'jpeg'].contains(extension)) {
      return Icons.image_outlined;
    }
    return Icons.description_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          const Text(
            'Build your portfolio',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add your CV, certificates, and work samples to stand out to employers.',
            style: TextStyle(color: AppColors.neutral600, height: 1.5),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: _isPicking ? null : _pickFiles,
            borderRadius: BorderRadius.circular(18),
            child: Ink(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary100,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.primary300),
              ),
              child: Column(
                children: [
                  Icon(
                    _isPicking
                        ? Icons.hourglass_top_rounded
                        : Icons.cloud_upload_outlined,
                    color: AppColors.primary700,
                    size: 38,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _isPicking ? 'Selecting files...' : 'Upload a file',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'PDF, DOC, DOCX, JPG, or PNG up to 10 MB',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.neutral600),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your files',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                '${_files.length} files',
                style: const TextStyle(color: AppColors.neutral600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (_files.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: Center(child: Text('No files added yet.')),
            )
          else
            ..._files.asMap().entries.map((entry) {
              final index = entry.key;
              final file = entry.value;
              return Card(
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 10),
                color: AppColors.neutral100,
                child: ListTile(
                  leading: Icon(
                    _fileIcon(file.name),
                    color: AppColors.primary600,
                  ),
                  title: Text(
                    file.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Text('Portfolio file'),
                  trailing: IconButton(
                    tooltip: 'Remove file',
                    onPressed: () => setState(() => _files.removeAt(index)),
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      color: AppColors.danger500,
                    ),
                  ),
                ),
              );
            }),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _files.isEmpty
                ? null
                : () => Navigator.of(context).pop(),
            icon: const Icon(Icons.check_rounded),
            label: const Text('Save portfolio'),
          ),
        ],
      ),
    );
  }
}
