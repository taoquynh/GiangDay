//
//  ViewController.swift
//  SalemanChecking
//
//  Created by hieu nguyen van on 9/6/19.
//  Copyright © 2019 hieunv. All rights reserved.
//

import UIKit
import CommonCrypto

extension String {
    func sha1() -> String {
        let data = Data(self.utf8)
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0.baseAddress, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}

struct Root: Decodable{
    let signed: Bool
    let msg: String
    let data: UserInfo
    enum CodingKeys: String, CodingKey {
        case signed = "signed"
        case msg = "msg"
        case data = "data"
    }
}
struct UserInfo: Decodable{
    let usr_name: String?
    let usr_id: Int?
    let usr_icon: String?
    let usr_access_token: String?
    let usr_fullname: String?
    let br_long: String?
    let br_lat: String?
    enum CodeingKeys: String, CodingKey{
        case usr_name = "usr_name"
        case usr_id = "usr_id"
        case usr_icon = "usr_icon"
        case usr_access_token = "usr_access_token"
        case usr_fullname = "usr_fullname"
        case br_long = "br_long"
        case br_lat = "br_lat"
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    //private var UserArray = [UserInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
        //print("link in login: ", UserDefaults.standard.object(forKey: "Link") ?? "")
        //ktra nếu đã login từ trước rồi thì ok
        if (UserDefaults.standard.bool(forKey: "isLogedin")){
            //print("isLoggedin...")
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let HomeController = mainStoryBoard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
            // truyền 3 giá trị sang màn hình chấm công
            HomeController.fullname = UserDefaults.standard.object(forKey: "udf_name") as? String ?? "" // lấy được từ nút thoát
            //ViewController.usr_icon = UserDefaults.standard.object(forKey: "Usr_icon") as? String ?? "icon của 1080"
            
            HomeController.access_token = UserDefaults.standard.object(forKey: "Access_token") as? String ?? ""
            HomeController.app_token = UserDefaults.standard.object(forKey: "App_token") as? String ?? ""
            //
            //print("giá trị truyền sang khi ko sigout:", UserDefaults.standard.object(forKey: "udf_name") as? String ?? "")
            UIApplication.shared.windows.first?.rootViewController = HomeController
        }
        
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        //print("Sign in button tapped")
        let userName = txtUsername.text
        let passWord = txtPassword.text?.sha1()
        
        if (txtPassword.text?.isEmpty)! || (txtUsername.text?.isEmpty)!
            
        {
            alertValidationTextField(title: "Alert", message: "Username or Password is empty", ViewController: self, toFocus: txtUsername!)
            return
        }
        
        //lấy link đang lưu trên máy
        var mylink = UserDefaults.standard.object(forKey: "Link") as! String
        mylink += "api/user_signin"
        print(mylink)
        let myUrl = URL(string: mylink)
        var request = URLRequest(url: myUrl!)
        request.httpMethod = "POST"
        let deviceID = UIDevice.current.identifierForVendor?.uuidString
        var postString = "&usr_name=\(userName!)"
        postString = postString + "&usr_pwd=\(passWord!)" + "&app_token=\(deviceID!)"
        //gắn user/pas/mã máy gửi lên server để check đăng nhập
        print(postString)
        let postData = postString.data(using: .utf8) // convert to utf8 string
        request.httpBody = postData
        //
        do
        {
            //print(request)
            // gửi request lên server
            let uploadJob = URLSession.shared.uploadTask(with: request, from: postData){responseData, response, error in
                if error != nil {
                    
                    DispatchQueue.main.async
                        {
                            displayMessage(message: "Looks like the connection to the server didn't work.  Do you have Internet access?", title: "Alert", vw: self)
                    }
                }else
                    //post request lên server mà thoả mãn đk thì vào đây
                {
                    //decode json data sau khi gửi request
                    do{
                        let UserInfoData = try JSONDecoder().decode(Root.self, from: responseData!)
                        //print("login status: ", UserInfoData.signed)
                        //print("access_token: ", UserInfoData.data.usr_access_token ?? "")
                        //print("lat on host:", UserInfoData.data.br_lat ?? "")
                        //print("long on host:", UserInfoData.data.br_long ?? "")
                        if (UserInfoData.signed)
                        {
                            //print("Username: ", UserInfoData.data.usr_fullname ?? "UnKnow")
                            
                            DispatchQueue.main.async
                                {
                                    UserDefaults.standard.set(true, forKey: "isLogedin")
                                    //set giá trị và gửi 2 giá trị này về appdelegate
                                    let udf_access_token = UserDefaults.standard
                                    let udf_app_token = UserDefaults.standard
                                    udf_access_token.set(UserInfoData.data.usr_access_token, forKey: "Access_token")
                                    udf_app_token.set(deviceID, forKey: "App_token")
                                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                    appDelegate.passData(udf_access_token)
                                    appDelegate.passData(udf_app_token)
                                    
                                    //chuyển màn hình
                                    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                                    let HomeController = mainStoryBoard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
                                    // truyền giá trị sang màn hình chấm công
                                    HomeController.fullname = UserInfoData.data.usr_fullname
                                    HomeController.access_token = UserInfoData.data.usr_access_token
                                    //HomeController = UserInfoData.data.usr_icon ?? "icon của 1080"
                                    HomeController.app_token = deviceID
                                    //print(UserInfoData.data.usr_icon!)
                                    //self.navigationController?.pushViewController(ViewController, animated: true)
                                    UIApplication.shared.windows.first?.rootViewController = HomeController
                            }
                        }
                        else
                        {
                            DispatchQueue.main.async
                                {
                                    displayMessage(message: "Login status: \(UserInfoData.signed). \(UserInfoData.msg)", title: "Alert", vw: self)
                            }
                        }
                        
                    } catch{
                        displayMessage(message: error as! String, title: "Alert", vw: self)
                    }
                    
                    //}
                    
                }
            }
            uploadJob.resume()
        }
    }
    
}

