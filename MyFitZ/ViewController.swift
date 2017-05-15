//
//  ViewController.swift
//  MyFitZ
//
//  Created by Andre V on 4/22/17.
//  Copyright © 2017 Bang Bang Studios. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //MARK: -Outlets
    @IBOutlet weak var closetButton: UIButton!
    @IBOutlet weak var wishListButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var optionsButton: UIButton!
    
    //MARK: -Variables
    var user: User? = nil
    var items: [Item]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
                log.info(user  ?? "User Is nil")
        createData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func viewWillAppear(_ animated: Bool) {
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController?.isToolbarHidden = true
    self.navigationController?.isNavigationBarHidden = true

    
    }
    override func didReceiveMemoryWarning() { 
        log.info(#function)
        super.didReceiveMemoryWarning()
        log.warning("Recieved Memory Warning")
        // Dispose of any resources that can be recreated.
        
    }
    
    func createData(){
        let context = DataBaseController.getContext()
        
        do{
            items = try context.fetch(Item.fetchRequest())
            if items!.count > 0{
                
                log.verbose("Count: \(items!.count)")
            }else{
                print("No results found")
                
                print("Creating new data base")
                
                
            }
            log.debug("Items in Core Data: \(items) \n count: \(items!.count)")
        }catch{
            log.error("Fetching Failed")
        }
        
        let item = Item(context: context)
        
        
        item.brand = "Brand"
        item.model = "Model"
        item.category = "Category"
        item.subCategory = "Sub-Category"
        item.id = 100
        item.isFavorite = false
        item.index = 1
        
        do{
            try context.save()
        }catch{
            log.error("Save Failed")
        }
    }
    
}
