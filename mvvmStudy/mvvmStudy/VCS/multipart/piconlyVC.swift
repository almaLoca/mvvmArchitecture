

import UIKit
import SwiftyJSON
import Alamofire

class piconlyVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var progressLbl: UILabel!
    
    var imagePicked : UIImage!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: .progress, object: nil)
        
        imagePicker.delegate = self
        getToken()
    }

    
    func getToken(){
        
        let rechability = NetworkReachabilityManager()
        if rechability?.isReachable == true {
        
          DataGenerator.postLogin() { (success , response) in
            if success {
              
              let json = JSON(response)
                      if json != JSON.null
                      {
                          let jsonString = "\(json)"
                          let jsonData = jsonString.data(using: .utf8)!
                          
                          let loginModel = try? JSONDecoder().decode(LoginModel.self, from: jsonData)
                         
                          defaults.set(loginModel?.accessToken, forKey: APPURL.userdefaultsConstants.accessToken)
                          CustomerPrf.info.accessT = loginModel?.accessToken ?? ""
                          
              }
                 
               
            }
            else{
                print("error")
            }
        }
        }
        
    }
    
    
    @IBAction func click(_ sender: Any) {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
        
        let alert = UIAlertController(title: "Change Profile Photo", message: "Choose from", preferredStyle: .actionSheet)
        
            alert.addAction(UIAlertAction(title: "Photo Library", style: .default , handler:{ (UIAlertAction)in
                 self.openGallary()
            }))
            alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
                 self.openCamera()
            }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
            
        }
        else{
                var alertStyle = UIAlertController.Style.actionSheet
                alertStyle = UIAlertController.Style.alert
                

                let alertController = UIAlertController(title: "Change Profile Photo", message: "Choose from", preferredStyle: alertStyle)
                
                alertController.addAction(UIAlertAction(title: "Photo Library", style: .default , handler:{ (UIAlertAction)in
                     self.openGallary()
                }))
                alertController.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
                     self.openCamera()
                }))
            
            self.present(alertController, animated: true, completion: {
                print("completion block")
            })
        }
        
    }
    
    
        func openCamera(){
            if UIImagePickerController.isSourceTypeAvailable(.camera){
               
                imagePicker.sourceType = .camera;
                imagePicker.allowsEditing = false
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        func openGallary(){
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                
                imagePicker.sourceType = .savedPhotosAlbum;
                imagePicker.allowsEditing = false
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
                
                dismiss(animated: true, completion: {
                    if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                        
                        self.uploadIMg(image: pickedImage)
                        
                    }
                    
                })
            }
    
    func uploadIMg(image : UIImage){
        
        let rechability = NetworkReachabilityManager()
               if rechability?.isReachable == true {
               
                DataGenerator.uploadIMG(image: image) { (success , response) in
                   if success {
                     
                    self.imgView.image = image
                        
                   }
                   else{
                       print("error")
                   }
               }
               }
        
    }
    
    @objc func showSpinningWheel(_ notification: NSNotification) {

     if let progress = notification.userInfo?["progress"] as? String {
        self.progressLbl.text = progress
     }
    }
}
