import 'package:flutter/material.dart';
import 'package:wedding/common/widgets/root_gap.dart';
import 'package:wedding/config/constants/asset_constants.dart';
import 'package:wedding/config/constants/padding_constants.dart';
import 'package:wedding/core/dependency_injector.dart';
import 'package:wedding/extensions/context_extensions.dart';
import 'package:wedding/features/home/bloc/home_bloc.dart';
import 'package:wedding/features/home/widgets/flip_card.dart';
import 'package:wedding/features/home/widgets/frosted_label.dart';
import 'package:wedding/features/schedule/schedule_page.dart';

import '../../common/widgets/root_frosted_card.dart';
import '../../config/constants/icon_constants.dart';
import '../../generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// The Home bloc.
  late final HomeBloc _bloc;

  /// To pre-cache the background image.
  late final ImageProvider _backgroundImage;

  @override
  void initState() {
    _bloc = DependencyInjector().accessLazy<HomeBloc>();
    _backgroundImage = const AssetImage(AssetConstants.background);
    // _bloc.add(FetchTimerEvent());

    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(_backgroundImage, context);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The divider.
    final Padding divider = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(":", style: context.text.displaySmall),
    );
    return Scaffold(
      body: Container(
        padding: PaddingConstants.px20,

        // The background image.
        decoration: BoxDecoration(
          image: DecorationImage(image: _backgroundImage, fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // The countdown.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      FlipCard(key: ValueKey<String>("day"), value: 0),
                      FrostedLabel(label: "Days(s)"),
                    ],
                  ),
                  divider,
                  const Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      FlipCard(key: ValueKey<String>("hour"), value: 0),
                      FrostedLabel(label: "Hour(s)"),
                    ],
                  ),
                  divider,
                  const Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      FlipCard(key: ValueKey<String>("minute"), value: 0),
                      FrostedLabel(label: "Min(s)"),
                    ],
                  ),
                ],
              ),
              const RootGap(60.0),

              // Go to schedule.
              RootFrostedCard(
                child: ListTile(
                  title: Text(S.of(context).schedule),
                  subtitle: Text(S.of(context).tapToViewTheFullEventTimeline),
                  trailing: IconConstants.arrowRight,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const SchedulePage();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
