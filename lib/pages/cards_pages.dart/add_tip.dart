import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class AddTip extends StatelessWidget {
  AddTip({super.key});

  final _tipTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Tip"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _tipTextController,
            decoration: InputDecoration(labelText: 'Enter Tip'),
            keyboardType: TextInputType.multiline,
            maxLines: null, // <-- SEE HERE
          ),
          ElevatedButton(
            onPressed: () {
              context.read<TipsProvider>().createTip(
                    tip: Tip(text: _tipTextController.text),
                  );
              context.pop();
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
