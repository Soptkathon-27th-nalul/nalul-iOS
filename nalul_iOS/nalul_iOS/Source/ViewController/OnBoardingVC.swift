//
//  OnBoardingVC.swift
//  nalul_iOS
//
//  Created by 곽기곤's Mac on 2020/11/22.
//

import UIKit

class OnBoardingVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var registerView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        registerView.setTitle("등록하기", for: .normal)
        registerView.setTitleColor(.black, for: .normal)
        registerView.backgroundColor = .white
        registerView.layer.cornerRadius = 5
        registerView.titleLabel?.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        
        let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.delegate = self
            vc.allowsEditing = false
            present(vc, animated: true, completion: nil)
    }
    
    @IBAction func goToSecond(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension OnBoardingVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
           
            // 수정된 이미지가 있을 경우
            imageView.image = image
        } else if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
           
            // 오리지널 이미지가 있을 경우
            imageView.image = image
                }

            picker.dismiss(animated: true, completion: nil)
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
            if let destination = storyboard.instantiateViewController(identifier: "MainVC") as? MainVC {
                
            destination.img = imageView.image
                
                self.navigationController?.pushViewController(destination, animated: true)
                
            destination.modalPresentationStyle = .fullScreen
    }
}
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
}
