//
//  OnBoardingSecondVC.swift
//  nalul_iOS
//
//  Created by 곽기곤's Mac on 2020/11/22.
//

import UIKit

class OnBoardingSecondVC: UIViewController {
    
    @IBOutlet weak var secondBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondBtn.layer.borderWidth = 1
        secondBtn.layer.borderColor = UIColor.white.cgColor
        secondBtn.layer.cornerRadius = 5
        
        secondBtn.setTitle("다음", for: .normal)
        secondBtn.setTitleColor(.white, for: .normal)
        
        secondBtn.titleLabel?.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
        

        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func toThird(_ sender: Any) {
        
        guard let PopUpPush = self.storyboard?.instantiateViewController(identifier:"OnBoardingVC") as? OnBoardingVC else {return}
        
        self.navigationController?.pushViewController(PopUpPush, animated: true)
    }
    
    @IBAction func goToFirst(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
