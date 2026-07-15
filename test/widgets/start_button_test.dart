import 'package:fl_clash/views/dashboard/widgets/start_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getStartButtonText', () {
    test('formats runtime text with day and remaining time', () {
      const duration = Duration(days: 5, minutes: 2, seconds: 27);

      expect(
        getStartButtonText(
          suspend: false,
          suspendedText: 'Suspended',
          runTime: duration.inMilliseconds,
        ),
        '5d 00:02:27',
      );
    });

    test('uses suspended text when suspended', () {
      expect(
        getStartButtonText(
          suspend: true,
          suspendedText: 'Suspended',
          runTime: Duration.millisecondsPerDay,
        ),
        'Suspended',
      );
    });
  });
}
