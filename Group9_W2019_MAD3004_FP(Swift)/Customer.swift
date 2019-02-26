//
//  Customer.swift
//  Group9_W2019_MAD3004_FP(Swift)
//
//  Created by MacStudent on 2019-02-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
/*var varname:datatype{
    get{
    return xxx
    }
    set{
    exec code
    }
 }*/
class Customer : User,IDisplay{
    var customerName:String
    var address:String
    var email:String
    var creditCardInfo:String
    var shippingInfo:String
    var o = [Orders]()              //array of Orders              //Orders()
    var sc = [ShoppingCart]()      //array of ShoppingCart        //ShoppingCart()
    override init(){
        self.customerName=String()
        self.address=String()
        self.email=String()
        self.creditCardInfo=String()
        self.shippingInfo=String()
        super.init()
    }
    init(uId:String,pass:String,lstatus:String,cName:String,address:String,email:String,creditcInfo:String,shipInfo:String){
        self.customerName=cName
        self.address=address
        self.email=email
        self.creditCardInfo=creditcInfo
        self.shippingInfo=shipInfo
        super.init(uId: uId, pass: pass, lstatus: lstatus)
    }
    func register(){
        var ch=0
        repeat{
            print("Enter id")
            let uId=readLine()!
            if(!uId.isSimilarId()){
                self.userId=uId
            }
            else{
                print("User id exists")
                continue
            }
            print("Enter password(at least one uppercase,one digit,one lowercase,8 characters")
            let pass=readLine()!
            if(pass.isValidPassword()){
                self.password=pass
            }
            else{
                print("Password is invalid")
                continue
            }
            print("Enter email")
            let email=readLine()!
            if(email.isValidEmail()){
                self.email=email
            }
            else{
                print("Invalid email")
                continue
            }
            print("press 1 to continue")
            ch=Int(readLine()!)!
        }while(ch == 0)
        print("Enter customer name")
        self.customerName=readLine()!
        print("Enter address")
        self.address=readLine()!
    }
    func login(uId:String,pass:String){
        if(super.verifyLogin(usId: uId, pass: pass)){
            print("Login successful")
        }
        else{
            print("Login failed")
        }
    }
    func updateProfile(){
        
    }
    func checkOut(){
        let date=Date()
        let sdate=Date.init(timeIntervalSinceNow: 5*86400)
        let currdate=date.formatDate()
        let shipdate=sdate.formatDate()
        print("Select shipping type1.Domestic 2.International")
        let choice=Int(readLine()!)!
        var shipCost:Int
        var shipType:String
        if(choice == 1){
            shipCost=5
            shipType="Domestic"
        }
        else{
            shipCost=15
            shipType="International"
        }
        print("Select region/province\n1.Ontario\n2.British Columbia\n3.Quebec\n4.Alberta")
        let regchoice=Int(readLine()!)!
        print("press 1 to confirm your order")
        let confirm=Int(readLine()!)!
        if(confirm == 1){
            let or=Orders()
            //or.placeOrder()
            or.placeOrder(currDate: currdate, shipDate: shipdate, custName: self.customerName, shipType: shipType, shipCost: shipCost, regionId: regchoice, cartObj: sc)
            o.append(or)
        }
    }
    func display() -> String {
        let retString = "Name: \(self.customerName)\nAddress: \(self.address)\nEmail: \(self.email)\nCredit cardInfo: \(self.creditCardInfo)\nShipping info: \(self.shippingInfo)"
        return retString
    }
}
