//
//  DetailVC.swift
//  nalul_iOS
//
//  Created by inae Lee on 2020/11/22.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var plusBtn: UIButton!
    
    @IBAction func backbuttonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    let horizontalSpacing: CGFloat = 30.0
    let spacing: CGFloat = 7.0
    
    @IBAction func plusButton(_ sender: Any) {
        let runningTabStoryboard = UIStoryboard.init(name: "Write", bundle: nil)
                
                guard let firstTab = runningTabStoryboard.instantiateViewController(identifier: "WriteVC") as? WriteVC else {
                    return
                }
        self.navigationController?.pushViewController(firstTab, animated: true)
    }
    //    var bodyImage: UIImage?
//    var question: String?
//    var date: String?
//    var content: String?
//    var category: String?
    
    var detailModels : DetailData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension DetailVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "HistoryVC") as? HistoryVC {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension DetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = (collectionView.frame.width - ((horizontalSpacing * 2) + spacing)) / 2
        
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: horizontalSpacing, bottom: 44, right: horizontalSpacing)
    }
    
}

extension DetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return detailModels?.contents.count ?? 0
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell else {return UICollectionViewCell() }
//
//        cell.bodyImage.backgroundColor = .orange
//        cell.bodyImage.image ==
//        cell.bodyImage.image = detailModels.
        cell.bodyImage.image = UIImage(named: UserDefaults.standard.string(forKey: "image") ?? "")
            
        return cell
    }
}

extension DetailVC {
    func setView() {
        plusBtn.layer.cornerRadius = self.plusBtn.bounds.size.width * 0.5
        plusBtn.alpha = 1
        plusBtn.backgroundColor = UIColor(red: 132/255, green: 82/255, blue: 82/255, alpha: 1.0)
        
        plusBtn.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.25/255).cgColor
        plusBtn.layer.shadowOffset = CGSize(width: 0, height: 20)
        plusBtn.layer.shadowRadius = 10.0
        plusBtn.layer.shadowOpacity = 1.0
        
//        if let question = self.question,
//           let bodyImage = self.bodyImage,
//           let date = self.date,
//           let content = self.content,
//           let category = self.category {
//
//        }
    }
    
    func setDetailData() {
        DetailService.shared.getDetails() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
            case .success(let res):
                let response = res as! DetailData
                self.detailModels = response
//                self.questionLabel.text = self.QuestionModel?.data?.questionText
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
}
