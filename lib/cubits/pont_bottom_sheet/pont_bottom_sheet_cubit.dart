import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/pont_bottom_sheet/pont_bottom_sheet_state.dart';
import 'package:pont/data/client/client_pont.dart';
import 'package:pont/utils/logs/log.dart';

const _tag = 'pont_bottom_sheet_cubit';

class PontBottomSheetCubit extends Cubit<PontBottomSheetState> {
  PontBottomSheetCubit({required ClientPont pont})
      : super(
          PontBottomSheetState(
            (b) => b..pont = pont.toBuilder(),
          ),
        ) {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');
  }
}
