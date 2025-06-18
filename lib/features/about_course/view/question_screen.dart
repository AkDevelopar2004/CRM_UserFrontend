import 'package:flutter/material.dart';

// Add these imports
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/course_bloc/quesstion_bloc/question_bloc.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Question"),
      ),
      body: BlocBuilder<QuestionBloc, QuestionState>(
        builder: (context, state) {
          if (state is! QuestionLoadedState) return const SizedBox();

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Question ${state.questionIndex + 1}/10"),
                const SizedBox(height: 12),
                const Text("This is a static question?"),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Time"),
                    Text(
                        "00:${state.timeRemaining.toString().padLeft(2, '0')}"),
                  ],
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: state.timeRemaining / 10,
                ),
                const SizedBox(height: 20),
                Column(
                  children: List.generate(state.options.length, (index) {
                    return GestureDetector(
                      onTap: () => context
                          .read<QuestionBloc>()
                          .add(SelectOptionEvent(index)),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: state.selectedOption == index
                                ? Colors.deepPurple
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.options[index]),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: state.selectedOption == index
                                  ? Colors.deepPurple
                                  : Colors.transparent,
                              child: state.selectedOption == index
                                  ? const Icon(Icons.check,
                                      size: 14, color: Colors.white)
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => context
                            .read<QuestionBloc>()
                            .add(PreviousQuestionEvent()),
                        child: const Text("Previous"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => context
                            .read<QuestionBloc>()
                            .add(NextQuestionEvent()),
                        child: const Text("Next"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Submit"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
