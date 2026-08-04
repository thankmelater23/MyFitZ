//
//  Options-SettingsViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//



import UIKit
//import Crashlytics

class Options_SettingsViewController: UIViewController {
    
    //MARK: - Valuables Protection Outlets
    @IBOutlet weak var valuablesProtectionSwitch: UISwitch?
    @IBOutlet weak var valuablesProtectionLabel: UILabel?
    @IBOutlet weak var valuablesProtectionDetailLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        log.verbose(#function)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        self.setupValuablesProtection()
        
//        defaults.addAndSend("SETTINGS_PAGE_COUNT")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateValuablesProtectionUI()
    }
    
    
    @objc func setTitle(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    //MARK: - Valuables Protection
    
    private func setupValuablesProtection() {
        updateValuablesProtectionUI()
        valuablesProtectionSwitch?.addTarget(self, action: #selector(valuablesProtectionSwitchChanged(_:)), for: .valueChanged)
    }
    
    private func updateValuablesProtectionUI() {
        let isEnabled = ValuablesManager.shared.isProtectionEnabled
        valuablesProtectionSwitch?.isOn = isEnabled
        
        let biometricType = ValuablesManager.shared.biometricType
        let authMethod = biometricType.displayName
        
        valuablesProtectionLabel?.text = "Protect Valuables"
        valuablesProtectionDetailLabel?.text = isEnabled 
            ? "Protected with \(authMethod)" 
            : "Use \(authMethod) to protect your Valuables section"
        
        log.verbose("Valuables protection UI updated - enabled: \(isEnabled), auth: \(authMethod)")
    }
    
    @objc func valuablesProtectionSwitchChanged(_ sender: UISwitch) {
        log.verbose(#function)
        let targetState = sender.isOn
        
        ValuablesManager.shared.toggleProtection { [weak self] success in
            if success {
                log.info("Valuables protection toggled successfully")
                self?.updateValuablesProtectionUI()
            } else {
                log.warning("Failed to toggle Valuables protection - reverting switch")
                sender.setOn(!targetState, animated: true)
                self?.showProtectionToggleFailedAlert()
            }
        }
    }
    
    private func showProtectionToggleFailedAlert() {
        let alert = UIAlertController(
            title: "Authentication Failed",
            message: "Could not change Valuables protection setting. Please try again.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    deinit{
        log.verbose(#function)
        
    }
}



//MARK: - Animations-Options_SettingsViewController Exension
extension Options_SettingsViewController{
    
}



//MARK: -Animations-Options_SettingsViewController Extension
extension Options_SettingsViewController{
    @objc func animateAllButtons(){
        //            self.animateFeatureButtons()
        //            self.animateLogo()
        //            self.animateOptionButtons()
        //
        
    }
    @objc func animateLogo(){
        //            logoCustomization(self.logoImage)
    }
    @objc func animateFeatureButtons(){
        //            cloesetButtonCustomization(self.closetButton)
        //            cloesetButtonCustomization(self.wishListButton)
    }
    @objc func animateOptionButtons(){
        //            optionViewCustomized(self.optionsButton)
    }
    @objc func setButtonsView(){
        //            buttonAnimation(self.closetButton)
        //            buttonAnimation(self.wishListButton)
    }
}

//MARK: -Anylitics-Options_SettingsViewController Extension
//extension Options_SettingsViewController{
//    func logPageView(){
//        GlobalBackgroundQueue.async(execute: {
//            
//            
//            let pageCount:Int? = defaults.returnIntValue("SETTINGS_PAGE_COUNT")
//            
//            
//            
//            
//            Answers.logContentView(withName: "Settings View Content View",
//                contentType: "Options Menu",
//                contentId: "MF15",
//                customAttributes: ["SETTINGS_PAGE_COUNT": pageCount!
//                ])
//            }
//        )}
//}
