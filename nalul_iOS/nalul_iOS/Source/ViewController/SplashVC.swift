//
//  SplashVC.swift
//  nalul_iOS
//
//  Created by 김민희 on 2020/11/22.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(aaaa), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    @objc func aaaa() {
//           guard let storyboard = UIStoryboard(name: "OnBoarding", bundle: nil).instantiateViewController(identifier: "SignInVC") as? SignInVC else { return }
//           UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = storyboard
       }


}
