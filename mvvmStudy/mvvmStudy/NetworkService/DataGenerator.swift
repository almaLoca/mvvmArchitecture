

import Foundation
import SwiftyJSON

class DataGenerator {
    
    
    //GET
    static func FetchStateDetailsMobile(handler : @escaping wsHandler){
        
        let url = APPURL.Routes.posts
        
        APIManager.requestGETURL(url, params: nil, isHeader: false , onSuccess: { (response) in
                
                handler(true, response)
                
            }, onFailure: {(error) in
                
                print(error as Any)
                
                handler(false, error as AnyObject)
            })

        }


    //GET QUERRY
    static func FetchComentsMobile(postID : String,handler : @escaping wsHandler){
        
        let url = APPURL.Routes.comments
        let param = ["postId":postID] as [String : AnyObject]
        
        APIManager.getWithQueryType(url, params: param, isHeader: false , onSuccess: { (response) in
                
                handler(true, response)
                
            }, onFailure: {(error) in
                
                print(error as Any)
                
                handler(false, error as AnyObject)
            })

        }
    
    
    //POST
    static func postComentsMobile(title : String,handler : @escaping wsHandler){
        
        let url = APPURL.Routes.comments
        let param = ["userId": 10,
        "id": 10,
        "title": title,
        "body": "test "] as [String : AnyObject]
        
        APIManager.resquestPOSTURL(url, params: param, isHeader: false , onSuccess: { (response) in
                
                handler(true, response)
                
            }, onFailure: {(error) in
                
                print(error as Any)
                
                handler(false, error as AnyObject)
            })

        }

    
    //POSTQUERRY
    static func postQuerryPrdcts(size : String,handler : @escaping wsHandler){
        
        let url = APPURL.Routes.FetchDeal
        let params =
        ["PageSize":size,"PageNum":"1"] as [String : AnyObject]
        
        APIManager.resquestPOSTURLWithQueryType(url, params: params, isHeader: false , onSuccess: { (response) in
                
                handler(true, response)
                
            }, onFailure: {(error) in
                
                print(error as Any)
                
                handler(false, error as AnyObject)
            })

        }
    
    //POST
    static func postLogin(handler : @escaping wsHandler){
        
        let url = APPURL.Routes.PasswordLogin
        let param = [
            "MobileNumber":"977123450",
                   "password": "della1234",
            "deviceId": "",
            "grant_type": "password",
            "login_type": "password",
            "pushToken": "sdfasf666",
            "OSType": "Android"
        ] as [String : AnyObject]
        
        APIManager.resquestPOSTURL(url, params: param, isHeader: false , onSuccess: { (response) in
                
                handler(true, response)
                
            }, onFailure: {(error) in
                
                print(error as Any)
                
                handler(false, error as AnyObject)
            })

        }
    
    //POST
    static func uploadIMG(image : UIImage ,  handler : @escaping wsHandler){
        
        let url = APPURL.Routes.insertmerchantdocumentforverification
        let param = ["businessName":"Jose",
        "businessEmail":"Test@gmail.com",
        "merchantCategory":"1",
        "merchantSubCategory":"1",
        "nameInBankAccount":"della joseph",
        "accountNumber":"01010017842254",
        "bankId":"1",
        "bankBranch":"1"] as [String : String]
        
        APIManager.requestUPLOADPOST(url, image: image, params: param, onSuccess: { (response) in
                
                handler(true, response)
                
            }, onFailure: {(error) in
                
                print(error as Any)
                
                handler(false, error as AnyObject)
            })

        }
}
