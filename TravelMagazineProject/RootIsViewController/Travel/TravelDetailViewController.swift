//
//  TravelDetailViewController.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/14.
//

import UIKit

class TravelDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "관광지 화면"
        // 네비게이션왼쪽 바 버튼 세팅
        setBarButtonItem()
    }
    
    @objc func popClicked() {
        navigationController?.popViewController(animated: true)
    }

}

extension TravelDetailViewController {
    func setBarButtonItem() {
        let buttonImage = UIImage(systemName: "chevron.left")
        let button = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(popClicked))
        
        navigationItem.leftBarButtonItem = button
    }
}
