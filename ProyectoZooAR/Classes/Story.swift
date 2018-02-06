//
//  Stories.swift
//  ReproductorMusicaJulio
//
//  Created by Kike on 1/2/18.
//  Copyright © 2018 julio. All rights reserved.
//

import Foundation
import UIKit
class Story{
    var photo : String!
    var comment : String!
    var date : String!
    
    init(json : [String : Any]){
        self.photo = json["photo"] as! String
        self.comment = json["comment"] as! String
        self.date = json["date"] as! String
    }
    
    init(){
    }
    public func getPhoto() -> String{
        return self.photo
    }
    public func getComment()-> String{
    return self.comment
    }
    public func getDate()-> String{
    return self.date
    }
    
}
