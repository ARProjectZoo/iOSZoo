

import UIKit
import Alamofire
class ChangePassViewController: UIViewController {

    @IBOutlet weak var newPasswordTF: UITextField!
    @IBOutlet weak var repeatNewPasswordTF: UITextField!
    var URLprincipal = "http://localhost:8888/APIZOORODRIGO/API3/fuelphp/public/"
    
    /*@IBAction func sendToNewPass(_ sender: UIButton)
    {
        
    }*/
   
    @IBAction func sendToForgot(_ sender: UIButton)
    {
        let newPassword = newPasswordTF.text
        let repeatPassword = repeatNewPasswordTF.text
        
            
        if( newPassword == "" || repeatPassword == ""){
            //showAlert(message: "All fields have to be filled")
            return
        }
        if(newPassword != repeatPassword)
        {
            //showAlert(message: "Password do not match")
            return
        }
        
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        //Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        //If needed, yo can prevent activity Idicantor from hiing ehen stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = false
        
        //Start Activity Indicator
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
        let parameters : Parameters = [
            "newPassword" : newPasswordTF.text!
            ]
         ZooRequest(view: self, myActivityIndicator: myActivityIndicator).changePassword(parameters: parameters)
        //Send HTTP Request to Register user
//        let myUrl = URL(string:"http://localhost:8888/APIBUENA/API3/public/Users/changePassword.json")
//        var request = URLRequest(url:myUrl!)
//        request.httpMethod = "POST"//compose a query string
//        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
//        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Accept")
//        request.addValue("Authorization", forHTTPHeaderField: UserDefaults.standard.string(forKey: "token")!)
//
//        let postString = "newPassword="+newPasswordTF.text!
//
//        request.httpBody = postString.data(using: .utf8)
//
//        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
//
//            removeActivityIndicator(activityIndicator: myActivityIndicator)
//
//            if error != nil
//            {
//               //showAlert(message: "Could not successfully perform this request. Please try again later")
//
//                print("error=\(String(describing: error))")
//            }
//
//            // RESPONSE sent from a server side code to NSDictionary object:
//            do{
//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
//
//                if let parseJSON = json {
//                    print(parseJSON)
//                    print(UserDefaults.standard.string(forKey: "token")!)
////                    let code = parseJSON["code"] as! Int
////                    switch code {
////                    case let (code) where code == 200:
////                        print("contraseña cambiada")
////                        DispatchQueue.main.async {
////                            let storyboard: UIStoryboard =   UIStoryboard (name: "Main", bundle: nil)
////                            let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "mainAPP") as UIViewController
////                            self.present(vc ,animated: true, completion: nil )
////                        }
////                        //showAlert(message: "Contraseña cambiada")
////                        break
////                    case let (code) where code == 400:
////                        print("Please try again")
////                        break
////                    default :
////                        print("Please try again")
////                        break
////                    }
//
//                }
//            }catch{
//                removeActivityIndicator(activityIndicator: myActivityIndicator)
//                //showAlert(message: "Please try again")
//                print(error)
//            }
//        }
//        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
