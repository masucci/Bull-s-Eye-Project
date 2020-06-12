//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Lorenzo on 01/06/2020.
//  Copyright © 2020 Lorenzo Masucci. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        } 
    }
    
    
    @IBAction func closeButton() {
        dismiss(animated: true, completion: nil)
    }
    
}
