//
//  appTools.swift
//  ReproductorMusicaJulio
//
//  Created by alumnos on 17/1/18.
//  Copyright © 2018 julio. All rights reserved.
//

import Foundation
import UIKit
let URLprincipal = "http://localhost:8888/APIZOOAR/API%20/fuelphp/public/"
var userLogged : User!
var fondoString = String(data: #imageLiteral(resourceName: "fondo2") as! Data, encoding: String.Encoding.utf8)
var arrayStoriesUser : [Story] = [Story()]
extension UITextField {
    func customAspect(){
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.init(red:0.13, green:0.55, blue:0.13, alpha:1.0).cgColor

    }
}


