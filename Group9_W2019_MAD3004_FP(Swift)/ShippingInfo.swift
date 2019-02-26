//
//  ShippingInfo.swift
//  Group9_W2019_MAD3004_FP(Swift)
//
//  Created by MacStudent on 2019-02-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
import Darwin
class ShippingInfo:IDisplay{
    var shippingId:Int
    var shippingType:String
    var shippingCost:Int
    var shippingRegionId:Int
    var getId:Int{
        get{
            return shippingId
        }
    }
    init()
    {
        self.shippingId=0
        self.shippingType=String()
        self.shippingCost=0
        self.shippingRegionId=0
    }
    init(shipType:String,shipCost:Int,shipRegId:Int){
        self.shippingId=Int(arc4random())
        self.shippingType=shipType
        self.shippingRegionId=shipRegId
        self.shippingCost=shipCost
    }
    func updateShippingInfo(){
        print("Select option to change\n1.Shipping Type\n2.Shipping Region")
        let ch = Int(readLine()!)!
        switch(ch){
        case 1:
            print("Select shipping type1.Domestic 2.International")
            let choice=Int(readLine()!)!
            if(choice == 1){
                self.shippingCost=5
                self.shippingType="Domestic"
            }
            else{
                self.shippingCost=15
                self.shippingType="International"
            }
        case 2:
            print("Select region/province\n1.Ontario\n2.British Columbia\n3.Quebec\n4.Alberta")
            self.shippingRegionId=Int(readLine()!)!
        default: print("Invalid choice")
        }
    }
    func display() -> String {
        let retString = "Id: \(self.shippingRegionId)\nType: \(self.shippingType)\nShipping region ID: \(self.shippingRegionId)\nShipping cost: \(self.shippingCost)"
        return retString
    }
}
