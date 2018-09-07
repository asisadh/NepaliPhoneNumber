//
//  NepaliPhoneNumber.swift
//  NepaliPhoneNumber
//
//  Created by Aashish Adhikari on 9/7/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation

public enum TypeOfNumber: String{
    case GsMNtc
    case CDMASkySimNTC
    case ncell
    case GSMSmartCell
    case CDMAUtl
    case GSMHelloMobile
    
    var name: String{
        switch self {
            
        case .GsMNtc:
            return "GSM Namaste"
        case .CDMASkySimNTC:
            return "CDMA Sky"
        case .ncell:
            return "GCM NCell"
        case .GSMSmartCell:
            return "GSM Smart Cell"
        case .CDMAUtl:
            return "CDMA UTL"
        case .GSMHelloMobile:
            return "GSM Hello Mobile / Nepal Satellite Telecom"
        }
    }
}

public enum TypeOfCompany: String{
    case ntc
    case ncell
    case smartCell
    case utl
    
    var name: String{
        switch self{
            
        case .ntc:
            return "NTC"
        case .ncell:
            return "NCELL"
        case .smartCell:
            return "Smart Cell"
        case .utl:
            return "UTL"
        }
    }
}

public class NepaliPhoneNumber{
    
    //MARK: isValid PhoneNumber [both mobile and Landline]
    public static func isValid(phone number: String) -> Bool{
        return isValid(mobile: number) || isValid(landLine: number)
    }
    
    public static func formattedNumber(phone number: String, formatter: Character) -> String?{
        if isValid(landLine: number){
            return formattedNumber(landLine: number, formatter: formatter)
        }
        else if isValid(mobile: number){
            return formattedNumber(mobile: number, formatter: formatter)
        }
        return nil
    }
    
    //MARK: isValid Mobile Number
    public static func isValid(mobile number: String) -> Bool{
        
        if number.count != 10 {
            return false
        }
        
        let code =  String(number.prefix(3))
        let phoneType = getTheTypeOfMobile(prefix: code)
        return phoneType.status
    }
    
    //MARK: Get the Type of Mobile Number and Company Name in enum
    public static func getTheNumberDetail(mobile number: String) -> (typeOfNumber:  TypeOfNumber, nameOfCompany: TypeOfCompany)? {
        if isValid(mobile: number){
            let code =  String(number.prefix(3))
            let phoneType = getTheTypeOfMobile(prefix: code)
            if let typeOfNumber = phoneType.typeOfNumber,
                let nameOfCompany = phoneType.nameOfCompany{
                return ( typeOfNumber, nameOfCompany )
            }
            return nil
        }
        return nil
    }
    
    //Mark: Format Mobile Number
    public static func formattedNumber(mobile number: String, formatter: Character) -> String?{
        if isValid(mobile: number){
            var formattedNumber = number
            var index = 2
            formattedNumber.insert(
                formatter, at:
                formattedNumber.index(formattedNumber.startIndex, offsetBy: index)
            )
            
            index = 7
            formattedNumber.insert(
                formatter, at:
                formattedNumber.index(formattedNumber.startIndex, offsetBy: index)
            )
            
            return formattedNumber
        }
        return nil
    }
    
    private static func getTheTypeOfMobile(prefix: String) -> (status: Bool, typeOfNumber:  TypeOfNumber?, nameOfCompany: TypeOfCompany?) {
        switch prefix {
        case "984", "985", "986":
            return (true, .GsMNtc, .ntc)
        case "974", "975":
            return (true, .CDMASkySimNTC, .ntc)
        case "980", "981", "982":
            return (true, .ncell, .ncell)
        case "961", "988":
            return (true, .GSMSmartCell, .smartCell)
        case "972":
            return (true, .CDMAUtl, .utl)
        case "963":
            return (true, .GSMHelloMobile, .ntc)
            
        default:
            return (false, nil, nil)
        }
    }
    
    public static func isValid(landLine number:String) -> Bool{
        if number.count != 8 {
            return false
        }
        return isValidKathmandu(landLine:number) || isValidOtherArea(landline:number)
    }
    
    private static func isValidKathmandu(landLine number: String) -> Bool{
        let code =  String(number.prefix(2))
        let value = getKtmPrefix(prefix: code)
        return value
    }
    
    private static func getKtmPrefix(prefix: String) -> Bool {
        switch prefix {
        case "14", "15", "16":
            return true
        default:
            return false
        }
    }
    
    private static func isValidOtherArea(landline number: String) -> Bool {
        let code = String(number.prefix(3))
        let value = getOtherAreaPrefix(prefix: code)
        return value
    }
    
    private static func getOtherAreaPrefix(prefix: String) -> Bool{
        var value: Bool = false
        
        let char = Array(prefix)
        
        if let first = Int(String(char[0])){
            if first > 0 && first <= 9{
                value = true
            }else{
                value = false
            }
        }else{
             value = false
        }
        
        if let second = Int(String(char[1])){
            if second >= 0 && second <= 9{
                value = true
            }else{
                value = false
            }
        }else{
             value = false
        }
        
        if let third = Int(String(char[2])){
            if third == 4 || third == 5 || third == 6{
                value = true
            }else{
                value = false
            }
        }else{
             value = false
        }
        
        return value
    }
    
    public static func formattedNumber(landLine number: String, formatter: Character) -> String? {
        if isValidKathmandu(landLine: number){
            return formattedNumberKtm(landline: number, formatter: formatter)
        }else if isValidOtherArea(landline: number){
            return formattedNumberOther(landline: number, formatter:formatter)
        }
        return nil
    }
    
    private static func formattedNumberKtm(landline number: String, formatter: Character) -> String{
        var formattedNumber = number
        var index = 1
        formattedNumber.insert(
            formatter, at:
            formattedNumber.index(formattedNumber.startIndex, offsetBy: index)
        )
        
        index = 6
        formattedNumber.insert(
            formatter, at:
            formattedNumber.index(formattedNumber.startIndex, offsetBy: index)
        )
        
        return formattedNumber
    }
    
    private static func formattedNumberOther(landline number: String, formatter: Character) -> String{
        var formattedNumber = number
        var index = 2
        formattedNumber.insert(
            formatter, at:
            formattedNumber.index(formattedNumber.startIndex, offsetBy: index)
        )
        
        index = 6
        formattedNumber.insert(
            formatter, at:
            formattedNumber.index(formattedNumber.startIndex, offsetBy: index)
        )
        
        return formattedNumber
    }
}


//97
//
//
//
//77
//
//68
//
//
//11
//
//84
//
//69
//
//66
//
//23
//
//71
//
//91
//
//
//
//56
//
//71
//
//78
//
//57
//
//29
//
//10
//
//21
//
//51
//
//23
//
//71
//
//49
//
//71
//
//96
//
//23
//
//65
//
//82
//
//93
//
//10
//
//91
//
//26
//
//25
//
//94
//
//99
//
//94
//
//25
//
//35
//
//55
//
//82
//
//64
//
//84
//
//79
//
//57
//
//27
//
//25
//
//21
//
//44
//
//41
//
//53
//
//35
//
//
//
//29
//
//36
//
//67
//
//76
//
//33
//
//
//71
//
//66
//
//99
//
//46
//
//69
//
//78
//
//81
//
//37
//
//75
//
//24
//
//78
//
//
//24
//
//61
//
//31
//
//84
//
//48
//
//21
//
//10
//
//77
//
//29
//
//53
//
//47
//
//33
//
//83
//
//63
//
//56
//
//75
//
//24
//
//76
//
//26
//
//91
//
//78
//
//10
//
//82
//
//35
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//












