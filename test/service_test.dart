import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_play_all/model/service.dart';

void main() {

//  Feature: Invoke RESTful APIs from Flutter
// Scenario: Client requests more than one instance of Service
//    Given I (client class) have to call one API request
//     When I (client class) ask to receive the Service's instance more than once
//     Then I (client class) should receive the same Service's instance  
  test('Should return only one instance of the class Service', (){
    
    // Setup
    Service service1;
    Service service2;

    // Exercise
    service1 = Service.instance;
    service2 = Service.instance;

    // Verify
    expect(service1, service2);

    // TearDown

  }

  );
}
