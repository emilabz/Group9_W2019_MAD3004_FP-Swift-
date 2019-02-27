//
//  OrderDetails.swift
//  Group9_W2019_MAD3004_FP(Swift)
//
//  Created by MacStudent on 2019-02-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class OrderDetails:IDisplay{
    var orderId:Int
    var productId:Int
    var productName:String
    var quantity:Int
    var unitCost:Float
    var subtotal:Float
    init(){
        self.orderId=0
        self.productId=0
        self.productName=String()
        self.quantity=0
        self.unitCost=0.0
        self.subtotal=0.0
    }
    //init(cartObj:[ShoppingCart],orderId:Int)
    //{
    //    self.orderId=orderId
    //    self.productId=ca
    //}
    func calcPrice(){
        self.subtotal=prod(ucost:self.unitCost,q:self.quantity);
    }
    func prod(ucost:Float,q:Int)->Float{
        let qu=(Float)(q)
        return (ucost * qu)
    }
    func display() -> String {
        let retString=""
        return retString
    }
}
