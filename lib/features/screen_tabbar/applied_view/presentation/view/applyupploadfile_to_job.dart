import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/core/widgets/custom_button.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/data/apply_cubit/apply_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/custom_appbar_apply.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/job_apply_stepper.dart';

class ApplyUpploadFileJob extends StatefulWidget {
  const ApplyUpploadFileJob({
    super.key,
    this.selectedCvFile,
    this.selectedproFile,
  });
  final File? selectedCvFile;
  final File? selectedproFile;

  @override
  State<ApplyUpploadFileJob> createState() => _ApplyUpploadFileJobState();
}

class _ApplyUpploadFileJobState extends State<ApplyUpploadFileJob> {
  File? selectedCvFile;
  File? selectedproFile;

  final List<PlatformFile> _files = [];
  bool _isPicking = false;

  Future<void> _pickFiles() async {
    setState(() => _isPicking = true);
    final result = await FilePicker.pickFiles(
      // ignore: deprecated_member_use
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
        _syncSelectedFiles();
      });
    }
    setState(() => _isPicking = false);
  }

  void _syncSelectedFiles() {
    selectedCvFile = _files.isNotEmpty && _files.first.path != null
        ? File(_files.first.path!)
        : null;
    selectedproFile = _files.length > 1 && _files[1].path != null
        ? File(_files[1].path!)
        : null;
  }

  IconData _fileIcon(String name) {
    final extension = name.split('.').last.toLowerCase();
    if (extension == 'pdf') return Icons.picture_as_pdf_outlined;
    if (['png', 'jpg', 'jpeg'].contains(extension)) {
      return Icons.image_outlined;
    }
    return Icons.description_outlined;
  }

  // Future<void> pickCv() async {
  //   final result = await FilePicker.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf'],
  //   );
  //   if (result.isEmpty) return;

  //   final path = result.single.path;
  //   if (path != null) {
  //     setState(() {
  //       selectedCvFile = File(path);
  //     });
  //   }
  // }

  // Future<void> pickpro() async {
  //   final result = await FilePicker.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf'],
  //   );
  //   if (result.isEmpty) return;

  //   final pathpr = result.single.path;
  //   if (pathpr != null) {
  //     setState(() {
  //       selectedproFile = File(pathpr);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplyCubit, ApplyState>(
      listener: (context, state) {
        if (state is ApplySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Center(child: Text("success"))),
          );
          context.go(AppRouter.kHome);
        } else if (state is ApplyFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Center(child: Text(state.errMessage))),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppbarapply(text: 'Apply job'),
                  const JobApplyStepper(currentStep: 2),
                  Text("Upload portfolio", style: AppTextStyles.heading4Medium),
                  Text(
                    "Fill in your bio data correctly",
                    style: AppTextStyles.textMRegularn,
                  ),
                  SizedBox(height: 20.h),
                  Text("Upload cv", style: AppTextStyles.textLRegular),
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
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
                            onPressed: () => setState(() {
                              _files.removeAt(index);
                              _syncSelectedFiles();
                            }),
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                              color: AppColors.danger500,
                            ),
                          ),
                        ),
                      );
                    }),
                ],
              ),
            ),
          ),

          bottomNavigationBar: Padding(
            padding: EdgeInsetsGeometry.only(
              bottom: 40.h,
              left: 24.w,
              right: 24.w,
            ),
            child: CustomBotton(
              text: "Submit",
              onPressed: () {
                if (selectedCvFile == null || selectedproFile == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select CV and Portfolio'),
                    ),
                  );
                  return;
                }

                context.read<ApplyCubit>().applyJob(
                  cvFile: selectedCvFile!,
                  otherFile: selectedproFile!,
                );

                GoRouter.of(context).push(AppRouter.kapplysuccess);
              },
            ),
          ),
        );
      },
    );
  }
}
