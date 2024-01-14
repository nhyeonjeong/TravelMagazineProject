//
//  ADDetailViewController.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/14.
//

import UIKit

class ADDetailViewController: UIViewController {
    static let identifier = "ADDetailViewController"
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "광고 화면"
        setBarButtonItem()
    }
    
    @objc func dismissClicked() {
        dismiss(animated: true)
    }
}

// UI적 요소
extension ADDetailViewController {
    
    func setBarButtonItem() {
        let buttonImage = UIImage(systemName: "xmark")
        let button = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(dismissClicked))
        
        navigationItem.leftBarButtonItem = button
    }
}
