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
    func updateCatalog(prodId:Int,quantity:Int) -> Bool{
        for i in p{
            if(i.getproductID == prodId){
                i.productQuantity=quantity
                return true
            }
        }
        return false
    }
    func updateCatalog(prodID:Int,prodName:String,price:Float,quantity:Int) -> Bool {
        for i in p{
            if(i.getproductID == prodID){
                return false
            }
        }
        p.append(Products(productId: prodID, productName: prodName, productQuantity: quantity, productPrice: price))
        return true
    }
}
