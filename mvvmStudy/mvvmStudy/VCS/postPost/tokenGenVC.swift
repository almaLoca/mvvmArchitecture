

import UIKit
import Alamofire
import SwiftyJSON

class tokenGenVC: UIViewController {

    @IBOutlet weak var tokenLbl: UILabel!
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var brandsLbl: UILabel!
    @IBOutlet weak var access: UILabel!
    
    var dealOfTheDayList: [DealOfTheDayList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        posst()
        getProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if  CustomerPrf.info.accessT != ""{
            self.access.text = CustomerPrf.info.accessT
        }
    }

    func posst(){
        
         let rechability = NetworkReachabilityManager()
                    if rechability?.isReachable == true {
                        
                        DataGenerator.postComentsMobile( title: "its DARK here"){ (success , response) in
                                    if success {
                                        
                                        self.FetchDetailsMobile(data: response)
                                        
                                    }
                                    else{
                                        print("error")
                            }
                    }
                                
                }
                                    
            }
                
                private func FetchDetailsMobile(data: AnyObject) {
                    let json = JSON(data)
                    if json != JSON.null
                    {
                        let jsonString = "\(json)"
                        let jsonData = jsonString.data(using: .utf8)!
                        let result_data = try! JSONDecoder().decode( PostM.self, from: jsonData)
                       
                        self.tokenLbl.text = result_data.title

            }


        }
    
      func getProducts(){
          let rechability = NetworkReachabilityManager()
          if rechability?.isReachable == true {
          
            DataGenerator.postQuerryPrdcts(size: "10") { (success , response) in
              if success {
                
                let json = JSON(response)
                        if json != JSON.null
                        {
                            let jsonString = "\(json)"
                            let jsonData = jsonString.data(using: .utf8)!
                            let dealOfTheDay = try? JSONDecoder().decode(DealOfTheDay.self, from: jsonData)
                            self.countLbl.text = "\(dealOfTheDay?.totalCount ?? 0)"
                            
                            self.dealOfTheDayList = dealOfTheDay?.dealOfTheDayList
                            self.brandsLbl.text = self.dealOfTheDayList![0].categoryCode!.rawValue 

                }
                   
                 
              }
              else{
                  print("error")
              }
          }
          }
      }
}
