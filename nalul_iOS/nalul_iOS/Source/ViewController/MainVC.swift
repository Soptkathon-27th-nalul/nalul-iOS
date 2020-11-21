//
//  MainVC.swift
//  nalul_iOS
//
//  Created by 곽기곤's Mac on 2020/11/22.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var backgroundImg: UIImageView!
    
    var img: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let img = img {
            
            self.backgroundImg.image = img
            
            backgroundImg.contentMode = .scaleAspectFill
        }
    }
}
