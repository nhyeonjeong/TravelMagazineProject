//
//  TravelInfoTableViewCell.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/13.
//

import UIKit
import Kingfisher

class TravelInfoTableViewCell: UITableViewCell {

    static let identifier = "TravelInfoTableViewCell"
    
    @IBOutlet weak var travelImageView: UIImageView!
    @IBOutlet weak var travelTitleLabel: UILabel!
    @IBOutlet weak var travelSubTitleLabel: UILabel!
    @IBOutlet var travelDetailLabel: UILabel!
    @IBOutlet weak var likeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        settingCell()
    }
    
    func configureCell(_ data: Travel) {
        let url = URL(string: data.travel_image ?? "")
        // text에는 nil 올 수 있다.
        travelImageView.kf.setImage(with: url)
        travelTitleLabel.text = data.title
        travelSubTitleLabel.text = data.description
        travelDetailLabel.text = "평점\(data.grade ?? 0.0) * 저장(\(data.save ?? 0))"
        
        let heartImage = data.like ?? false ? "heart.fill" : "heart"
        likeImageView.image = UIImage(systemName: heartImage)
    }
}

extension TravelInfoTableViewCell {
    /// cell UI 세팅
    func settingCell() {
        travelImageView.contentMode = .scaleAspectFill
        
        travelTitleLabel.boldLabelConfigure(fontSize: 17)

        travelSubTitleLabel.boldLabelConfigure(textColor: .gray, numberOfLines: 0, fontSize: 15)
        
        travelDetailLabel.labelConfigure(textColor: .systemGray2, fontSize: 15)
        
        likeImageView.image = UIImage(systemName: "heart")
        likeImageView.tintColor = .white
        
        travelImageView.layer.cornerRadius = 7
    }
}
