import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class UpcomingEventsCard extends StatefulWidget {
  const UpcomingEventsCard({required this.eventNotifications, super.key});
  final List<AppNotification> eventNotifications;

  @override
  State<UpcomingEventsCard> createState() => _UpcomingEventsCardState();
}

class _UpcomingEventsCardState extends State<UpcomingEventsCard> {
  final _controller = CarouselController();
  late final Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (_) {
      _controller.animateToItem(
        _currentIndex < widget.eventNotifications.length - 1
            ? ++_currentIndex
            : _currentIndex = 0,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('💡 Upcoming Events'),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 50),
          child: CarouselView(
            controller: _controller,
            padding: EdgeInsets.zero,
            itemExtent: context.mediaQuery.size.width,
            // shrinkExtent: 5,
            children: List.generate(
              widget.eventNotifications.length,
              (index) =>
                  Card(child: Text(widget.eventNotifications[index].message)),
            ),
          ),
        ),
      ],
    );
  }
}
