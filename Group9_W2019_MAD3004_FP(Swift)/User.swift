//
//  User.swift
//  Group9_W2019_MAD3004_FP(Swift)
//
//  Created by MacStudent on 2019-02-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class User{
    var userId:String
    var password:String
    var loginStatus:String
    /*var getuserId:String{
        get{
            return userId
        }
    }*/
    init(){
        self.userId=String()
        self.password=String()
        self.loginStatus=String()
    }
    init(uId:String,pass:String,lstatus:String)throws{
        self.userId=uId
        if (!pass.isValidPassword()){
            throw errors.invalidPassword
        }
        self.password=pass
        self.loginStatus=lstatus
    }
    func verifyLogin(usId:String , pass:String) -> Bool{
        if(self.userId == usId && self.password == pass){
            return true
        }
        else{
            return false
        }
    }
}
