//
//  WirteVC.swift
//  nalul_iOS
//
//  Created by 김민희 on 2020/11/22.
//

import UIKit

class WriteVC: UIViewController {
    var classId: Int?
    var img:UIImage?
    var QuestionModel: QuestionData<QuestionSuccess>?
    var eyeData: [String] = ["눈에 뭘 담고 싶나요?","오늘 뭘 봤나요?","눈 색깔이 \n어떤 것 같아요?","자신의 눈이 \n매력적인 점은?","반대쪽 눈과 \n다른 점이 뭔가요?"]
    var noseData: [String] = ["달에서는 \n무슨 냄새가 \n날 것 같아요?","자신에 코에 대해 \n칭찬해보세요.","다른 사람들이 말하는 \n나만의 냄새가 있나요?","당신을 향기를 \n색으로 표현한다면 \n어떤 색인가요?","냄새를 못 맡는다면 \n어떨 것 같나요?"]
    var mouthData: [String] = ["지금 당장 \n하고 싶은 말은?","오늘 꼭 \n하고 싶었지만 \n못한 말은?","입술이 \n어때보이는지 \n설명해주세요.","사랑하는 사람에게 \n하고 싶은 말이 \n있나요?","평소 입술 색은 \n어떤 색인가요?"]
    var cheekData: [String] = ["가장 최근 당신의 \n볼을 만진 사람은 \n누군가요?","지금 볼의 \n온도가 어때요? \n따뜻한가요? ","볼의 촉감이 \n어때요?","왼쪽 볼과 \n오른쪽 볼 중 \n어느 볼이 더 \n마음에 드나요? \n그 이유는요?","손이 아니라 \n볼로 느껴본 \n사물이 있나요?"]
    var earData: [String] = ["지금 당장 \n들리는 소리는?","오늘 들은 \n노래가 있나요?","밖에 나갔을 때 \n가장 먼저 들린 소리가 \n무엇인가요?","귀가 작은 편인가요 \n큰 편인가요?","지금 들리는 소리들 중 \n가장 작게 들리는 \n소리가 무엇인가요?"]
    var pointData: [String] = ["내 몸에서 \n가장 오래된 것 같은 \n점이 뭔가요?","가장 작은 \n점을 찍어 주세요! \n언제쯤 생긴 것 같아요?","점의 생김새를 \n최대한 자세하게 \n표현해 주세요!\n(색, 모양 등)","점에 이름을 \n하나 지어주는 거 \n어때요?","이 점이 \n없었다면 \n어땠을 것 같나요?"]
    var handData: [String] = ["손은 누굴 \n닮았어요?","당신의 손은 \n따뜻한가요, 차가운가요?","최근에 가족과 \n손을 잡은 적이 \n있나요?","어느 쪽 손이 \n더 마음에 드나요? \n그 이유는요?","내 손에게 \n미안한 점이 \n있나요?"]
    
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
//    override func viewWillAppear(_ animated: Bool) {
//        if let img = img {
//            self.
//        }
//    }
    
    @IBAction func touchUpPostButton(_ sender: Any) {
        if (faceImageView.isHidden == false) && (subTextView.text != "대답을 입력해주세요.") {
            //서버 통신
            UserDefaults.standard.set(faceImageView.image, forKey: "image")
            UserDefaults.standard.set(subTextView.text, forKey: "text")
            UserDefaults.standard.set(questionLabel.text, forKey: "question")
            self.navigationController?.popViewController(animated: true)
            
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
        questionLabel.text = eyeData[3]
//        if classId == 0 {
//
//        }
        
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
