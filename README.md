# Nepali Phone Number
[![Version](https://img.shields.io/cocoapods/v/NepaliPhoneNumber.svg?style=flat-square)](http://cocoapods.org/pods/NepaliPhoneNumber) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage) [![License](https://img.shields.io/cocoapods/l/NepaliPhoneNumber.svg?style=flat-square)](http://cocoapods.org/pods/NepaliPhoneNumber) [![Platform](https://img.shields.io/cocoapods/p/NepaliPhoneNumber.svg?style=flat-square)](http://cocoapods.org/pods/NepaliPhoneNumber)

## Overview
Nepali Phone Number is a simplified phone number formatter written in swift.
Look into project example to see it in action!

## Requirements
- Xcode 9.
- iOS 9 or higher.

## Installation
### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```ruby
pod 'NepaliPhoneNumber'
```

Then, run the following command:

```bash
$ pod install
```

## Usage

### Things you can do after installation

```
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
        
```


License
----
MIT


**Free Software, Hell Yeah!**
