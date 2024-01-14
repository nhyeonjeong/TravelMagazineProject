//
//  UILable+Extension.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/11.
//

import UIKit

extension UILabel {
    
    // 기본은 alignment = .center, UIColor = .label, numberOfLines = 1
    /// bold체일떄 label세팅
    func boldLabelConfigure(alignment align: NSTextAlignment = .left, textColor tc: UIColor = .label, numberOfLines nol: Int = 1, fontSize: CGFloat) {
        self.textAlignment = align
        self.textColor = tc
        self.numberOfLines = nol
        self.font = .boldSystemFont(ofSize: fontSize)
    }
    
    /// bold체 아닐 떄 label 세팅
    func labelConfigure(alignment align: NSTextAlignment = .left, textColor tc: UIColor = .label, numberOfLines nol: Int = 1, fontSize: CGFloat) {
        self.textAlignment = align
        self.textColor = tc
        self.numberOfLines = nol
        self.font = .systemFont(ofSize: fontSize)
    }
    
}
