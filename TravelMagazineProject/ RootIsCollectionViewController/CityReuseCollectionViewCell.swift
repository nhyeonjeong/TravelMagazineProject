//
//  CityReuseCollectionViewCell.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/10.
//

import UIKit
import Kingfisher

// 라벨의 높이를 유동적으로 하고 싶다!..
// -> stackview쓰니까 해결!(또는 label의 높이를 지정해주지 않으면 됨)

// CityCollectionViewCell 내용과 동일
class CityReuseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var citiesLabel: UILabel!
    
    static var identifier = "CityReuseCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 셀마다 공통으로 지정되는 부분
        cityImageView.contentMode = .scaleAspectFill
        
        cityNameLabel.font = .boldSystemFont(ofSize: 13)
        cityNameLabel.textAlignment = .center
        
        citiesLabel.font = .boldSystemFont(ofSize: 11)
        citiesLabel.textColor = .gray
        citiesLabel.textAlignment = .center
        citiesLabel.numberOfLines = 0
        
        citiesLabel.textAlignment = .center
        
    }
    
    // 셀마다 다르게 적용되는 디자인 함수로 배주기
    func configureCell(data: City, cellWidth: CGFloat) {
        
        cityImageView.layer.cornerRadius = cellWidth / 2
        
        let imageUrl = URL(string: data.city_image)
        cityImageView.kf.setImage(with: imageUrl)
        
        cityNameLabel.text = "\(data.city_name) | \(data.city_english_name)"
        citiesLabel.text = data.city_explain
    }

}
