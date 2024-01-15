//
//  TravelDetailViewController.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/15.
//

import UIKit
import WebKit

class TravelMagazineDetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var websitestring = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: websitestring) else {
            return
        }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
}
