//
//  SearchViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 8/23/15.
//  Copyright © 2015 BangBangStudios. All rights reserved.
//

import UIKit

@IBDesignable class SearchViewController: UIViewController {
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
    
    func setUI(){
        modelLabel.text = item.model
        brandLabel.text = item.brand
        image.image = item.image
        setButtonsEnabled()
    }

    @IBAction func prevItem() {
        iteratePrevInCurrentItems()
    }
    @IBAction func nextItem() {
        iterateNextInCurrentItems()
    }
    
    override func viewDidLoad() {
        self.title = grabTitle(gamesWardrobe.closetSelectionString, view: "Search")
        
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }

        //Category
        categoryPickerView.delegate = self
        categoryInputTextField.inputView = categoryPickerView
        
        
        //Sub-Category
        subCategoryPickerView.delegate = self
        subCategoryInputTextField.inputView = subCategoryPickerView
        subCategoryInputTextField.userInteractionEnabled = false
        // Do any additional setup after loading the view.
        
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            
            let loadedArchived = gamesWardrobe.selectedCloset
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
    
    func retrieveSubCat(){
//        indexOfController = 0
        //Make an array an of the subclass move to the next one from here
        item = retrieveItem()
    }
    func retrieveItem()->Item{
        let array = gamesWardrobe.selectedCloset[categorySelected]![subCategorySelected]!
        
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
        let array = gamesWardrobe.selectedCloset[categorySelected]![subCategorySelected]!
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
        if indexOfController >= 0{
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
}