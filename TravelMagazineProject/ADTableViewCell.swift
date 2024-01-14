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
        
        settingCell()
        
    }
    
    func configureCell(_ data: Travel) {
        let randomColor = getRandomColor()
        
        // cell의 백그라운드 컬러
        self.backgroundColor = randomColor
        self.layer.cornerRadius = 8
        
        titleLabel.text = data.title
        titleLabel.font = .boldSystemFont(ofSize: 17)
    }
    /// 랜덤으로 배경색 뽑아서 반환
    func getRandomColor() -> UIColor {
        
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 0.5)
    }
    
}

extension ADTableViewCell {
    /// cell UI 세팅
    func settingCell() {
        adLabel.layer.cornerRadius = 7
        adLabel.clipsToBounds = true
        
        titleLabel.labelConfigure(alignment: .center, numberOfLines: 0, fontSize: 17)
    }
}
