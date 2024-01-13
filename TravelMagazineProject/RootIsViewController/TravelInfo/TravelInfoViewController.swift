//
//  TravelInfoViewController.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/13.
//

import UIKit

class TravelInfoViewController: UIViewController {
    static let identifier = "TravelInfoViewController"
    @IBOutlet weak var tableView: UITableView!

    let travelInfo = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }

}

// UI적 요소
extension TravelInfoViewController {
    func configureView() {
        
        navigationItem.title = "도시 상세 정보"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // xib 두 개 종류니까 생성
        tableView.settingXib(tableViewCellIdentifier: TravelInfoTableViewCell.identifier)
        tableView.settingXib(tableViewCellIdentifier: ADTableViewCell.identifier)
        
//        let xib = UINib(nibName: TravelInfoTableViewCell.identifier, bundle: nil)
//        tableView.register(xib, forCellReuseIdentifier: TravelInfoTableViewCell.identifier)
//        
//        let adxib = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
//        tableView.register(xib, forCellReuseIdentifier: ADTableViewCell.identifier)
    }
}

// UITableView관련 메서드
extension TravelInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // 광고일 때
        if travelInfo[indexPath.row].ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            cell.configureCell(travelInfo[indexPath.row])
            cell.selectionStyle = .none
            return cell
        } else { // 광고 아닐때
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelInfoTableViewCell.identifier, for: indexPath) as! TravelInfoTableViewCell
            
            cell.configureCell(travelInfo[indexPath.row])
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 광고 클릭했으면!?
        if !travelInfo[indexPath.row].ad {
            let sb = UIStoryboard(name: "TravelDetail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: TravelDetailViewController.identifier) as! TravelDetailViewController

            navigationController?.pushViewController(vc, animated:  true)
        } else {
            let sb = UIStoryboard(name: "ADDetail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: ADDetailViewController.identifier) as! ADDetailViewController
            let nav = UINavigationController(rootViewController: vc)
            // vs -> nav
            
            //그리고 방식, 효과 적용도 vs가 아닌 루트인 nav에 해야한다.
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            
        }
    }
}
