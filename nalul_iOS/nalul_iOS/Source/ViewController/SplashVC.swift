//
//  SplashVC.swift
//  nalul_iOS
//
//  Created by 김민희 on 2020/11/22.
//

import UIKit

class SplashVC: UIViewController {
    var UuidModel : LoginData<LoginSuccess>?
    override func viewDidLoad() {
        super.viewDidLoad()
        CheckInUUID(uuid: UIDevice.current.identifierForVendor?.uuidString ?? "")
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(aaaa), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    @objc func aaaa() {
//           guard let storyboard = UIStoryboard(name: "OnBoarding", bundle: nil).instantiateViewController(identifier: "SignInVC") as? SignInVC else { return }
//           UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = storyboard
       }
    private func CheckInUUID(uuid: String) {
        LoginService.shared.login(uuid: uuid) { networkResult in switch
            networkResult {
        
        case .success(let res):
            let response = res as! LoginData<LoginSuccess>
            self.UuidModel = response
        case .requestErr(_):
            print("requestErr")
        case .pathErr:
            print("path")
        case .serverErr:
            print("serverErr")
        case .networkFail:
            print("networkFail")
        }
        }
    }
}
