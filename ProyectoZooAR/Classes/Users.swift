//
//  Users.swift
//  ReproductorMusicaJulio
//
//  Created by Kike on 18/1/18.
//  Copyright © 2018 julio. All rights reserved.
//

import Foundation

class Users{
    
    var userName: String
    var password: String
    
    init(json: [String: Any]) {
        userName = json["userName"] as? String ?? ""
        password = json["password"] as? String ?? ""
    }
}
