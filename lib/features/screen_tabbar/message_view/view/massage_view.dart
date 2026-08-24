import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/core/widgets/custom_circle_indicator.dart';
import 'package:jobs_que_app/features/screen_tabbar/message_view/data/manger/cubit/get_cubit_cubit.dart';

class MassageView extends StatelessWidget {
  const MassageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetCubitCubit, GetCubitState>(
        builder: (context, state) {
          if (state is GetMessageLoading || state is GetCubitInitial) {
            return const Center(child: CustomCircleIndicator());
          }
          if (state is GetMessageFailure) {
            return Center(child: Text(state.errMassage));
          }

          final messages = context.read<GetCubitCubit>().massage;
          if (messages.isEmpty) {
            return const _EmptyMessages();
          }

          final lastMessage = messages.last;
          final contactName = lastMessage.senderUser?.trim().isNotEmpty == true
              ? lastMessage.senderUser!.trim()
              : 'Company';

          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Messages', style: AppTextStyles.heading2Medium),
                      IconButton(
                        tooltip: 'Search messages',
                        onPressed: () {},
                        icon: const Icon(Icons.search_rounded),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Stay connected with employers and follow your conversations.',
                    style: TextStyle(color: Color(0xFF6B7280)),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 0,
                    color: const Color(0xFFF4F4F5),
                    child: ListTile(
                      onTap: () => context.push(AppRouter.kchat),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: const CircleAvatar(
                        radius: 27,
                        backgroundColor: Color(0xFFD6E4FF),
                        child: Icon(
                          Icons.business_rounded,
                          color: Color(0xFF1939B7),
                        ),
                      ),
                      title: Text(
                        contactName,
                        style: AppTextStyles.textLMedium,
                      ),
                      subtitle: Text(
                        lastMessage.massage?.trim().isNotEmpty == true
                            ? lastMessage.massage!.trim()
                            : 'Start a conversation',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textSRegular,
                      ),
                      trailing: const Icon(Icons.chevron_right_rounded),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _EmptyMessages extends StatelessWidget {
  const _EmptyMessages();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.forum_outlined,
                size: 64,
                color: Color(0xFF3366FF),
              ),
              const SizedBox(height: 16),
              Text('No messages yet', style: AppTextStyles.heading4Medium),
              const SizedBox(height: 8),
              const Text(
                'Your conversations with employers will appear here.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF6B7280)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
