
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
	final String sender;
	final String message;
	final String time;
	final bool isMe;

	const ChatMessage({
		super.key,
		required this.sender,
		required this.message,
		required this.time,
		this.isMe = false,
	});

	@override
	Widget build(BuildContext context) {
		return Align(
			alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
			child: Container(
				margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
				padding: const EdgeInsets.all(12),
				decoration: BoxDecoration(
					color: isMe ? Colors.deepPurple[100] : Colors.grey[200],
					borderRadius: BorderRadius.only(
						topLeft: const Radius.circular(16),
						topRight: const Radius.circular(16),
						bottomLeft: isMe ? const Radius.circular(16) : const Radius.circular(0),
						bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(16),
					),
				),
				child: Column(
					crossAxisAlignment:
							isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
					children: [
						Text(
							sender,
							style: TextStyle(
								fontWeight: FontWeight.bold,
								color: isMe ? Colors.deepPurple : Colors.black87,
								fontSize: 13,
							),
						),
						const SizedBox(height: 4),
						Text(
							message,
							style: const TextStyle(fontSize: 15),
						),
						const SizedBox(height: 6),
						Text(
							time,
							style: TextStyle(
								fontSize: 11,
								color: Colors.grey[600],
							),
						),
					],
				),
			),
		);
	}
}
