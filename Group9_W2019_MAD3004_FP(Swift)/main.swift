//
//  main.swift
//  Group9_W2019_MAD3004_FP(Swift)
//
//  Created by MacStudent on 2019-02-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
import Darwin
//print("Hello, World!")
var p=[Products]()
p.append(Products(productId: 1, productName: "Iphone XS Max 64GB", productQuantity: 10, productPrice: 1200.00))
p.append(Products(productId: 2, productName: "Samsung Note 9 64GB", productQuantity: 5, productPrice: 949.99))
var c1=Customer(uId: "user1", pass: "user1", lstatus: "C", cName: "UserA", address: "Qwerty1,aaaa,bbb,c", email: "user1@gmail.com", creditcInfo: "1231234545", shipInfo: "State1,Country1")
var c2=Customer()
var c=[Customer]()
c.append(c1)
//do{
print("Welcome to online shopping\nEnter choice\n1.Sign in\n2.Sign up\n3.Exit")
let ch=readLine()
switch(ch){
case "1":
    print("In login")
    //type of user needed
    c1.login(uId: "user1",pass: "user1")
    break

case "2":
    print("In signup")
    //c2.login(uId: "user1", pass: "user1")     //test code
    c2.register()
case "3":
    print("Exiting..")
    exit(0)
default:print("Enter valid choice")
}//while!(ch == "1"||ch == "2"||ch == "3");
print("Welcome User. Enter choice\n1.View items on sale\n2.Your cart\n3.Update cart\n4.Placed Orders\n5.Update shipping info")
let cho=readLine()
switch(cho){
case "1":   //view items from which orders are to be placed
    print("Products available\nItem No.\t\tItem Name\t\t  Item Price")
    for i in p{
        print("\t\(i.productId)\t   \(i.productName)\t\t\(i.productPrice)")
    }
    print("select a product to add to cart. if not press 0")
    let choice=Int(readLine()!)!
    if(choice != 0){
        print("Enter quantity")
        let q=Int(readLine()!)!
        //if(q<)        //accepting and checking quantity
        let date=Date()
        let formatter=DateFormatter()
        formatter.dateFormat="dd-MM-yyyy"
        let currdate=formatter.string(from: date)
        c1.sc.append(ShoppingCart())
        c1.sc[c1.sc.endIndex-1].addCartItem(cartId: 1, productId: choice, quantity: q, dateAdded: currdate)
        //print("added successfully")
        //ask for repeating orders. if thats done then checkout
        c1.checkOut()
    }
    
case "2":   //view items on sale
    if(c1.sc.isEmpty){
        print("Your cart is empty")
    }
    else{
        print("Your cart details are:")
        for i in c1.sc{
            i.viewCartDetails()
        }
    }
    
case "3":   //view cart
    print("Enter cart id")
    let cartId=Int(readLine()!)!
    for i in c1.sc{
        if(i.cartId == cartId){
            i.updateQuantity()
        }
    }
    
case "4":   //placed orders
    if(c1.o.isEmpty){
        print("Your order is empty")
    }
    else{
        print("Your orders are")
        for i in c1.o{
            print(i.display())
        }
    }
//case 5: //update shipping info
default:print("Enter valid choice")
}
