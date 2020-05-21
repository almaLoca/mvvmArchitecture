

import Foundation
import Alamofire
import SwiftyJSON

class APIManager: NSObject {

    class func requestGETURL(_ url: String, params: [String: AnyObject]?,isHeader: Bool, onSuccess success: @escaping success, onFailure failure: @escaping failure){
        

        let authToken = defaults.value(forKey: APPURL.userdefaultsConstants.accessToken) as? String
        var header: HTTPHeaders? = [:]
        if isHeader {
            header = ["Authorization": "Bearer \(authToken ?? "")" ]
        }
        
        AF.request(APPURL.Domains.Base + url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: header).validate(statusCode:200..<300).responseJSON { response in
            
            switch response.result {
            case let .success(value):
                
                print(JSON(value))
                
                success(value as AnyObject)
            case let .failure(error):
                failure(error)
            }
        }
    }
    
    class func getWithQueryType(_ url: String, params: [String: AnyObject]?,isHeader: Bool, onSuccess success: @escaping success, onFailure failure: @escaping failure){
        
        let authToken = defaults.value(forKey: APPURL.userdefaultsConstants.accessToken) as? String
        var header: HTTPHeaders? = [:]
        if isHeader {
            header = ["Authorization": "Bearer \(authToken ?? "")" ]
        }
        
        AF.request(APPURL.Domains.Base + url, method: .get, parameters: params, encoding: URLEncoding.queryString, headers: header).validate(statusCode:200..<300).responseJSON { response in
            
            switch response.result {
                case let .success(value):
                    
                    print(JSON(value))
                    
                    success(value as AnyObject)
                case let .failure(error):
                    failure(error)
                }
            }
        
    }

    
    class func resquestPOSTURL(_ url: String, params: [String: AnyObject]?,isHeader: Bool, onSuccess success: @escaping success, onFailure failure: @escaping failure){
        
        let authToken = defaults.value(forKey: APPURL.userdefaultsConstants.accessToken) as? String
        var header: HTTPHeaders? = [:]
        if isHeader {
            header = ["Authorization": "Bearer \(authToken ?? "")" ]
        }
        
        AF.request(APPURL.Domains.Base + url, method: .post, parameters: params, encoding: URLEncoding.default, headers: header).validate(statusCode:200..<300).responseJSON { response in
                
                switch response.result {
                case let .success(value):
                    print(JSON(value))
                    
                    success(value as AnyObject)
                case let .failure(error):
                    failure(error)
                }
            }
        }
    
    
    //webservice for post query
    class func resquestPOSTURLWithQueryType(_ url: String, params: [String: AnyObject]?,isHeader: Bool, onSuccess success: @escaping success, onFailure failure: @escaping failure){
        
        let authToken = defaults.value(forKey: APPURL.userdefaultsConstants.accessToken) as? String
        var header: HTTPHeaders? = [:]
        if isHeader {
            header = ["Authorization": "Bearer \(authToken ?? "")" ]
        }
        
        AF.request(APPURL.Domains.Base + url, method: .post, parameters: params, encoding: URLEncoding.queryString, headers: header).validate(statusCode:200..<300).responseJSON { response in
            
             switch response.result {
                           case let .success(value):
                               
                               print(JSON(value))
                               
                              success(value as AnyObject)
                           case let .failure(error):
                               failure(error)
                           }
        }
    }
    
    
    
    //Webservice for Multipart upload POST

    
    
    class func requestUPLOADPOST(_ url: String, image: UIImage!, params: [String: String]?, onSuccess success: @escaping success, onFailure failure: @escaping failure ) {
            
        var headers: HTTPHeaders? = [:]
        let authToken = defaults.value(forKey: APPURL.userdefaultsConstants.accessToken) as? String
         headers = [
                /*in case you need authorization header */
                "Content-type": "multipart/form-data",
                "Authorization": "Bearer \(authToken ?? "")"
            ]
            
        AF.upload(multipartFormData: { multiPart in
            if params?.count ?? 0 > 0 {
             for p in params! {
                multiPart.append("\(p.value)".data(using: String.Encoding.utf8)!, withName: p.key)
             }
            }
           multiPart.append(image.jpegData(compressionQuality: 0.4)!, withName: "file1", fileName: "file.jpg", mimeType: "image/jpg")
            
        }, to: APPURL.Domains.Base + url, method: .post, headers: headers) .uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
            let progress:[String: String] = ["progress": "Upload Progress: \(progress.fractionCompleted)"]
            NotificationCenter.default.post(name: .progress, object: nil, userInfo: progress)
        }).responseJSON(completionHandler: { data in
            print("upload finished: \(data)")
        }).response { (response) in
            switch response.result{
            case let .success(value):
                
                
                print(JSON(value))
                
               success(value as AnyObject)
            case let .failure(error):
                failure(error)
            }
        }
    }
}
