
import UIKit
import FirebaseCrashlytics
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var StateSDataModel : [PostElement]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        fetchStateDetails()
    }

    func fetchStateDetails(){
    
        let rechability = NetworkReachabilityManager()
        if rechability?.isReachable == true {
            
            DataGenerator.FetchStateDetailsMobile(){ (success , response) in
                if success {
                    print(success)
                    
                    self.FetchStateDetailsMobile(data: response)
                    
                }
                else{
                    print("error")
                }
            }
            
        }
                
    }
            
    
    private func FetchStateDetailsMobile(data: AnyObject) {
        let json = JSON(data)
        if json != JSON.null
        {
            let jsonString = "\(json)"
            let jsonData = jsonString.data(using: .utf8)!
            let result_data = try! JSONDecoder().decode( Post.self, from: jsonData)
            
            
            StateSDataModel = result_data
            self.tableView.reloadData()
        }
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = StateSDataModel?.count else{
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "getTVC", for: indexPath) as! getTVC
        cell.lbl.text = StateSDataModel[indexPath.row].title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! commentsVC
        vc.commentss = StateSDataModel
    }
}

