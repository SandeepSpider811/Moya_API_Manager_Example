//
//  ViewController.swift
//  MoyoNetworkAdapterExample
//
//  Created by Sierra 2 on 08/08/17.
//  Copyright © 2017 Sierra 2. All rights reserved.
//

import UIKit
import SwiftyJSON
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Normal API Hit
        
//        NetworkAdapter.shared.request(target: Target.login(loginBy: "email", emailPhone: "oliver@gmail.com", psw: "qwerty321"), success: { (response) in
//            let obj = (response as? User)?.userData?.userDetails
//            UserDefaults.standard.set(/obj?.accessToken, forKey: "acessToken")
//            print("UserDefaults", UserDefaults.standard.value(forKey: "acessToken") ?? "")
//            print("Hello", /obj?.accessToken)
//        }, error: { (error) in
//            print("Error", error)
//        }) { (moyaError) in
//            print("Moya Error", moyaError)
//        }
        
        //API With Header
        
//        NetworkAdapter.shared.request(target: Target.accessTokenLogin(limit: 10, skip: 0), success: { (response) in
//            let obj = (response as? User)?.userData?.userDetails
//            UserDefaults.standard.set(/obj?.accessToken, forKey: "acessToken")
//            print("UserDefaults", UserDefaults.standard.value(forKey: "acessToken") ?? "")
//            print("Hello", /obj?.accessToken)
//        }, error: { (error) in
//            print("Error", error)
//        }) { (moyaError) in
//            print("Moya Error", moyaError)
//        }
        
        //Multipart API
        
//        NetworkAdapter.shared.request(target: Target.editProfile(firstName: "Sandeep", lastName: "Kumar", email: "oliver@gmail.com", phoneNo: "55656653535", isFile: true, profileImageUrl: #imageLiteral(resourceName: "jkastrenakes_161222_1339_A_0018.0")), success: { (response) in
//            let obj = (response as? User)?.userData?.userDetails
//            print("Hello", /obj?.accessToken)
//        }, error: { (error) in
//            print("Error", error)
//        }) { (moyaError) in
//            print("Moya Error", moyaError)
//        }
        
    }
    
}

