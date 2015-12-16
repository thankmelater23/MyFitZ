//
//  SearchViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 8/23/15.
//  Copyright © 2015 BangBangStudios. All rights reserved.
//

import UIKit
import Crashlytics

@IBDesignable class SearchViewController: UIViewController {
    //MARK: -Outlet
    @IBOutlet weak var categoryPrev: UIButton!
    @IBOutlet weak var categoryNext: UIButton!
    @IBOutlet weak var subCategoryNext: UIButton!
    @IBOutlet weak var subCategoryPrev: UIButton!
    @IBOutlet weak var nextItemOutlet: UIButton!
    @IBOutlet weak var prevItemOutlet: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var categoryInputTextField: UITextField!
    @IBOutlet weak var subCategoryInputTextField: UITextField!
    @IBOutlet weak var indexNumberLabel: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    
    //MARK: -Variable
    var categoryPickerView = UIPickerView()
    var subCategoryPickerView = UIPickerView()
    var categoryPickerOptions = CATEGORY_PICKER_OPTIONS
    var subCategoryPickerOptions = [String]()
    var categorySelected: String! = String()
    var subCategorySelected: String! = String()
    var item:Item = Item()
    var arrayCount = 0
    var indexOfController: Int = 0{
        didSet{
            indexNumberLabel.text = String("# \(indexOfController)")
            setUI()
        }
    }
    
    
    
    //MARK: -View Methods
    override func viewDidLoad() {
        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: "Search")
        
        self.animateAllButtons()
        
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
        
        //Category
        categoryPickerView.delegate = self
        categoryInputTextField.inputView = categoryPickerView
        
        
        //Sub-Category
        subCategoryPickerView.delegate = self
        subCategoryInputTextField.inputView = subCategoryPickerView
        subCategoryInputTextField.userInteractionEnabled = false
        // Do any additional setup after loading the view.
        
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.addAndSend("SEARCH_PAGE_COUNT")
        
