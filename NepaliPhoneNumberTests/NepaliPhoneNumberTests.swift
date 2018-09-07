//
//  NepaliPhoneNumberTests.swift
//  NepaliPhoneNumberTests
//
//  Created by Aashish Adhikari on 9/7/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import XCTest
@testable import NepaliPhoneNumber

class NepaliPhoneNumberTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    //MARk: Mobile Phone Testing
    
    func testForOneDigitNumbers(){
        let num1 = "X"
        let val1 = NepaliPhoneNumber.isValid(mobile: num1)
        XCTAssertFalse(val1)
    }
    
    func testForNineDigitNumbers(){
        
        // 1 digit number
        let num1 = "X"
        let val1 = NepaliPhoneNumber.isValid(mobile: num1)
        XCTAssertFalse(val1)
    }
    
    func testForElevenDigitNumbers(){
        // 11 digit number
        let num3 = "XXXXXXXXXXX"
        let val3 = NepaliPhoneNumber.isValid(mobile: num3)
        XCTAssertFalse(val3)
    }
    
    func testForTenDigitNumbersWithInvalidPrefix(){
        
        // 10 Digit number but no right prefix
        let num4 = "XXXXXXXXXX"
        let val4 = NepaliPhoneNumber.isValid(mobile: num4)
        XCTAssertFalse(val4)
        
    }
    
    func testForTenDigitNumbersWithOnevalidPrefix(){
        
        // 10 Digit number but no right prefix
        let num4 = "9XXXXXXXXX"
        let val4 = NepaliPhoneNumber.isValid(mobile: num4)
        XCTAssertFalse(val4)
        
    }
    
    func testIsValidNTCMobileNumber(){
        let phoneNumbers = [ "984xxxxxxx", "985xxxxxxx", "986xxxxxxx" ]
        for number in phoneNumbers{
            let value = NepaliPhoneNumber.isValid(mobile:number)
            XCTAssertTrue(value)
            
            if let detail = NepaliPhoneNumber.getTheNumberDetail(mobile: number){
                XCTAssertEqual(detail.typeOfNumber, .GsMNtc)
                XCTAssertEqual(detail.nameOfCompany, .ntc)
                
                XCTAssertEqual(detail.typeOfNumber.name, "GSM Namaste")
                XCTAssertEqual(detail.nameOfCompany.name, "NTC")
            }
        }
    }
    
    func testIsValidCDMASkYNTCMobileNumber(){
        let phoneNumbers = [ "974xxxxxxx", "975xxxxxxx" ]
        for number in phoneNumbers{
            let value = NepaliPhoneNumber.isValid(mobile:number)
            XCTAssertTrue(value)
            
            if let detail = NepaliPhoneNumber.getTheNumberDetail(mobile: number){
                XCTAssertEqual(detail.typeOfNumber, .CDMASkySimNTC)
                XCTAssertEqual(detail.nameOfCompany, .ntc)
            }
        }
    }
    
    func testIsValidNcellMobileNumber(){
        let phoneNumbers = [ "980xxxxxxx", "981xxxxxxx", "982xxxxxxx" ]
        for number in phoneNumbers{
            let value = NepaliPhoneNumber.isValid(mobile:number)
            XCTAssertTrue(value)
            
            if let detail = NepaliPhoneNumber.getTheNumberDetail(mobile: number){
                XCTAssertEqual(detail.typeOfNumber, .ncell)
                XCTAssertEqual(detail.nameOfCompany, .ncell)
            }
        }
    }
    
    func testIsValidSmartCellMobileNumber(){
        let phoneNumbers = [ "961xxxxxxx", "988xxxxxxx"]
        for number in phoneNumbers{
            let value = NepaliPhoneNumber.isValid(mobile:number)
            XCTAssertTrue(value)
            
            if let detail = NepaliPhoneNumber.getTheNumberDetail(mobile: number){
                XCTAssertEqual(detail.typeOfNumber, .GSMSmartCell)
                XCTAssertEqual(detail.nameOfCompany, .smartCell)
            }
        }
    }
    
    func testIsValidCDMAUTLMobileNumber(){
        let phoneNumbers = [ "972xxxxxxx" ]
        for number in phoneNumbers{
            let value = NepaliPhoneNumber.isValid(mobile:number)
            XCTAssertTrue(value)
            
            if let detail = NepaliPhoneNumber.getTheNumberDetail(mobile: number){
                XCTAssertEqual(detail.typeOfNumber, .CDMAUtl)
                XCTAssertEqual(detail.nameOfCompany, .utl)
            }
        }
    }
    
    func testIsValidHelloMobileNumber(){
        let phoneNumbers = [ "963xxxxxxx" ]
        for number in phoneNumbers{
            let value = NepaliPhoneNumber.isValid(mobile:number)
            XCTAssertTrue(value)
            
            if let detail = NepaliPhoneNumber.getTheNumberDetail(mobile: number){
                XCTAssertEqual(detail.typeOfNumber, .GSMHelloMobile)
                XCTAssertEqual(detail.nameOfCompany, .ntc)
            }
        }
    }
    
    func testFormattedMobileNumber(){
        let phoneNumber = "963XXXXXXX"
        let formattedNumber = NepaliPhoneNumber.formattedNumber(mobile: phoneNumber, formatter: "-")
        
        XCTAssertEqual(formattedNumber, "96-3XXX-XXXX")
        
        let phoneNumber2 = "984XXXXXXX"
        let formattedNumber2 = NepaliPhoneNumber.formattedNumber(mobile: phoneNumber2, formatter: " ")
        
        XCTAssertEqual(formattedNumber2, "98 4XXX XXXX")
    }
    
    // MARK: Landline Tesing
    func testForOneDigitLandlineNumber(){
        let phoneNumber = "X"
        let value = NepaliPhoneNumber.isValid(landLine: phoneNumber)
        XCTAssertFalse(value)
    }
    
    func testForSevenDigitLandlineNumber(){
        let phoneNumber = "XXXXXXX"
        let value = NepaliPhoneNumber.isValid(landLine: phoneNumber)
        XCTAssertFalse(value)
    }
    
    func testForNineDigitLandlineNumber(){
        let phoneNumber = "XXXXXXXXX"
        let value = NepaliPhoneNumber.isValid(landLine: phoneNumber)
        XCTAssertFalse(value)
    }
    
    func testForEightDigitLandlineNumberWithoutValidPrefix(){
        let phoneNumber = "XXXXXXXX"
        let value = NepaliPhoneNumber.isValid(landLine: phoneNumber)
        XCTAssertFalse(value)
    }
    
    func testForEightDigitLandlineNumberWithOneValidPrefix(){
        let phoneNumber = "1XXXXXXX"
        let value = NepaliPhoneNumber.isValid(landLine: phoneNumber)
        XCTAssertFalse(value)
    }
    
    func testForEightDigitLandlineNumberWithCorrectPrefix(){
        let phoneNumber = "14XXXXXX"
        let value = NepaliPhoneNumber.isValid(landLine: phoneNumber)
        XCTAssertTrue(value)
    }
    
    func testForEightDigitLandlineNumberWithCorrectPrefixSecond(){
        let phoneNumber = "614XXXXX"
        let value = NepaliPhoneNumber.isValid(landLine: phoneNumber)
        XCTAssertTrue(value)
    }
    
    func testForFormatedNumber(){
        let phoneNumber = "14XXXXXX"
        let formattedNumber = NepaliPhoneNumber.formattedNumber(landLine: phoneNumber, formatter: "-")

        XCTAssertEqual(formattedNumber, "1-4XXX-XXX")
    }
    
    func testForFormatedNumberSecond(){
        let phoneNumber = "614XXXXX"
        let formattedNumber = NepaliPhoneNumber.formattedNumber(landLine: phoneNumber, formatter: "-")
        XCTAssertEqual(formattedNumber, "61-4XX-XXX")
    }
    
    //Mark Phone [Both Landline and Mobile]
    func testForValidPhone(){
        let phoneNumber = "614XXXXX"
        let formattedNumber = NepaliPhoneNumber.isValid(phone: phoneNumber)
        XCTAssertTrue(formattedNumber)
        
        let phoneNumber2 = "984XXXXXXX"
        let formattedNumber2 = NepaliPhoneNumber.isValid(phone: phoneNumber2)
        XCTAssertTrue(formattedNumber2)
    }
    
    func testForFormatedPhoneNumber(){
        let phoneNumber = "614XXXXX"
        let formattedNumber = NepaliPhoneNumber.formattedNumber(phone: phoneNumber, formatter: "-")
        XCTAssertEqual(formattedNumber, "61-4XX-XXX")
        
        let phoneNumber2 = "984XXXXXXX"
        let formattedNumber2 = NepaliPhoneNumber.formattedNumber(phone: phoneNumber2, formatter: " ")
        XCTAssertEqual(formattedNumber2, "98 4XXX XXXX")
    }
}
























