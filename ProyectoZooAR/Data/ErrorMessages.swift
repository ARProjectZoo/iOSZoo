
import Foundation
import UIKit


func removeActivityIndicator(activityIndicator: UIActivityIndicatorView)
{
    DispatchQueue.main.async {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
func showAlert(message : String, view : UIViewController){
    let alert = UIAlertController(title: "Error", message:
        message , preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style:
        .default, handler: nil))
    view.present(alert, animated: true, completion: nil)
}



func userRegisterAlert(message : String) -> UIAlertController{
    let alert = UIAlertController(title: "Thank you!", message:
        message, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style:
        .default, handler: nil))
    return alert
}

