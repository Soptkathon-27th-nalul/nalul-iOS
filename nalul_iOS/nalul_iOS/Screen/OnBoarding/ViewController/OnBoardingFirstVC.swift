//
//  OnBoardingFirstVC.swift
//  nalul_iOS
//
//  Created by 곽기곤's Mac on 2020/11/22.
//

import UIKit

class OnBoardingFirstVC: UIViewController {
    
    
    @IBOutlet weak var firstBtnView: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstBtnView.layer.borderWidth = 1
        firstBtnView.layer.borderColor = UIColor.white.cgColor
        firstBtnView.layer.cornerRadius = 5
        
        firstBtnView.setTitle("다음", for: .normal)
        firstBtnView.setTitleColor(.white, for: .normal)

        navigationController?.navigationBar.isHidden = true
        
        firstBtnView.layer.borderWidth = 1
        firstBtnView.layer.cornerRadius = 5
        firstBtnView.layer.borderColor = UIColor.white.cgColor
        firstBtnView.titleLabel?.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
    }
    
    @IBAction func toSecond(_ sender: Any) {
        
        guard let PopUpPush = self.storyboard?.instantiateViewController(identifier:"OnBoardingSecondVC") as? OnBoardingSecondVC else {return}
        
        self.navigationController?.pushViewController(PopUpPush, animated: true)
    }
}
