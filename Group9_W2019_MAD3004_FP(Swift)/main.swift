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
var ch="0"
var cho="0"
var p=[Products]()
var c=[Customer]()
var tempObj:Customer?
var custDict:[String:Customer]=[:]
do{
p.append(Products(productId: 1, productName: "Iphone XS Max 64GB", productQuantity: 10, productPrice: 1200.00))
p.append(Products(productId: 2, productName: "Samsung Note 9 64GB", productQuantity: 5, productPrice: 949.99))
let c1=try Customer(uId: "user1", pass: "User1abc", lstatus: "C", cName: "UserA", address: "Qwerty1,aaaa,bbb,c", email: "user1@gmail.com", creditcInfo: "1231234545", shipInfo: "State1,Country1")
let a1=try Admininstrator(userId: "admin1", pass: "Admin1abc", adminName: "Admin-A", email: "admin1@gmail.com")
//var c2=Customer()

custDict.updateValue(c1, forKey: c1.userId)
//custDict.updateValue(, forKey: <#T##String#>)
//var cTemp=Customer()
c.append(c1)
repeat{
    print("**********************************\n****Welcome to online shopping****\n**********************************\nEnter choice\n1. Sign in\n2. Sign up\n3. Exit")
    ch=readLine()!
    switch(ch){
    case "1":
        print("In login\nEnter user ID")
        let userId=readLine()!
        print("Enter password")
        let password=readLine()!
        if custDict.keys.contains(userId){
            tempObj=custDict[userId]
            tempObj!.login(uId: userId, pass: password)
            print(tempObj!.display())
        }
        else{
            print("User doesnt exist")
            continue
        }
        //type of user needed
        //c1.login(uId: "user1",pass: "user1")
        break

    case "2":
        print("In signup")
        let cus=Customer()
        cus.register()
        custDict.updateValue(cus, forKey: cus.userId)
        c.append(cus)
        continue
        //c.append(Customer())
        //c[c.endIndex-1].register()
        
        //c2.login(uId: "user1", pass: "user1")     //test code
        //  c2.register()
    case "3":
        print("Exiting..")
        exit(0)
    default:print("Enter valid choice")
    }//while!(ch == "1"||ch == "2"||ch == "3");
    repeat{
        print("\n******************\n**Welcome User.***\n******************\nEnter choice\n1. View items on sale\n2. Your cart\n3. Update cart\n4. Placed Orders\n5. Update shipping info\n6. Your details\n7. Log Out")
        cho=readLine()!
        switch(cho){
        case "1":   //view items from which orders are to be placed
            print("Products available\nItem No.\t\tItem Name\t\t  Item Price")
            for i in p{
                print(i.display())
                //print("\t\(i.productId)\t   \(i.productName)\t\t\(i.productPrice)")
            }
            var ch:String=""
            var choice:Int
            repeat{
                print("select a product to add to cart. if not press 0")
                choice=Int(readLine()!)!
                if !(0...p.count).contains(choice){
                    throw errors.invalidChoice
                }
                //if(choice != 0){break}
                print("Enter quantity")
                let q=Int(readLine()!)!
                //if(q<)        //accepting and checking quantity
                if q.isToomuch(id: choice){
                    throw errors.quantityOverStock
                }
                let date=Date()
                let currdate=date.formatDate()
                let cartTemp=ShoppingCart()
                
                cartTemp.addCartItem(cartId: Int.random(in: 1...100), productId: choice, quantity: q, dateAdded: currdate)
                tempObj!.sc.append(cartTemp)
                //tempObj.sc.append(ShoppingCart())
                //c1.sc[c1.sc.endIndex-1].addCartItem(cartId: 1, productId: choice, quantity: q, dateAdded: currdate)
                //print("added successfully")
                //ask for repeating orders. if thats done then checkout
                print("Do you want to continue y/n?")
                ch=readLine()!
            }while(choice != 0 && ch == "y")
                    tempObj!.checkOut()
            
    
        case "2":   //view items on sale
            if(tempObj!.sc.isEmpty){
                print("Your cart is empty")
            }
            else{
                print("Your cart details are:")
                for i in tempObj!.sc{
                    i.viewCartDetails()
                }
            }
    
        case "3":   //view cart
            if(tempObj!.sc.isEmpty){
                print("Your cart is empty")
            }
            else{
                print("Enter cart id")
                let cartId=Int(readLine()!)!
                for i in tempObj!.sc{
                    if(i.cartId == cartId){
                        i.updateQuantity()
                    }
                }
            }
        
    
        case "4":   //placed orders
            if(tempObj!.o.isEmpty){
                print("Your order is empty")
            }
            else{
                print("Your orders are")
                for i in tempObj!.o{
                    var total:Float=0
                    print(i.display())
                    if(i.od.isEmpty){
                        print("Empty item details")
                    }
                    else{
                    for j in i.od{
                        total += j.subtotal
                        print(j.display())
                        }
                        print("\t\tTotal:\(total)")
                    }
                }
            }
        case "5":
            print("Enter shipping Id")
            let shipId=Int(readLine()!)!
            for i in tempObj!.o{                    //inside orders of the customer
                for j in i.si{                      //inside shipping infos of each order
                    if(shipId == j.getId){
                        j.updateShippingInfo()
                    }
                }
            }
        //update shipping info
        case "6": print(tempObj!.display())
        case "7":
            print("Signing out")
            
        default:
            print("Enter valid choice")
        }
    }while(cho != "7")
}while(ch != "3")
}catch errors.invalidPassword{
    print("Invalid password")
}
catch errors.quantityOverStock{
    print("Quantity over stock")
}
catch errors.invalidChoice{
    print("Invalid choice")
}
catch errors.invalidEmail{
    print("Invalid email")
}

