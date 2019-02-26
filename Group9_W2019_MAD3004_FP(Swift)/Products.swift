//
//  Products.swift
//  Group9_W2019_MAD3004_FP(Swift)
//
//  Created by MacStudent on 2019-02-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class Products:IDisplay{
    var productId:Int
    /*{
        get{
            return productId
        }
        set(newId){
            productId=newId
        }
    }*/
    var getproductID:Int{
        get{
            return productId
        }
    }
    var productName:String
    /*{
        get{
            return productName
        }
        set(newName){
            productName=newName
        }
    }*/
    var productQuantity:Int
    /*{
        get{
            return productQuantity
        }
        set(newQuantity){
            productQuantity=newQuantity
        }
    }*/
    var productPrice:Float
    /*{
        get{
            return productPrice
        }
        set(newPrice){
            productPrice=newPrice
        }
    }*/
    init(){
        self.productId=0
        self.productName=String()
        self.productQuantity=0
        self.productPrice=0.0
    }
    init(productId:Int,productName:String,productQuantity:Int,productPrice:Float){
        self.productId=productId
        self.productName=productName
        self.productQuantity=productQuantity
        self.productPrice=productPrice
    }
    func display() -> String {
        let retString = "\t\(self.productId)\t  \(self.productName)\t\t\(self.productPrice)"
        return retString
    }
}
