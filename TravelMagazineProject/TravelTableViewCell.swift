//
//  TravelTableViewCell.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/08.
//

import UIKit

protocol TravelTableCellConfigure {
    static var identifier: String { get set }
    func configureCell(magazine: Magazine)
}
class TravelTableViewCell: UITableViewCell {

    @IBOutlet weak var magazineImageView: UIImageView!
    @IBOutlet weak var magazineTitle: UILabel!
    @IBOutlet weak var magazineSubTitle: UILabel!
    @IBOutlet weak var magazineDate: UILabel!
    
    static var identifier = "TravelTableViewCell"
    
    let format = DateFormatter()
    let format2 = DateFormatter()
    override func awakeFromNib() {
        super.awakeFromNib()
      
        magazineImageView.layer.cornerRadius = 10
        
        // format설정은 한 번만 하고 안해줘도 되니까 여기로 뺴줌
        // DateFormatter가 class여서 let으로 선언해줘도 밑에서 format을 변경가능
        format.dateFormat = "yyMMdd"
        // dateFormat 출력해줘야하는대로 지정
        format2.dateFormat = "yy년 MM월 dd일"
    }
    
    func setDateLabel(magazine: Magazine) {
        
        // yyMMdd형식의 문자열을 Date타입으로 , 옵셔널 반환이니까 nil 병합 연산자 사용
        let backToDate: Date = format.date(from: magazine.date) ?? Date()
        
        let result = format2.string(from: backToDate)
        magazineDate.text = result
    }
    
}

extension TravelTableViewCell: TravelTableCellConfigure {
    
    func configureCell(magazine: Magazine) {
        // Cell세팅
        let url = URL(string: magazine.photo_image)
        magazineImageView.kf.setImage(with: url)
        
       magazineTitle.text = magazine.title
       magazineSubTitle.text = magazine.subtitle
       setDateLabel(magazine: magazine)
    }
    
}
