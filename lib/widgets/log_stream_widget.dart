import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pont/utils/logs/log.dart';

class LogStreamWidget extends StatefulWidget {
  const LogStreamWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LogStreamWidget> createState() => _LogStreamWidgetState();
}

class _LogStreamWidgetState extends State<LogStreamWidget> {
  late final StreamSubscription _subscription;
  final _logs = <LogItem>[];

  @override
  void initState() {
    super.initState();
    _subscription = Log.logStream.listen(_onNewLogItem);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: _separatorBuilder,
      scrollDirection: Axis.vertical,
      itemBuilder: _itemBuilder,
      itemCount: _logs.length,
    );
  }

  Divider _separatorBuilder(BuildContext context, int index) {
    return const Divider(color: Colors.grey);
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final logItem = _logs[index];
    final Color color;
    switch (logItem.level) {
      case LogLevel.e:
        color = Colors.red;
        break;
      case LogLevel.w:
        color = Colors.yellow;
        break;
      default:
        color = Colors.black;
        break;
    }
    return _logTile(logItem: logItem, color: color);
  }

  Widget _logTile({required LogItem logItem, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      child: Text(logItem.toString()),
    );
  }

  void _onNewLogItem(LogItem logItem) {
    setState(() {
      _logs.insert(0, logItem);
    });
  }
}
