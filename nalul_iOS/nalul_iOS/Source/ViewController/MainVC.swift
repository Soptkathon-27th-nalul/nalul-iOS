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
    var body: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true

        if let image: UIImage
          = ImageFileManager.shared.getSavedImage(named: "background") {
            self.backgroundImg.image = image
        }
        backgroundImg.contentMode = .scaleAspectFill
    }
    
    @IBAction func leftEyeBtn(_ sender: Any) {
        let DetailStoryboard = UIStoryboard.init(name: "Detail", bundle: nil)
        guard let firstTab = DetailStoryboard.instantiateViewController(identifier: "DetailVC") as? DetailVC else {
                    return
                }
        UserDefaults.standard.setValue("leftEye", forKey: "clickMenu")

        self.navigationController?.pushViewController(firstTab, animated: true)
    }
    
    @IBAction func leftHandBtn(_ sender: Any) {
        let DetailStoryboard = UIStoryboard.init(name: "Detail", bundle: nil)
        guard let firstTab = DetailStoryboard.instantiateViewController(identifier: "DetailVC") as? DetailVC else {
                    return
                }
        UserDefaults.standard.setValue("leftHand", forKey: "clickMenu")
        self.navigationController?.pushViewController(firstTab, animated: true)
        
    }
    
    @IBAction func dotBtn(_ sender: Any) {
        
        let DetailStoryboard = UIStoryboard.init(name: "Detail", bundle: nil)
        guard let firstTab = DetailStoryboard.instantiateViewController(identifier: "DetailVC") as? DetailVC else {
                    return
                }
        UserDefaults.standard.setValue("dot", forKey: "clickMenu")
        self.navigationController?.pushViewController(firstTab, animated: true)
    }
    
    @IBAction func rightHandBtn(_ sender: Any) {
        
        let DetailStoryboard = UIStoryboard.init(name: "Detail", bundle: nil)
        guard let firstTab = DetailStoryboard.instantiateViewController(identifier: "DetailVC") as? DetailVC else {
                    return
                }
        UserDefaults.standard.setValue("rightHand", forKey: "clickMenu")
        self.navigationController?.pushViewController(firstTab, animated: true)
    }
    
    @IBAction func earBtn(_ sender: Any) {
        let DetailStoryboard = UIStoryboard.init(name: "Detail", bundle: nil)
        guard let firstTab = DetailStoryboard.instantiateViewController(identifier: "DetailVC") as? DetailVC else {
                    return
                }
        UserDefaults.standard.setValue("ear", forKey: "clickMenu")
        self.navigationController?.pushViewController(firstTab, animated: true)
        
    }
    
    @IBAction func mouthBtn(_ sender: Any) {
        
        let DetailStoryboard = UIStoryboard.init(name: "Detail", bundle: nil)
        guard let firstTab = DetailStoryboard.instantiateViewController(identifier: "DetailVC") as? DetailVC else {
                    return
                }
        UserDefaults.standard.setValue("mouth", forKey: "clickMenu")
        self.navigationController?.pushViewController(firstTab, animated: true)
    }
    
    @IBAction func cheekBtn(_ sender: Any) {
        
        let DetailStoryboard = UIStoryboard.init(name: "Detail", bundle: nil)
        guard let firstTab = DetailStoryboard.instantiateViewController(identifier: "DetailVC") as? DetailVC else {
                    return
                }
        UserDefaults.standard.setValue("cheek", forKey: "clickMenu")
        self.navigationController?.pushViewController(firstTab, animated: true)
    }
    
    @IBAction func rightEyeBtn(_ sender: Any) {
        let DetailStoryboard = UIStoryboard.init(name: "Detail", bundle: nil)
        guard let firstTab = DetailStoryboard.instantiateViewController(identifier: "DetailVC") as? DetailVC else {
                    return
                }
        UserDefaults.standard.setValue("rightEye", forKey: "clickMenu")
        self.navigationController?.pushViewController(firstTab, animated: true)
        
        
    }
    
    @IBAction func noseBtn(_ sender: Any) {
        
        let DetailStoryboard = UIStoryboard.init(name: "Detail", bundle: nil)
        guard let firstTab = DetailStoryboard.instantiateViewController(identifier: "DetailVC") as? DetailVC else {
                    return
                }
        UserDefaults.standard.setValue("nose", forKey: "clickMenu")
        self.navigationController?.pushViewController(firstTab, animated: true)
    }
}
