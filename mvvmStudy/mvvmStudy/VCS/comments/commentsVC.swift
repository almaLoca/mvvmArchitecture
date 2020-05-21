
import UIKit
import Alamofire
import SwiftyJSON

class commentsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var commentss : [PostElement]!
    var pscoments :  [ComentElement]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //prev Data
//        print(commentss[0].title)
        
        
        fetchComent()
    }
    
        func fetchComent(){
        
            let rechability = NetworkReachabilityManager()
            if rechability?.isReachable == true {
                
                DataGenerator.FetchComentsMobile( postID: "1" ){ (success , response) in
                            if success {
                                print(success)
                                
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
                let result_data = try! JSONDecoder().decode( Comments.self, from: jsonData)
                
                
                pscoments = result_data
                self.tableView.reloadData()
    }
    
    
}



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = pscoments?.count else{
            return 0
        }
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsTVC", for: indexPath) as! commentsTVC
        cell.lbl.text = pscoments[indexPath.row].email
        return cell
    }

}
