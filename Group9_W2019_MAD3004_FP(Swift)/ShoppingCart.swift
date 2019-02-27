//
//  ShoppingCart.swift
//  Group9_W2019_MAD3004_FP(Swift)
//
//  Created by MacStudent on 2019-02-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class ShoppingCart{
    var cartId:Int
    var productId:Int
    var quantity:Int
    var dateAdded:String
    init(){
        self.cartId=0
        self.productId=0
        self.quantity=0
        self.dateAdded=String()
    }
    func addCartItem(cartId:Int,productId:Int,quantity:Int,dateAdded:String){
        self.cartId=cartId
        self.productId=productId
        self.quantity=quantity
        self.dateAdded=dateAdded
        print("Item added")
        viewCartDetails()
    }
    func updateQuantity()
    {
        print("Enter new quantity")
        self.quantity=Int(readLine()!)! //https://blog.faodailtechnology.com/reading-standard-input-stdin-in-swift-45f81b3caf2c //Int(readLine(strippingNewline: true)!)!
    }
    func viewCartDetails(){
        print("Item No.\t\tItem Name\t\tQuantity\t  Date Added")
        for i in p{
            if(self.productId == i.productId){
                print("\t\(self.productId)\t    \(i.productName)\t    \(self.quantity)\t       \(self.dateAdded)")
            }
        }
        
    }
    //func checkOut(){
        
        //c1.o.placeOrder(c1.customerName) //array of orderdetails under orders and checkout in customer with array of shoppingcart
    //}
}
