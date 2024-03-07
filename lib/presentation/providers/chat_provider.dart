import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();


  List<Message> messageList = [
    Message(text: 'Hola', FromWho: fromWho.me),
    Message(text: 'Bienvenido', FromWho: fromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    final newMessage = Message(text: text, FromWho: fromWho.me);
    messageList.add(newMessage);
    if ( text .endsWith('?')) {
      await herReply();
    }
    notifyListeners();
    await scrollToBottom();
  }

  Future <void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
  } 

  Future <void> scrollToBottom() async {

  await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
  
}
