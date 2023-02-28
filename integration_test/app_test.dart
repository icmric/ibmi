import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ibmi/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    'end-to-end app test',
    () {
      var _weightIncrementButton = find.byKey(
        const Key('weight_plus'),
      );
      var _ageIncrementButton = find.byKey(
       const Key('age_plus'),
      );
      var _calculateBMIButton = find.byType(CupertinoButton);

      testWidgets(
        'Given app is run When height, age data input and caluclateBMI button pressed Then correct BMI return',
        (tester) async {
          //Arrange
          app.main();
          //Act
          await tester.pumpAndSettle();
          await tester.tap(_weightIncrementButton);
          await tester.pumpAndSettle();
          await tester.tap(_ageIncrementButton);
          await tester.pumpAndSettle();
          await tester.tap(_calculateBMIButton);
          await tester.pumpAndSettle();
          final _resultText = find.text('Normal');
          //Assert
          expect(_resultText, findsOneWidget);
        },
      );
    },
  );
}
