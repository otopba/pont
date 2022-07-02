import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/logs/logs_page_cubit.dart';
import 'package:pont/cubits/logs/logs_page_state.dart';
import 'package:pont/utils/animations.dart';
import 'package:pont/utils/logs/log.dart';

const _tag = 'logs_page';

class LogsPage extends StatefulWidget {
  static const routeName = '/logs';

  const LogsPage({Key? key}) : super(key: key);

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  late final _cubit = LogsPageCubit();
  late LogsPageState _state;

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogsPageCubit, LogsPageState>(
      bloc: _cubit,
      listener: (context, state) {},
      builder: (context, state) {
        _state = state;

        return Scaffold(
          body: _body(),
          floatingActionButton: _fab(),
        );
      },
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _filePicker(),
          _scrollBar(),
        ],
      ),
    );
  }

  Widget _scrollBar() {
    return Expanded(
      child: Scrollbar(
        child: _state.loading ? _loading() : _logsList(),
      ),
    );
  }

  Widget _filePicker() {
    return DropdownButton<String>(
      isExpanded: true,
      value: _state.selectedFile ?? "",
      style: const TextStyle(color: Colors.black),
      items: _state.logFiles.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: const Text(
        'Please choose a file ',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      onChanged: _fileChanged,
    );
  }

  Widget _fab() {
    return AnimatedOpacity(
      opacity: _state.loading ? 0.0 : 1.0,
      duration: Animations.duration,
      curve:
          _state.loading ? Animations.disappearCurve : Animations.appearCurve,
      child: FloatingActionButton(
        onPressed: _onSharePressed,
        child: const Icon(Icons.share),
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: SizedBox(
        width: 33,
        height: 33,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _logsList() {
    return ListView.separated(
      separatorBuilder: _separatorBuilder,
      scrollDirection: Axis.vertical,
      itemBuilder: _itemBuilder,
      itemCount: _state.logs.length,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
    );
  }

  Divider _separatorBuilder(BuildContext context, int index) {
    return const Divider(color: Colors.grey);
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final log = _state.logs[index];
    final Color color;
    if (log.startsWith(describeEnum(LogLevel.e).toUpperCase())) {
      color = Colors.red;
    } else if (log.startsWith(describeEnum(LogLevel.w).toUpperCase())) {
      color = Colors.yellow;
    } else {
      color = Colors.black;
    }
    return _logTile(text: log, color: color);
  }

  Widget _logTile({required String text, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      child: Text(text),
    );
  }

  void _onSharePressed() {
    Log.d(_tag, '_onSharePressed');

    _cubit.shareLogs();
  }

  void _fileChanged(String? file) {
    Log.d(_tag, '_fileChanged: file = $file');

    _cubit.selectFile(file);
  }
}
