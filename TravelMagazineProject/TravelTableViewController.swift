//
//  TravelTableViewController.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/08.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {

    let magazine = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        
        let url = URL(string: magazine[indexPath.row].photo_image)
        cell.magazineImageView.kf.setImage(with: url)
        cell.magazineImageView.layer.cornerRadius = 10
        
        cell.magazineTitle.text = magazine[indexPath.row].title
        
        cell.magazineSubTitle.text = magazine[indexPath.row].subtitle
        
        // DateFormatter가 class여서 let으로 선언해줘도 밑에서 format을 변경가능
        let format = DateFormatter()
        format.dateFormat = "yyMMdd"
        
        // yyMMdd형식의 문자열을 Date타입으로 , 옵셔널 반환이니까 nil 병합 연산자 사용
        let backToDate: Date = format.date(from: magazine[indexPath.row].date) ?? Date()
        
        // dateFormat 출력해줘야하는대로 다시 지정
        format.dateFormat = "yy년 MM월 dd일"
        
        let result = format.string(from: backToDate)
        cell.magazineDate.text = result
        
        return cell
    }
    
    // 오토레이아웃으로 인해 유동적으로 변하는 높이는 오히려 이 함수를 써주지 않으면 잘나온다..
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
    

}
