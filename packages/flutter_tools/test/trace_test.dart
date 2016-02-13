// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_tools/src/commands/trace.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'src/common.dart';
import 'src/context.dart';
import 'src/mocks.dart';

main() => defineTests();

defineTests() {
  group('trace', () {
    testUsingContext('returns 1 when no Android device is connected', () {
      TraceCommand command = new TraceCommand();
      applyMocksToCommand(command);
      MockDeviceStore mockDevices = command.devices;

      when(mockDevices.android.isConnected()).thenReturn(false);

      return createTestCommandRunner(command).run(['trace']).then((int code) {
        expect(code, equals(1));
      });
    });
  });
}
