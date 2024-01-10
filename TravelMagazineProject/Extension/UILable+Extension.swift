//
//  UILable+Extension.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/11.
//

import UIKit

extension UILabel {
    
    func labelConfigure(textColor tc: UIColor, numberOfLines nol: Int, fontSize: CGFloat) {
        self.textAlignment = .center
        self.textColor = tc
        self.numberOfLines = nol
        self.font = .boldSystemFont(ofSize: fontSize)
    }
}
