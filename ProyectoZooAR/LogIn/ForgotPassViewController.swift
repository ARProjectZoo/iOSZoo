

import UIKit
import Alamofire
class ForgotPassViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userEmailTF: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    var URLprincipal = "http://localhost:8888/APIZOOAR/API%20/fuelphp/public/"
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.customAspect()
        userEmailTF.customAspect()
    }
    override func viewWillAppear(_ animated: Bool) {
        userNameTF.customAspect()
    }
    @IBAction func ocultarTeclado(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
    @IBAction func check(_ sender: UIButton) {
        
        let userName = userNameTF.text;
        let userEmail = userEmailTF.text;
        let usedNameStored = UserDefaults.standard.string(forKey: "userName");
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        
        
        if((userName?.isEmpty)! || (userEmail?.isEmpty)!)
        {
            showAlert(message: "All fields are required", view : self )
            return;
        }
        
        if(usedNameStored == userName){
            if(userEmailStored == userEmail)
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
            "email" : userEmailTF.text!,
        ]
         ZooRequest(view: self, myActivityIndicator: myActivityIndicator).forgotPassword(parameters: parameters)
    }
}
