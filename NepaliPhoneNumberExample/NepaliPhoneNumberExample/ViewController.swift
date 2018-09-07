//
//  ViewController.swift
//  NepaliPhoneNumberExample
//
//  Created by Aashish Adhikari on 9/7/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testNepaliPhoneNumberTest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func testNepaliPhoneNumberTest(){
        
        let aPhone = "9845045191"
        let bPhone = "9856022530"
        let cPhone = "9801031117"
        let dPhone = "9741151609"
        
        let aLandline = "14350994"
        let bLandline = "83551338"
        
        // For Phone
        // Check is valid Phone number or not
        print(NepaliPhoneNumber.isValid(phone: aPhone))
        print(NepaliPhoneNumber.isValid(phone: bPhone))
        print(NepaliPhoneNumber.isValid(phone: bLandline))
        
        // Print formatted String and can supply any formatter character
        // May be space or a hyphen
        // Your choice
        print(NepaliPhoneNumber.formattedNumber(phone: aPhone, formatter: " "))
        print(NepaliPhoneNumber.formattedNumber(phone: bLandline, formatter: " "))
        
        // For Mobile
        // Verify Mobile Number
        print(NepaliPhoneNumber.isValid(phone: cPhone))
        print(NepaliPhoneNumber.isValid(phone: dPhone))
        
        // Can fetch the Name of Company and Type of Sim from the given number.
        print(NepaliPhoneNumber.formattedNumber(mobile: cPhone, formatter: " "))
        print(NepaliPhoneNumber.getTheNumberDetail(mobile: cPhone)?.nameOfCompany.name)
        print(NepaliPhoneNumber.getTheNumberDetail(mobile: cPhone)?.typeOfNumber.name)
        print(NepaliPhoneNumber.getTheNumberDetail(mobile: dPhone)?.nameOfCompany.name)
        print(NepaliPhoneNumber.getTheNumberDetail(mobile: dPhone)?.typeOfNumber.name)
        
        // For Land Line
        // Area Code also needed to be passed to get verified.
        print(NepaliPhoneNumber.isValid(phone: aLandline))
        print(NepaliPhoneNumber.isValid(phone: bLandline))
        
        // Print formatted LandLine Number
        print(NepaliPhoneNumber.formattedNumber(landLine: aLandline, formatter: "-"))
        print(NepaliPhoneNumber.formattedNumber(landLine: bLandline, formatter: "-"))
        
    }

}

