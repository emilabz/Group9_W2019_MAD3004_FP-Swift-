//
//  Orders.swift
//  Group9_W2019_MAD3004_FP(Swift)
//
//  Created by MacStudent on 2019-02-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class Orders : IDisplay{
    var orderId:Int
    var dateCreated:String
    var dateShipped:String
    var customerName:String
    var customerId:String
    var status:String
    var shippingId:String
    var si = [ShippingInfo]()   //ShippingInfo()
    var od = [OrderDetails]()//OrderDetails()
    init()
    {
        self.orderId=0
        self.dateCreated=String()
        self.dateShipped=String()
        self.customerName=String()
        self.customerId=String()
        self.status=String()
        self.shippingId=String()
    }
    func placeOrder(currDate:String, shipDate:String, custName:String, /*custId:String, shipId:Int,*/ shipType:String, shipCost:Int, regionId:Int, cartObj:[ShoppingCart]){
        si.append(ShippingInfo(shipType: shipType, shipCost: shipCost, shipRegId: regionId))
        self.orderId=Int(arc4random())
        self.dateCreated=currDate
        self.dateShipped=shipDate
        self.customerName=custName
        self.customerId=self.customerId.randomStringWithLength(len: 5)
        self.status="Dispatched"
        self.shippingId=String(si[si.endIndex-1].getId)
        for i in cartObj{
            od.append(OrderDetails())
            od[od.endIndex-1].orderId=self.orderId
            od[od.endIndex-1].productId=i.productId
            od[od.endIndex-1].quantity=i.quantity
            for j in p{
                if(i.productId == j.productId){
                    od[od.endIndex-1].productName=j.productName
                    od[od.endIndex-1].unitCost=j.productPrice
                }
            }
            //orderId,productId,productName,quantity,unitcost,subtotal
            od[od.endIndex-1].calcPrice()
        }
        print("order placed successfully.Your id is \(self.orderId)")
        print("OrderId\t\tDate Created\t\tDate shipped\t\tCustomerName\t\tCustomer Id\t\tStatus\t\tShipping Id")
        print(display())
        //od.append(OrderDetails(cartObj: cartObj, orderId: self.orderId))
    }
    func display() -> String {
        let dispString = "\(self.orderId)\t\t\(self.dateCreated)\t\t\(self.dateShipped)\t\t\(self.customerName)\t\t\(self.customerId)\t\t\(self.status)\t\t\(self.shippingId)"
       /* print("\tProduct Id\t   ProductName\t   Price\t Quantity\t  Subtotal")
        var total:Float=0
        for i in od{
            total += i.subtotal
            print(i.display())
        }
        print("\t\t\tTotal:\(total)")*/
        return dispString
    }
}
