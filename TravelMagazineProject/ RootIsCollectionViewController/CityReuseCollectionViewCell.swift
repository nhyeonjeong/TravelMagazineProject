//
//  CityReuseCollectionViewCell.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/10.
//

import UIKit
import Kingfisher

// CityCollectionViewCell 내용과 동일
class CityReuseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var citiesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImageView.contentMode = .scaleAspectFill
        
        cityNameLabel.font = .boldSystemFont(ofSize: 13)
        cityNameLabel.textAlignment = .center
        
        citiesLabel.font = .boldSystemFont(ofSize: 11)
        citiesLabel.textColor = .gray
        citiesLabel.textAlignment = .center
        citiesLabel.numberOfLines = 0
        
        citiesLabel.textAlignment = .center
        
    }
    
    func configureCell(data: City, cellWidth: CGFloat) {
        
        cityImageView.layer.cornerRadius = cellWidth / 2
        
        let imageUrl = URL(string: data.city_image)
        cityImageView.kf.setImage(with: imageUrl)
        
        cityNameLabel.text = "\(data.city_name) | \(data.city_english_name)"
        citiesLabel.text = data.city_explain
    }

}
