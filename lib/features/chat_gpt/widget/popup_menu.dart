// ignore_for_file: inference_failure_on_instance_creation

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openaimobile/features/chat_gpt/provider/prompt_provider.dart';
import 'package:openaimobile/features/chat_gpt/widget/history.dart';
import 'package:provider/provider.dart';
import 'package:pull_down_button/pull_down_button.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: null,
      child: _PopupMenu(
        builder: (_, showMenu) => CupertinoButton(
          onPressed: showMenu,
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.more_horiz,
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
      ),
    );
  }
}

class _PopupMenu extends StatelessWidget {
  const _PopupMenu({required this.builder});

  final PullDownMenuButtonBuilder builder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return PullDownButton(
      routeTheme: PullDownMenuRouteTheme(
        backgroundColor: theme.surfaceVariant,
      ),
      itemBuilder: (context) => [
        PullDownMenuItem(
          iconColor: theme.onInverseSurface,
          itemTheme: PullDownMenuItemTheme(
            textStyle: TextStyle(
              color: theme.onInverseSurface,
            ),
          ),
          onTap: () {
            context.read<PromptProvider>().newChat();
          },
          title: 'New chat',
          icon: CupertinoIcons.add,
        ),
        PullDownMenuItem(
          iconColor: theme.onInverseSurface,
          itemTheme: PullDownMenuItemTheme(
            textStyle: TextStyle(
              color: theme.onInverseSurface,
            ),
          ),
          title: 'History',
          onTap: () {
            _bottomModal(context);
          },
          icon: CupertinoIcons.clock,
        ),
      ],
      buttonBuilder: builder,
    );
  }

  void _bottomModal(BuildContext context) {
    Widget buildBottomSheet(
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset,
    ) {
      return Scaffold(
        body: HistoryScreen(controller: scrollController),
      );
    }

    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 1,
      context: context,
      builder: buildBottomSheet,
      anchors: [0, 0.5, 1],
      isSafeArea: true,
      bottomSheetColor: Theme.of(context).colorScheme.surfaceVariant,
    );
  }
}
