//
//  WirteVC.swift
//  nalul_iOS
//
//  Created by 김민희 on 2020/11/22.
//

import UIKit

class WriteVC: UIViewController {
    var classId: Int?
    var QuestionModel: QuestionData<QuestionSuccess>?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var faceImageButton: UIButton!
    @IBOutlet weak var subTextView: UITextView!
    @IBOutlet weak var postButton: UIButton!
    
    @IBOutlet weak var faceImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        subTextView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpPostButton(_ sender: Any) {
        if (faceImageView.isHidden == false) && (subTextView.text != "대답을 입력해주세요.") {
            //서버 통신
            
        }
    }
    
    @IBAction func touchUpFaceImageButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }
    @IBAction func touchUpBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension WriteVC {
    func setView() {
        faceImageView.isHidden = true
        postButton.setTitle("등록하기", for: .normal)
        postButton.layer.cornerRadius = 8
        postButton.backgroundColor = .black
        postButton.setTitleColor(.white, for: .normal)
        postButton.titleLabel?.font = UIFont(name: "NotoSansCJKkr-Regular", size: 24.0)
        
        subTextView.textColor = .black
        subTextView.text = "대답을 입력해주세요."
        subTextView.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14.0)
        
        questionLabel.font = UIFont(name: "NotoSansCJKkr-Bold", size: 28.0)
        questionLabel.numberOfLines = 0
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(moveUp(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(moveDown(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func moveUp(_ sender: Notification) {
        
        self.view.frame.origin.y = -100
        
    }
    @objc func moveDown(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    func setQuestion() {
        PostService.shared.getQuestion(classId: classId ?? 0) {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
            case .success(let res):
                let response = res as! QuestionData<QuestionSuccess>
                self.QuestionModel = response
                self.questionLabel.text = self.QuestionModel?.data?.questionText
            case .requestErr(_):
                print(".requestErr")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
            }
        }
    }
    func setTextView() {
        if subTextView.text == "대답을 입력해주세요." {
            subTextView.text = ""
        } else if subTextView.text == "" {
            subTextView.text = "대답을 입력해주세요."
            
            
        }
    }
}
extension WriteVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
        setTextView()
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            setTextView()
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
extension WriteVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            faceImageView.image = image
            faceImageView.isHidden = false
            faceImageView.contentMode = .scaleAspectFill

        }

        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
}
