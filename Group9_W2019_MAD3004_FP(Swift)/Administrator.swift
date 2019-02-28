//
//  Administrator.swift
//  Group9_W2019_MAD3004_FP(Swift)
//
//  Created by MacStudent on 2019-02-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class Admininstrator : User{
    var adminName:String
    var email:String
    override init(){
        self.adminName=String()
        self.email=String()
        super.init()
    }
    init(userId:String,pass:String,adminName:String,email:String)throws{
        self.adminName=adminName
        if(!email.isValidEmail()){
            throw errors.invalidEmail
        }
        self.email=email
        try super.init(uId: userId, pass: pass, lstatus: "R")
    }
    func updateCatalog(prodId:Int,quantity:Int) -> Bool{
        for i in p{
            if(i.getproductId == prodId){
                i.productQuantity=quantity
                return true
            }
        }
        return false
    }
    func updateCatalog(prodID:Int,prodName:String,price:Float,quantity:Int) -> Bool {
        for i in p{
            if(i.getproductId == prodID){
                return false
            }
        }
        p.append(Products(productId: prodID, productName: prodName, productQuantity: quantity, productPrice: price))
        return true
    }
    func prodDisplay(){
        print("Product No.\t\tProduct Name\t\t  Item Price\t\t  Quantity")
        for i in p{
            print("\t\(i.getproductId)\t  \(i.getproductName)\t\t\(i.productPrice)\t\t\(i.productQuantity)")
        }
    }
}
