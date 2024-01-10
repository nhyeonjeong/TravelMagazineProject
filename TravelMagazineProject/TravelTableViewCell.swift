//
//  TravelTableViewCell.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/08.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

    @IBOutlet weak var magazineImageView: UIImageView!
    @IBOutlet weak var magazineTitle: UILabel!
    @IBOutlet weak var magazineSubTitle: UILabel!
    @IBOutlet weak var magazineDate: UILabel!
    
    static let identifier = "TravelTableViewCell"
    
    let format = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        magazineImageView.layer.cornerRadius = 10
     
    }
    // Cell세팅
    func configureCell(magazine: Magazine) {
        
        let url = URL(string: magazine.photo_image)
        magazineImageView.kf.setImage(with: url)
        
       magazineTitle.text = magazine.title
       magazineSubTitle.text = magazine.subtitle
       setDateLabel(magazine: magazine)
    }
    
    func setDateLabel(magazine: Magazine) {
        // DateFormatter가 class여서 let으로 선언해줘도 밑에서 format을 변경가능
        format.dateFormat = "yyMMdd"
        
        // yyMMdd형식의 문자열을 Date타입으로 , 옵셔널 반환이니까 nil 병합 연산자 사용
        let backToDate: Date = format.date(from: magazine.date) ?? Date()
        
        // dateFormat 출력해줘야하는대로 다시 지정
        format.dateFormat = "yy년 MM월 dd일"
        
        let result = format.string(from: backToDate)
        magazineDate.text = result
    }
    
}
