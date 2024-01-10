//
//  CityReuseCollectionViewCell.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/10.
//

import UIKit
import Kingfisher

protocol CollectionViewCellSetting {
    static var identifier: String { get set } // identifier지정하기
    func configureCell(data: City, cellWidth: CGFloat) // 셀마다 다른 디자인 적용
}
// 라벨의 높이를 유동적으로 하고 싶다!..
// -> stackview쓰니까 해결!(또는 label의 높이를 지정해주지 않으면 됨)

// CityCollectionViewCell 내용과 동일
class CityReuseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var citiesLabel: UILabel!
    
    // static으로 해주고 싶으면 프로토콜에도 static var 로 선언해주면 된다.(let로 하면 오류남 -->???)
    static var identifier = "CityReuseCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 셀마다 공통으로 지정되는 부분
        cityImageView.contentMode = .scaleAspectFill
        
        // extension UILabel로 뺴주기
        cityNameLabel.labelConfigure(textColor: .black, numberOfLines: 1, fontSize: 13)
        citiesLabel.labelConfigure(textColor: .gray, numberOfLines: 0, fontSize: 11)
    }
}

extension CityReuseCollectionViewCell: CollectionViewCellSetting {
    // 셀마다 다르게 적용되는 디자인 함수로 배주기
    func configureCell(data: City, cellWidth: CGFloat) {
        cityImageView.layer.cornerRadius = cellWidth / 2
        
        let imageUrl = URL(string: data.city_image)
        cityImageView.kf.setImage(with: imageUrl)
        
        cityNameLabel.text = "\(data.city_name) | \(data.city_english_name)"
        citiesLabel.text = data.city_explain
    }
    
}
