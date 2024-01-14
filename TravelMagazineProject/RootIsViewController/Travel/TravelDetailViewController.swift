//
//  TravelDetailViewController.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/14.
//

import UIKit

class TravelDetailViewController: UIViewController {
    static let identifier = "TravelDetailViewController"
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "관광지 화면"
        
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
