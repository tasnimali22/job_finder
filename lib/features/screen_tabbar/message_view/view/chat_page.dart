import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/features/screen_tabbar/message_view/data/manger/cubit/get_cubit_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/message_view/data/model/get_message.dart';
import 'package:jobs_que_app/features/screen_tabbar/message_view/view/widget/custom_chat_buble.dart';
import 'package:jobs_que_app/features/screen_tabbar/message_view/view/widget/custom_chat_left.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = ScrollController();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _sendMessage(BuildContext context) {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    context.read<GetCubitCubit>().sendMassage(massage: text);
    _textController.clear();
    _controller.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  bool _isUserMessage(GetMessageModel message) {
    final sender = message.senderUser?.toLowerCase().trim();
    return sender == 'user' || sender == '1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("company"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop;
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<GetCubitCubit, GetCubitState>(
              builder: (context, state) {
                final messages = context.read<GetCubitCubit>().massage;
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return _isUserMessage(message)
                        ? Chatbuble(message: message)
                        : ChatbubleForfrind(message: message);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              onSubmitted: (_) => _sendMessage(context),
              decoration: InputDecoration(
                hintText: "Send message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primary500),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(context),
                ),

                suffixIconColor: AppColors.primary500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
