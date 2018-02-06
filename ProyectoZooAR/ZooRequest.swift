//
//  Requests.swift
//  ReproductorMusicaJulio
//
//  Created by Kike on 31/1/18.
//  Copyright © 2018 julio. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
let mainURL = "http://localhost:8888/ARAPI/public"
class ZooRequest {
    
    let view : UIViewController
    let myActivityIndicator : UIActivityIndicatorView
    let headers : HTTPHeaders
    init(view : UIViewController, myActivityIndicator : UIActivityIndicatorView) {
        let tokenSaved : String!
        if(UserDefaults.standard.string(forKey: "token") != nil){
            tokenSaved = UserDefaults.standard.string(forKey: "token")
        }else{
            tokenSaved = ""
        }
        self.headers = [
            
            "Authorization": tokenSaved,
            "Accept": "application/json"
        ]
        self.myActivityIndicator = myActivityIndicator
        self.view = view
    }
//func requestsToApi(typeOfRequest : String, parameters : Parameters, view : UIViewController, myActivityIndicator : UIActivityIndicatorView)
//{
//    var finalURL = mainURL
//    let headers: HTTPHeaders = [
//        "Authorization": UserDefaults.standard.string(forKey: "token")!,
//        "Accept": "application/json"
//    ]
//    switch(typeOfRequest){
//    case "LogIn":
//        finalURL += "/Users/login.json"
//        logIn(urlToAttack : finalURL, headers: headers, parameters: parameters, view: view, myActivityIndicator : myActivityIndicator)
//        break
//
//    case "Register":
//         finalURL += "/Users/register.json"
//         register(urlToAttack: finalURL, headers: headers, parameters: parameters, view: view, myActivityIndicator: myActivityIndicator)
//        break
//
//    case "ForgotPassword":
//        finalURL += "/Users/forgotPassword.json"
//        forgotPassword(urlToAttack: finalURL, headers: headers, parameters: parameters, view: view, myActivityIndicator: myActivityIndicator)
//        break
//
//    case "ChangePassword":
//        finalURL += "/Users/changePassword.json"
//        register(urlToAttack: finalURL, headers: headers, parameters: parameters, view: view, myActivityIndicator: myActivityIndicator)
//        break
//
//    case "InfoUser":
//        finalURL += "/Users/show.json"
//        register(urlToAttack: finalURL, headers: headers, parameters: parameters, view: view, myActivityIndicator: myActivityIndicator)
//        break
//
//    case "ShowStories":
//        finalURL += "/Stories/show.json"
//        register(urlToAttack: finalURL, headers: headers, parameters: parameters, view: view, myActivityIndicator: myActivityIndicator)
//        break
//
//    case "CreateStory":
//        finalURL += "/Stories/show.json"
//        register(urlToAttack: finalURL, headers: headers, parameters: parameters, view: view, myActivityIndicator: myActivityIndicator)
//        break
//
//    case "DeleteStory":
//        finalURL += "/Stories/delete.json"
//        register(urlToAttack: finalURL, headers: headers, parameters: parameters, view: view, myActivityIndicator: myActivityIndicator)
//        break
//    case "changeProfilePic":
//        finalURL += "/Users/changeImage.json"
//        register(urlToAttack: finalURL, headers: headers, parameters: parameters, view: view, myActivityIndicator: myActivityIndicator)
//        break
//    default:
//        break
//
//    }
//}

