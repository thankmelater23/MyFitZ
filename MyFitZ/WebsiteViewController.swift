//
//  WebsiteViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 1/20/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import UIKit

class WebsiteViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    let url = "http://www.MyFitZApp.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadURL()
        
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    func loadURL(){
        let requestURL = URL(string: url)
        let request = URLRequest(url: requestURL!)
        
        GlobalUserInitiatedQueue.async(execute: {
            self.webView.loadRequest(request)
        })
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"{
//            print("Loaded \(self.webView.estimatedProgress * 100)%")
             print("Observer Called")
        }
    }
}
