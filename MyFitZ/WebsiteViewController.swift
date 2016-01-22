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
    
    let url = "http://www.bangbangstudios.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadURL()
        
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    func loadURL(){
        let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: requestURL!)
        
        dispatch_async(GlobalUserInitiatedQueue,{
            self.webView.loadRequest(request)
        })
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "estimatedProgress"{
//            print("Loaded \(self.webView.estimatedProgress * 100)%")
             print("Observer Called")
        }
    }
}
