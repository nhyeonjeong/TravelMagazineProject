//
//  CityCollectionViewCell.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/10.
//

import UIKit
import Kingfisher // kingfisher사용위해

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var citiesLabel: UILabel!
    
    // identifier을 다른 곳에서 사용할 수 있음
    static var identifier = "CityCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
            
        cityImageView.contentMode = .scaleToFill
        cityNameLabel.textAlignment = .center
        cityNameLabel.font = .boldSystemFont(ofSize: 13)
    
        
        citiesLabel.textAlignment = .center
        citiesLabel.textColor = .gray
        citiesLabel.font = .boldSystemFont(ofSize: 11)
        citiesLabel.numberOfLines = 2
        
    }
    
    func configureCell(data: City, cellWidth: CGFloat) {
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url)
        cityImageView.layer.cornerRadius = cellWidth / 2
        
        cityNameLabel.text = "\(data.city_name) | \(data.city_english_name)"
        citiesLabel.text = data.city_explain
    }
}
