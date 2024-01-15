//
//  TravelTableViewController.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/08.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {

    let magazine = MagazineInfo.magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell
        
        cell.configureCell(magazine: magazine[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: TravelMagazineDetailViewController.identifier) as! TravelMagazineDetailViewController

        vc.websitestring = magazine[indexPath.row].photo_image

        navigationController?.pushViewController(vc, animated: true)
    }
    
    // 오토레이아웃으로 인해 유동적으로 변하는 높이는 오히려 이 함수를 써주지 않으면 잘나온다..
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }

}
