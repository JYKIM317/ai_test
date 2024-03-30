import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_test/provider/main_page_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumping_dot/jumping_dot.dart';

class MainPageWidgets {
  Widget promptHistoryViewWidget() {
    return Consumer(
      builder: (context, ref, child) {
        List<String>? promptHistory = ref.watch(promptProvider).promptList;
        bool isLoading = ref.watch(promptProvider).isLoading;
        if (promptHistory == null) {
          ref.read(promptProvider).fetchMyPromptHistory();
          return const SizedBox(
            width: double.infinity,
            height: double.infinity,
          );
        }
        promptHistory = promptHistory.reversed.toList();

        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  reverse: true,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 64, 16, 34),
                  itemCount: promptHistory.length,
                  itemBuilder: (BuildContext ctx, int idx) {
                    return Align(
                      alignment: idx % 2 != 0
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        decoration: BoxDecoration(
                          color: idx % 2 != 0
                              ? Colors.transparent
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey[200]!,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          promptHistory![idx],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, idx) {
                    return const SizedBox(height: 20);
                  },
                ),
              ),
              if (isLoading) isPromptLoadingWidget(),
            ],
          ),
        );
      },
    );
  }

  Widget isPromptLoadingWidget() {
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      alignment: Alignment.centerLeft,
      child: JumpingDots(
        color: Colors.grey[400]!,
        radius: 10,
        animationDuration: const Duration(milliseconds: 200),
      ),
    );
  }
}

class PromptInputWidget extends ConsumerStatefulWidget {
  const PromptInputWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PromptInputWidgetState();
}

class _PromptInputWidgetState extends ConsumerState<PromptInputWidget> {
  TextEditingController promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(promptProvider).isLoading;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: promptController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  minLines: 1,
                  maxLines: 4,
                  keyboardType: TextInputType.text,
                  onSubmitted: (text) async {
                    if (isLoading == false) {
                      ref.read(promptProvider).prompting(prompt: text);
                      promptController.text = '';
                    }
                  },
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: const FaIcon(
              FontAwesomeIcons.camera,
              size: 24,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: const FaIcon(
              FontAwesomeIcons.image,
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
