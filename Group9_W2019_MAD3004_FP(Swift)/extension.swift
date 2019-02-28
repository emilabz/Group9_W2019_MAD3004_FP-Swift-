//
//  extension.swift
//  Group9_W2019_MAD3004_FP(Swift)
//
//  Created by MacStudent on 2019-02-21.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

extension String{
    //https://stackoverflow.com/questions/26845307/generate-random-alphanumeric-string-in-swift
    func randomStringWithLength (len : Int) -> String {
        
        let letters : NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        var randomString : NSMutableString = NSMutableString(capacity: len)
        
        for i in 1...len {
            //(var i=0; i < len; i++){
            var length = UInt32 (letters.length)
            var rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.character(at: Int(rand)))
        }
        
        return String(randomString)
    }
    func isValidEmail() -> Bool
    {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
        
    func isValidPassword() -> Bool {
        //guard self != nil else { return false }
            
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: self)
    }
    func isSimilarId()  -> Bool
    {
        /*for i in c{
            if (self == i.userId){
                return true
            }
        }
        return false*/
        for key in custDict.keys{
            if(self == key){
                return true
            }
        }
        return false
    }
}
extension Date{
    func formatDate() -> String{
        let formatter=DateFormatter()
        formatter.dateFormat="dd-MM-yyyy"
        return formatter.string(from: self)
    }
}
    /*public func currency() -> String
    {
        return String.init(format: "$%0.2f", self)
    }*/
extension Int{
    func isToomuch(id:Int) -> Bool
    {
        for i in p{
            if i.productId == id{
                if self > i.productQuantity{
                    return true
                }
            }
        }
    return false
    }
}
