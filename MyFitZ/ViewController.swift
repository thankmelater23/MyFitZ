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
    
//    let user: User = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        //        log.info(user)
        createData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() { 
        log.info(#function)
        super.didReceiveMemoryWarning()
        log.warning("Recieved Memory Warning")
        // Dispose of any resources that can be recreated.
        
    }
    
    func createData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let item = Item(context: context)
        
        
        item.brand = "1"
        item.category = "2"
        item.subCategory = "3"
        item.id = 3
        item.isFavorite = false
        item.index = 2
        
        do{
            let items = try context.fetch(Item.fetchRequest())
            if items.count > 0{
                
                log.verbose("Count: \(items.count)")
            }else{
                print("No results found")
                
                print("Creating new data base")
                
                
            }
            log.debug("Items in Core Data: \(items) \n count: \(items.count)")
        }catch{
            log.error("Fetching Failed")
        }
        
    }
    
}
