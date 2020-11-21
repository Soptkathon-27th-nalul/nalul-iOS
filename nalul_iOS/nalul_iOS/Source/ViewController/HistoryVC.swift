//
//  DetailVC.swift
//  nalul_iOS
//
//  Created by inae Lee on 2020/11/22.
//

import UIKit

class HistoryVC: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
}

extension HistoryVC {
    func setView() {
        let category: String = "오른쪽 눈"
        
        questionLabel.text = "오늘 당신의 눈은\n어떤 색인가요?"
        questionLabel.font = UIFont(name: "NotoSansCJKkr-Bold", size: 32)
        questionLabel.textAlignment = .left
        questionLabel.sizeToFit()
        
        imageView.backgroundColor = .green
        //        imageView.image = UIImage()
        
        dateLabel.text = "2020.11.21"
        dateLabel.font = UIFont(name: "NotoSansCJKkr-Regular", size: 16)
        
        categoryLabel.text = "카테고리  |  \(category)"
        categoryLabel.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
        categoryLabel.textAlignment = .left
        categoryLabel.sizeToFit()
        
        contentLabel.text = "내 오른쪽 눈은 주황색일지도 그런데 내 오른쪽 눈은 유독 파랗고 반짝거리고 그렇다 솝커톤 내 오른쪽 눈은 주황색일지도 그런데 내 오른쪽 눈은 유독 파랗고 반짝거리고 그렇다 솝커톤 내 오른쪽 눈은 주황색일지도 그런데 내 오른쪽 눈은 유독 파랗고 반짝거리고 그렇다 솝커톤 내 오른쪽 눈은 주황색일지도 그런데 내 오른쪽 눈은 유독 파랗고 반짝거리고 그렇다 솝커톤"
        contentLabel.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
        contentLabel.textAlignment = .left

        contentLabel.sizeToFit()
        
    }
}
