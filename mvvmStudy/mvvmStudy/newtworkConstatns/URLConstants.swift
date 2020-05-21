
import Foundation
struct APPURL {
    
    struct Domains {
        
        static let Base =  "https://jsonplaceholder.typicode.com/"
        
//        static let Base =  "http://ruin.bismideal.com/"
        
//        static let Base = "http://staging.remitap.ofabi.com/MobileAPI/"
    }
    
    //MARK: Route
    struct Routes {
        
        static let posts    = "posts"
        static let comments = "comments"
        static let token    = "token"
        
        static let FetchDeal = "FetchDealOfTheDayList_mobile"
        
        static let PasswordLogin = "PasswordLogin"
        static let insertmerchantdocumentforverification = "insertmerchantdocumentforverification"
    }
    
    struct userdefaultsConstants {
        
        static let accessToken     = "accessToken"
    }
    
}


/*
 API Completion Handler
 */

typealias success = (_ Result: AnyObject) -> ()
typealias progress = (_ progress: AnyObject) -> ()
typealias failure = (Error) -> ()
typealias wsHandler = (_ success: Bool, _ Result: AnyObject) -> ()


let defaults = UserDefaults.standard

extension Notification.Name {
static let progress = Notification.Name("progress")
}
