//
//  LoginViewController.swift
//  ReproductorMusicaJulio
//
//  Created by alumnos on 16/1/18.
//  Copyright © 2018 julio. All rights reserved.
//

import UIKit
import Alamofire
class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userPasswordTF: UITextField!
    var URLprincipal = "http://localhost:8888/APIZOOAR/API%20/fuelphp/public/"
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.customAspect()
        userPasswordTF.customAspect()
    }
    override func viewWillAppear(_ animated: Bool) {
        userNameTF.customAspect()
    }
    @IBAction func ocultarTeclado(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    @IBAction func forgot(_ sender: UIButton) {
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        let userName = userNameTF.text;
        let userPassword = userPasswordTF.text;
        let usedNameStored = UserDefaults.standard.string(forKey: "userName");
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
       
        
        if((userName?.isEmpty)! || (userPassword?.isEmpty)!)
        {
            showAlert(message: "All fields are required", view : self )
            return;
        }
        
        if(usedNameStored == userName){
            if(userPasswordStored == userPassword)
            {
                UserDefaults.standard.set(true, forKey:"isUserLoggedIn");
                UserDefaults.standard.synchronize();
                
                self.dismiss(animated: true, completion:nil);
            }
        }
        
        //Create Activity Indicator
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        //Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        //If needed, yo can prevent activity Idicantor from hiing ehen stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = false
        
        //Start Activity Indicator
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
        
        //ALAMOFIRE REQUEST
        let parameters : Parameters = [
            "userName" : userNameTF.text!,
            "password" : userPasswordTF.text!
        ]
        ZooRequest(view: self, myActivityIndicator: myActivityIndicator).logIn(parameters: parameters)
        //requestsToApi(typeOfRequest: "LogIn", parameters: parameters, view: self, myActivityIndicator : myActivityIndicator)
        
        //Send HTTP Request to Register user
//        let myUrl = URL(string:"http://localhost:8888/APIZOORODRIGO/API3/fuelphp/public/Users/login.json")
//        var request = URLRequest(url:myUrl!)
//        request.httpMethod = "POST"//compose a query string
//        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
//        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Accept")
//
//        let postString = "userName="+userNameTF.text!+"&password="+userPasswordTF.text!
//        request.httpBody = postString.data(using: .utf8)
        
//        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
//
//            removeActivityIndicator(activityIndicator: myActivityIndicator)
//
//            if error != nil
//            {
//                showAlert(message: "Could not successfully perform this request. Please try again later", view : self )
//                print("error=\(String(describing: error))")
//            }
//
//            // RESPONSE sent from a server side code to NSDictionary object:
//            do{
//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
//
//                if let parseJSON = json {
//
//                    let code = parseJSON["code"] as! Int
//                    print(code)
//                    switch code {
//                    case let (code) where code == 200:
//                        print("logIn Completo")
//                        print(parseJSON["token"] as! String)
//                        UserDefaults.standard.set(parseJSON["token"] as! String, forKey: "token")
//                        print("HOLAAA")
//                        print(parseJSON)
//                        print("HOLAAA")
//                        if(code == 200){
//                            DispatchQueue.main.async {
//                                let storyboard: UIStoryboard =   UIStoryboard (name: "Main", bundle: nil)
//                                let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "mainAPP") as UIViewController
//                                self.present(vc ,animated: true, completion: nil )
//                            }
//                        }
//                        break
//                    case let (code) where code == 400:
//                        print(parseJSON)
//                        print("Please try again")
//                        break
//                    default :
//                        print(parseJSON)
//                        print("Please try again")
//                        break
//                    }
//                }
//            }catch{
//                removeActivityIndicator(activityIndicator: myActivityIndicator)
//                showAlert(message: "Could not successfully perform this request. Please try again later", view : self )
//                print(error)
//            }
//        }
//        task.resume()
    }

    
}



