import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi/utils/calculator.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  test(
      'Give height and Weight When calculateBMI function invoced then correct BMI retured',
      () {
    //arrange
    const int height = 70, weight = 160;
    //act
    double bmi = calculateBMI(height, weight);
    //assert
    expect(bmi, 22.955102040816328);
  });

  test('Given url When calculateBMIasync invoked Then correct BMI', () async {
    //Arrange
    final _dioMock = DioMock();
    when(() => _dioMock.get('https://www.jsonkeeper.com/b/AKFA')).thenAnswer(
      (_) => Future.value(
        Response(
          requestOptions:
              RequestOptions(path: 'https://www.jsonkeeper.com/b/AKFA'),
          data: {
            "Sergio Ramos": [72, 165]
          },
        ),
      ),
    );
    //Act
    var _result = await calculateBMIAcync(_dioMock);
    //Assert
    expect(_result, 22.375578703703706);
  });
}
