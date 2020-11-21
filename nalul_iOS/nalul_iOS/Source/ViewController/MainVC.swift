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
        
        navigationController?.navigationBar.isHidden = true
       
        if let img = img {
            
            self.backgroundImg.image = img
            backgroundImg.contentMode = .scaleAspectFill
        }
    }
    
    @IBAction func leftEyeBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func leftHandBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func dotBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func rightHandBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func earBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func mouthBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func cheekBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func rightEyeBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func noseBtn(_ sender: Any) {
        
        
    }
}
