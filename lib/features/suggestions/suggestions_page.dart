import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding/common/widgets/root_button.dart';
import 'package:wedding/common/widgets/root_scaffold.dart';
import 'package:wedding/common/widgets/root_shader.dart';
import 'package:wedding/config/constants/icon_constants.dart';
import 'package:wedding/core/dependency_injector.dart';
import 'package:wedding/domain/schema/suggestion_type_schema.dart';
import 'package:wedding/features/suggestions/bloc/suggestion_bloc.dart';
import 'package:wedding/features/suggestions/widgets/suggestion_card.dart';
import 'package:wedding/features/suggestions/widgets/suggestion_filters.dart';

class SuggestionsPage extends StatefulWidget {
  const SuggestionsPage({super.key, required this.type});

  /// The Suggestion type details.
  final SuggestionTypeSchema type;

  @override
  State<SuggestionsPage> createState() => _SuggestionsPageState();
}

class _SuggestionsPageState extends State<SuggestionsPage> {
  /// The suggestion bloc.
  late final SuggestionBloc _bloc;

  /// The text editing controller.
  late final TextEditingController _controller;

  @override
  void initState() {
    _bloc = DependencyInjector().accessLazy<SuggestionBloc>();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RootScaffold(
      safeArea: false,
      // The custom padding of the page.
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      // The dynamic title of the page.
      appBar: AppBar(title: const Text("Suggestions")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The filter.
          const SuggestionFilters(),

          // The suggestion listing.
          Expanded(
            child: BlocBuilder<SuggestionBloc, SuggestionState>(
              bloc: _bloc,
              builder: (context, final SuggestionState state) {
                return RootShader(
                  stops: const [0.0, 0.05, 0.9, 1],
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 20, bottom: 100),
                    itemCount: 20,
                    itemBuilder: (context, final int index) {
                      return const SuggestionCard();
                    },
                    separatorBuilder: (__, _) => const SizedBox(height: 10),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // The floating action button.
      fab: Material(
        color: Colors.transparent,
        child: RootButton(
          onTap: () async {
            HapticFeedback.selectionClick();
          },
          child: IconConstants.add,
        ),
      ),
    );
  }
}