    public func logIn(parameters : Parameters){
        
        let urlRequest = mainURL + "/Users/login.json"
        
        Alamofire.request(urlRequest, method : .post, parameters : parameters, headers : self.headers).responseJSON { response in
            debugPrint(response)
            if let json = response.result.value {
                let data = Responses(json: (json as! NSDictionary) as! [String : Any])
                removeActivityIndicator(activityIndicator: self.myActivityIndicator)
                switch(data.code){
                case 200:
                    let recivedData = data.data as! NSDictionary
                     print(recivedData)
                    UserDefaults.standard.set(recivedData["token"] as! String, forKey: "token")
                     DispatchQueue.main.async {
                             let storyboard: UIStoryboard =   UIStoryboard (name: "Main", bundle: nil)
                             let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "mainAPP") as UIViewController
                             self.view.present(vc ,animated: true, completion: nil )
                         }
                    break
                case 400:
                    print("API ::: \(data.message)")
                    break
                default:
                    break
                }
               
            }
        }
    }
    public func register(parameters : Parameters){
        let urlRequest = mainURL + "/Users/register.json"
        Alamofire.request(urlRequest, method : .post, parameters : parameters, headers : self.headers).responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                let data = Responses(json: (json as! NSDictionary) as! [String : Any])
                removeActivityIndicator(activityIndicator: self.myActivityIndicator)
                switch(data.code){
                case 200:
                    let recivedData = data.data as! NSDictionary
                    print(recivedData)
                    DispatchQueue.main.async {
                        let storyboard: UIStoryboard =   UIStoryboard (name: "Main", bundle: nil)
                        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "mainLogIn") as UIViewController
                        self.view.present(vc ,animated: true, completion: nil )
                    }
                    break
                case 400:
                    print("API ::: \(data.message)")
                    break
                default:
                    break
                }
                
            }
        }
    }
    public func forgotPassword(parameters : Parameters){
        let urlRequest = mainURL + "/Users/forgotPassword.json"
        Alamofire.request(urlRequest, method : .post, parameters : parameters, headers : self.headers).responseJSON { response in
            debugPrint(response)
            if let json = response.result.value {
                let data = Responses(json: (json as! NSDictionary) as! [String : Any])
                removeActivityIndicator(activityIndicator: self.myActivityIndicator)
                switch(data.code){
                case 200:
                    let recivedData = (data.data as! Dictionary<String,Any>)
                    print(recivedData)
                    UserDefaults.standard.set(recivedData["token"] as! String, forKey: "token")
                    DispatchQueue.main.async {
                        let storyboard: UIStoryboard =   UIStoryboard (name: "Main", bundle: nil)
                        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "changePassword") as UIViewController
                        self.view.present(vc ,animated: true, completion: nil )
                        }
                    
                    break
                case 400...500:
                    print("API ::: \(data.message)")
                    break
                default:
                    break
                }
            }
        }
    }
    public func changePassword(parameters : Parameters){
        let urlRequest = mainURL + "/Users/changePassword.json"
        Alamofire.request(urlRequest, method : .post, parameters : parameters, headers : self.headers).responseJSON { response in
            debugPrint(response)
            if let json = response.result.value {
                let data = Responses(json: (json as! NSDictionary) as! [String : Any])
                removeActivityIndicator(activityIndicator: self.myActivityIndicator)
                switch(data.code){
                case 200:
                    let recivedData = data.data as! NSDictionary
                    print(recivedData)
                    DispatchQueue.main.async {
                         let storyboard: UIStoryboard =   UIStoryboard (name: "Main", bundle: nil)
                         let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "mainLogIn") as UIViewController
                         self.view.present(vc ,animated: true, completion: nil )
                    }
                    break
                case 400:
                    print("API ::: \(data.message)")
                    break
                default:
                    break
                }
                
            }
        }
    }
    public func infoUser(nameLabel : UILabel){
        let urlRequest = mainURL + "/Users/show.json"
        Alamofire.request(urlRequest, method : .get, headers : self.headers).responseJSON { response in
            debugPrint(response)
            if let json = response.result.value {
                let data = Responses(json: (json as! NSDictionary) as! [String : Any])
                removeActivityIndicator(activityIndicator: self.myActivityIndicator)
                switch(data.code){
                case 200:
                    let recivedData = data.data as! NSDictionary
                    userLogged = User(userName: recivedData["userName"] as! String)
                    let photoURL = recivedData["photo"]
                    nameLabel.text = userLogged.userName
                    if(photoURL != nil){
                        // Use Alamofire to download the image
                        Alamofire.request(photoURL as! URLRequestConvertible).responseData { (response) in
                            if response.error == nil {
                                print(response.result)
                                // Show the downloaded image:
                                if let data = response.data {
                                    print(data)
                                }
                            }
                        }
                    }else{
                        print("foto vacia por eso no se muestra")
                    }
                    break
                case 400:
                    print("API ::: \(data.message)")
                    break
                default:
                    break
                }
                
            }
        }
    }
    
    public func createStories(parameters : Parameters, selectedImage : UIImage){
        let urlRequest = mainURL + "/Stories/create.json"
        
        if let data = UIImageJPEGRepresentation(selectedImage,1) {
            // You can change your image name here, i use NSURL image and convert into string
            // User "authentication":
            
            // Use Alamofire to upload the image
            Alamofire.upload(
            multipartFormData: { multipartFormData in
                    // On the PHP side you can retrive the image using $_FILES["image"]["tmp_name"]
                
                    multipartFormData.append(data, withName: "photo")
                    
                    for (key, value) in parameters {
                            multipartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
                        }
            },
                    to: urlRequest,
                    method: .post,
                    headers : headers,
                    encodingCompletion: { encodingResult in
                        switch encodingResult {
                        case .success(let upload, _, _):
                            upload.responseJSON { response in
                                if let jsonResponse = response.result.value as? [String: Any] {
                                    print(jsonResponse)
                                }
                            }
                        case .failure(let encodingError):
                            print(encodingError)
                        }
                }
                )
            // Start Alamofire
            }
//        Alamofire.upload(multipartFormData: { multipartFormData in
//            multipartFormData.append(imgData, withName: "fileset",fileName: "file.jpg", mimeType: "image/jpg")
//            for (key, value) in parameters {
//                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//            }
//        },
//                         to:"mysite/upload.php")
//        { (result) in
//            switch result {
//            case .success(let upload, _, _):
//
//                upload.uploadProgress(closure: { (progress) in
//                    print("Upload Progress: \(progress.fractionCompleted)")
//                })
//
//                upload.responseJSON { response in
//                    print(response.result.value!)
//                }
//
//            case .failure(let encodingError):
//                print(encodingError)
//            }
//        Alamofire.request(urlRequest, method : .post, parameters : parameters, headers : self.headers).responseJSON { response in
//            debugPrint(response)
//            if let json = response.result.value {
//                let data = Responses(json: (json as! NSDictionary) as! [String : Any])
//                removeActivityIndicator(activityIndicator: self.myActivityIndicator)
//                switch(data.code){
//                case 200:
//                    let recivedData = data.data as! NSDictionary
//                    print(recivedData)
//                    DispatchQueue.main.async {
//                        let storyboard: UIStoryboard =   UIStoryboard (name: "Main", bundle: nil)
//                        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "mainAPP") as UIViewController
//                        self.view.present(vc ,animated: true, completion: nil )
//                    }
//                    break
//                case 400:
//                    print("API ::: \(data.message)")
//                    break
//                default:
//                    break
//                }
//            }
//        }
    }
    public func showStories(parameters : Parameters){
        let urlRequest = mainURL + "/Stories/show.json"
//        let imageUrl = mainURL + "/assets/img"
//        let image = UIImage.init(named: "myImage")
//        let imgData = UIImageJPEGRepresentation(image!, 0.2)!
        
        Alamofire.request(urlRequest, method : .get, parameters : parameters, headers : self.headers).responseJSON { response in
            debugPrint(response)
            if let json = response.result.value {
                let data = Responses(json: (json as! NSDictionary) as! [String : Any])
                removeActivityIndicator(activityIndicator: self.myActivityIndicator)
                switch(data.code){
                case 200:
                    let recivedData = data.data as! NSArray
                    if(recivedData.count > 1){
                        arrayStoriesUser = []
                        for story in recivedData{
                            arrayStoriesUser.append(Story(json : story as! [String:Any]))
                            print(arrayStoriesUser[0].photo)
                            print(arrayStoriesUser[0].date)
                            print(arrayStoriesUser[0].comment)
                        }
                    }
//                    if(photoURL != nil){
//                        // Use Alamofire to download the image
//                        Alamofire.request (photoURL as! URLRequestConvertible).responseData { (response) in
//                            if response.error == nil {
//                                print(response.result)
//                                // Show the downloaded image:
//                                if let data = response.data {
//                                    print(data)
//                                }
//                            }
//                        }
//                    }else{
//                        print("foto vacia por eso no se muestra")
//                    }
                    break
                case 400:
                    print("API ::: \(data.message)")
                    break
                default:
                    break
                }
            }
        }
    }
    private func deleteStories(parameters : Parameters){
        let urlRequest = mainURL + "/Users/register.json"
        Alamofire.request(urlRequest, method : .post, parameters : parameters, headers : self.headers).responseJSON { response in
            debugPrint(response)
            if let json = response.result.value {
                let data = Responses(json: (json as! NSDictionary) as! [String : Any])
                removeActivityIndicator(activityIndicator: self.myActivityIndicator)
                switch(data.code){
                case 200:
                    let recivedData = data.data as! NSDictionary
                    print(recivedData)
                    DispatchQueue.main.async {
                        let storyboard: UIStoryboard =   UIStoryboard (name: "Main", bundle: nil)
                        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "mainAPP") as UIViewController
                        self.view.present(vc ,animated: true, completion: nil )
                    }
                    break
                case 400:
                    print("API ::: \(data.message)")
                    break
                default:
                    break
                }
            }
        }
    }

    private func changeProfilePicture(parameters : Parameters){
        let urlRequest = mainURL + "/Users/register.json"
        Alamofire.request(urlRequest, method : .post, parameters : parameters, headers : self.headers).responseJSON { response in
            debugPrint(response)
            if let json = response.result.value {
                let data = Responses(json: (json as! NSDictionary) as! [String : Any])
                removeActivityIndicator(activityIndicator: self.myActivityIndicator)
                switch(data.code){
                case 200:
                    let recivedData = data.data as! NSDictionary
                    print(recivedData)
                    DispatchQueue.main.async {
                        let storyboard: UIStoryboard =   UIStoryboard (name: "Main", bundle: nil)
                        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "mainAPP") as UIViewController
                        self.view.present(vc ,animated: true, completion: nil )
                    }
                    break
                case 400:
                    print("API ::: \(data.message)")
                    break
                default:
                    break
                }
            }
        }
    }
    public func getImagesFromServer() -> [UIImage]{
        var arrayImages : [UIImage] = []
        print("ARRAY ::: \(arrayStoriesUser)")
        for story in arrayStoriesUser{
            print("STORY:::\(story.photo)")
            let url = URL(fileURLWithPath: "")
            
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: url)
                    arrayImages.append(UIImage(data: data)!)
                    DispatchQueue.main.async {
                        print(arrayImages)
                    }
                } catch {
                }
            }
        }
        return arrayImages
    }
}
