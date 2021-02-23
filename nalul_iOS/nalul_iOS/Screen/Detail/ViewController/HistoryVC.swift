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
    
    var bodyImage: UIImage?
    var question: String?
    var date: String?
    var content: String?
    var category: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
}

extension HistoryVC {
    func setView() {
        if let question = self.question,
           let bodyImage = self.bodyImage,
           let date = self.date,
           let content = self.content,
           let category = self.category {
            questionLabel.text = question
            questionLabel.font = UIFont(name: "NotoSansCJKkr-Bold", size: 32)
            questionLabel.textAlignment = .left
            questionLabel.sizeToFit()
            
            imageView.image = bodyImage
            
            dateLabel.text = date
            dateLabel.font = UIFont(name: "NotoSansCJKkr-Regular", size: 16)
            
            contentLabel.text = content
            contentLabel.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
            contentLabel.textAlignment = .left
            contentLabel.sizeToFit()
            
            categoryLabel.text = category
            categoryLabel.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
            categoryLabel.textColor = UIColor(red: 132/255, green: 82/255, blue: 82/255, alpha: 1)
            categoryLabel.textAlignment = .left
            categoryLabel.sizeToFit()
        }
    }
}
