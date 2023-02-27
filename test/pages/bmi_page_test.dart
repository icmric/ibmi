import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi/pages/bmi_page.dart';

void main() {
  testWidgets(
      'Given WeightInfoCard When user clicks + button Then weight increment by 1',
      (tester) async {
    //Arrange
    tester.pumpWidget(
      CupertinoApp(
        home: BMIPage(),
      ),
    );
    var _weightIncrementButton = find.byKey(Key('weight_plus'));
    //Act
    await tester.tap(_weightIncrementButton);
    await tester.pump();
    //Assert
  });
}