        self.logPageView()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            print("Segue transfer: \(segue.identifier)")
        }
        
        if segue.identifier == SEGUE_SEARCH_TO_DETAIL
        {
            let detailedViewController = segue.destinationViewController as! DetailedViewController
            
            detailedViewController.itemOfObject = self.item
            
            detailedViewController.path = self.item.path
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



//MARK: - Action Methods
extension SearchViewController{
    @IBAction func prevItem() {
        iteratePrevInCurrentItems()
    }
    @IBAction func nextItem() {
        iterateNextInCurrentItems()
    }
    @IBAction func viewItemInDetail() {
        //If no item is in the search it wont segue
        if validatePath(self.item.path){
            performSegueWithIdentifier(SEGUE_SEARCH_TO_DETAIL, sender: self)
        }
    }
}



//MARK: -Initializers-SearchViewController Extension
extension SearchViewController{
    func setUI(){
        modelLabel.text = item.model
        brandLabel.text = item.brand
        image.image = item.image
        setButtonsEnabled()
    }
}



//MARK: - PickerView Methods
extension SearchViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPickerView{
            return categoryPickerOptions.count
        }else{
            return subCategoryPickerOptions.count
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoryPickerView{
            return categoryPickerOptions[row]
        }else{
            return subCategoryPickerOptions[row]
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        defer{
        //            setUI()
        //        }
        
        if pickerView == categoryPickerView{
            defer{
                indexOfController = 0
            }
            categorySelected = categoryPickerOptions[row]
            categoryInputTextField.text = categorySelected
            
            subCategoryInputTextField.userInteractionEnabled = true
            subCategoryPickerView.delegate = self
            subCategoryPickerOptions.removeAll(keepCapacity: false)
            
            let loadedArchived = Users_Wardrobe.selectedCloset
            let keysOfCategory = (loadedArchived[categorySelected]! as Dictionary).keys
            
            
            if keysOfCategory.count >= 0{
                for key in keysOfCategory{
                    subCategoryPickerOptions.append(key)
                }
            }
            subCategoryInputTextField.text = String()
            
        }else{
            defer{
                setUI()
            }
            subCategoryPickerView.delegate = self
            subCategoryInputTextField.inputView = subCategoryPickerView
            subCategorySelected = subCategoryPickerOptions[row]
            subCategoryInputTextField.text = subCategorySelected
            //            subCategoryPickerView.removeFromSuperview()
            item = retrieveItem()
            subCategoryInputTextField.userInteractionEnabled = false
        }
    }
}



//MARK: -Controls-SearchViewController Extension
extension SearchViewController{
    func setButtonsEnabled(){
        
        if indexOfController == arrayCount - 1{
            nextItemOutlet.userInteractionEnabled = false
            nextItemOutlet.alpha = 0.5
        }else {//if indexOfController < arrayCount  && indexOfController >= 0{
            nextItemOutlet.userInteractionEnabled = true
            nextItemOutlet.alpha = 1.0
        }
        
        if indexOfController == 0{
            prevItemOutlet.userInteractionEnabled = false
            prevItemOutlet.alpha = 0.5
        }else{
            prevItemOutlet.userInteractionEnabled = true
            prevItemOutlet.alpha = 1.0
        }
        
        if arrayCount == 0{
            //                categoryPrev
            //                categoryNext
            //                subCategoryNext
            //                subCategoryPrev
            //                nextItemOutlet
            //                prevItemOutlet
            nextItemOutlet.alpha = 0.5
            nextItemOutlet.userInteractionEnabled = false
            
            prevItemOutlet.alpha = 0.5
            prevItemOutlet.userInteractionEnabled = false
        }
    }
    
    func retrieveSubCat(){
        //        indexOfController = 0
        //Make an array an of the subclass move to the next one from here
        item = retrieveItem()
    }
    func retrieveItem()->Item{
        let array = Users_Wardrobe.selectedCloset[categorySelected]![subCategorySelected]!
        
        defer{
            setButtonsEnabled()
            //            setUI()
        }
        
        if !array.isEmpty{
            arrayCount = array.count
            let newIndex = array[indexOfController] as Item?
            return newIndex!
        }else{
            arrayCount = 0
            let newItem = Item()
            item.model = "empty"
            item.brand = "empty"
            
            return newItem
        }
    }
    func iterateNextInCurrentItems(){
        let array = Users_Wardrobe.selectedCloset[categorySelected]![subCategorySelected]!
        let num = array.count
        
        if indexOfController < num{
            indexOfController++
            item = retrieveItem()
        }
        
        //        if indexOfController >= (num - 1){
        //            nextItemOutlet.userInteractionEnabled = false
        //            nextItemOutlet.alpha = 0.5
        //        }else{
        //            nextItemOutlet.userInteractionEnabled = true
        //            nextItemOutlet.alpha = 1
        //        }
    }
    func iteratePrevInCurrentItems(){
        if indexOfController > 0{
            indexOfController--
            item = retrieveItem()
            
        }
        
        //        if indexOfController == 0{
        //            prevItemOutlet.userInteractionEnabled = false
        //            prevItemOutlet.alpha = 0.5
        //        }else{
        //            prevItemOutlet.userInteractionEnabled = true
        //            prevItemOutlet.alpha = 1
        //        }
    }
}



//MARK: - UI-ImageViewController Extension
extension SearchViewController{
    func animateAllButtons(){
        //    self.animateSearchButton()
        //    self.animateStarButton()
        //    self.animateHamperButton()
        //    self.animateSearchButton()
        //    self.animatePictureLabels()
        //    self.animatePictureImages()
        //    self.animateNumberLabels()
        //    self.animateTrashButton()
        //    self.animateLogo()
        //        self.animateViews()
        
    }
    func animateLogo(){
        //    logoCustomization(self.logoImage)
    }
}




//MARK: -Anylitics-SearchViewController Extension
extension SearchViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let pageCount:Int? = defaults.returnIntValue("SEARCH_PAGE_COUNT")
        
        Answers.logContentViewWithName("Search Content View",
            contentType: "Search View",
            contentId: "MF8",
            customAttributes: ["SEARCH_PAGE_COUNT": pageCount!
            ])
    })
    }
}