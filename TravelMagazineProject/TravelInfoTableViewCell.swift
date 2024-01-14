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
        
        travelImageView.contentMode = .scaleAspectFill
        
        travelTitleLabel.font = .boldSystemFont(ofSize: 17)
        travelSubTitleLabel.font = .boldSystemFont(ofSize: 15)
        travelSubTitleLabel.numberOfLines = 0
        
        travelSubTitleLabel.textColor = .gray
        
        travelDetailLabel.font = .systemFont(ofSize: 15)
        travelDetailLabel.textColor = .systemGray2
        
        likeImageView.image = UIImage(systemName: "heart")
        likeImageView.tintColor = .white
        
        travelImageView.layer.cornerRadius = 7
        
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
