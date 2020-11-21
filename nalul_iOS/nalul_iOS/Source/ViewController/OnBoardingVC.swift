//
//  OnBoardingVC.swift
//  nalul_iOS
//
//  Created by 곽기곤's Mac on 2020/11/22.
//

import UIKit

class OnBoardingVC: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        
        let vc = UIImagePickerController()
                vc.sourceType = .photoLibrary
                vc.delegate = self
                vc.allowsEditing = true
                present(vc, animated: true, completion: nil)
    }
}

extension OnBoardingVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            
            imageView.image = image
        }
            picker.dismiss(animated: true, completion: nil)
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
            if let destination = storyboard.instantiateViewController(identifier: "MainVC") as? MainVC {
                
            destination.img = imageView.image
                
            present(destination, animated: true, completion: nil)
                
            destination.modalPresentationStyle = .fullScreen
    }
}
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
}
