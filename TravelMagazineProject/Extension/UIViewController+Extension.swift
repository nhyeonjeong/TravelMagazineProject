//
//  UIViewController+Extension.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/11.
//

import UIKit

extension UICollectionView {
    // 어차피 폴더명이랑 identifier랑 같으니까 static 변수로 같이 쓰기
    /// UICollectionView xib설정
    func settingXib(collectionViewCellIdentifier identifier: String) {
        let xib = UINib(nibName: identifier, bundle: nil)
        self.register(xib, forCellWithReuseIdentifier: identifier)
    }
}

extension UITableView {
    /// UITableView xib설정
    func settingXib(tableViewCellIdentifier identifier: String) {
        let xib = UINib(nibName: identifier, bundle: nil)
        self.register(xib, forCellReuseIdentifier: identifier)
    }
}

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}
