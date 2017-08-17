//
//  WebsiteViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 1/20/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import UIKit

<<<<<<< HEAD
class WebsiteViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    @objc let url = "http://www.MyFitZApp.com"
=======
var keyPath = "estimatedProgress"

class WebsiteViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    let url = "http://www.MyFitZApp.com"
>>>>>>> MyFitZOld/master
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadURL()
        
<<<<<<< HEAD
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    @objc func loadURL(){
        let requestURL = URL(string: url)
        let request = URLRequest(url: requestURL!)
        
        GlobalUserInitiatedQueue.async(execute: {
=======
        self.webView.addObserver(self, forKeyPath: keyPath, options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.webView.removeObserver(self, forKeyPath: keyPath)
    }
    func loadURL(){
        let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: requestURL!)
        
        dispatch_async(GlobalUserInitiatedQueue,{
>>>>>>> MyFitZOld/master
            self.webView.loadRequest(request)
        })
    }
    
<<<<<<< HEAD
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"{
//            log.debug("Loaded \(self.webView.estimatedProgress * 100)%")
             log.debug("Observer Called")
=======
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == keyPath{
//            print("Loaded \(self.webView.estimatedProgress * 100)%")
             print("Observer Called")
>>>>>>> MyFitZOld/master
        }
    }
}
