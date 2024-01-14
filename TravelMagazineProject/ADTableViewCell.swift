//
//  ADTableViewCell.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/13.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    static let identifier = "ADTableViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var adLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        adLabel.layer.cornerRadius = 7
        adLabel.clipsToBounds = true
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        
    }
    
    func configureCell(_ data: Travel) {
        // 랜덤으로 배경색
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)

        let randomColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 0.5)
        
        // cell의 백그라운드 컬러
        self.backgroundColor = randomColor
        self.layer.cornerRadius = 8
        
        titleLabel.text = data.title
        titleLabel.font = .boldSystemFont(ofSize: 17)
    }
    
}
