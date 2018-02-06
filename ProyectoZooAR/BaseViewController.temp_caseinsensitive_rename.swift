//
//  ViewController.swift
//  ReproductorMusicaJulio
//
//  Created by alumnos on 17/10/17.
//  Copyright © 2017 julio. All rights reserved.
//

import UIKit

class BaseViwController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    @IBAction func ocultarTeclado(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


