//
//  CreateItemViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 10/13/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import Foundation
import MobileCoreServices
import UIKit
import DKChainableAnimationKit
import RETableViewManager
//import Crashlytics

let ItemCreationProgress = "ItemCreationProgress"

//MARK: -CreateItemViewController Class
class CreateItemViewController: UIViewController, RETableViewManagerDelegate{
    //MARK: -Outlets
    @IBOutlet  weak var tableView: UITableView!
    @IBOutlet  weak var categoryInputTextField: UITextField!
    @IBOutlet  weak var subCategoryInputTextField: UITextField!
    @IBOutlet weak var pictureButton: UIButton!
    @IBOutlet  weak var pictureForSelectedItemImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var subCategoryLabel: UILabel!
    
    //MARK: -Variables
    var categoryPickerView = UIPickerView()//Make weak posibly
    var subCategoryPickerView = UIPickerView()//Make weak posibly
    var categoryPickerOptions = CATEGORY_PICKER_OPTIONS
    var subCategoryPickerOptions = [String]()
    var categorySelected: String! = String()
    var subCategorySelected: String! = String()
    var lastVCSegue = String()
    
    //MARK: -RETableView Vars
    var manager:RETableViewManager?
    var basicSection:RETableViewSection?
    //    var miscSection:RETableViewSection?
    
    var model:RETextItem?
    //    var brand:REPickerItem?
    var brand:RETextItem?
    var favorited:REBoolItem?
    var payedPrice:RENumberItem?
    var timesWorn:RENumberItem?
    var lastTimeWorn:REDateTimeItem?
    //    var kind:RETextItem?
    //    var size:RETextItem?
    //    var datePurchased:REDateTimeItem?
    //    var color:REPickerItem?
    //    var color:RETextItem?
    //    //    var secondaryColor:REPickerItem?
    //    var secondaryColor:RETextItem?
    //    //    var thirdColor:REPickerItem?
    //    var thirdColor:RETextItem?
    var itemNotes: RELongTextItem?
    var dateDeleted:REDateTimeItem?
    //    var dateReleased:REDateTimeItem?
    //    var retailPrice:RENumberItem?
    //    //var condition:REPickerItem?
    //    var condition:RETextItem?
    //    //var primaryMaterial:REPickerItem?
    //    var primaryMaterial:RETextItem?
    //    //var secondaryMaterial:REPickerItem?
    //    var secondaryMaterial:RETextItem?
    //    var sellerURL:RETextItem?
    //    var storeLocation:RETextItem?
    //    var sellerName:RETextItem?
    //    var arrayOfImages:R?
//    var isThisNew:REBoolItem?//{
//        if timesWorn > 0{
//            return false
//        }else{
//            return true
//        }
//    }
    
    let context = DataBaseController.getContext()
    
    var viewItem = Item()
    var currentIndex = 0
    ///Dictionary path to item
    var path: [String: String] = [String: String]()
    
    
    deinit{
        log.info(#function)
        
    }
}



//MARK: - View Functions -Extension CreateItemViewController
extension CreateItemViewController{
    override func viewDidLoad() {
        log.info(#function)
        super.viewDidLoad()
        self.setUp()
        defaults.addAndSend("CREATE_PAGE_COUNT")
        
        //self.logPageView()
    }
    override func viewDidAppear(_ animated: Bool) {
        log.info(#function)
        super.viewDidAppear(animated)
        self.view.backgroundColor = Cotton
        
        self.categoryInputTextField.layer.borderWidth = 2
        self.categoryInputTextField.layer.borderColor = HighlightColor.priorityHigh.cgColor
        
        self.subCategoryInputTextField.layer.borderWidth = 2
        self.subCategoryInputTextField.layer.borderColor = HighlightColor.priorityHigh.cgColor
        
        self.setUpObservers()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        log.info(#function)
        super.viewDidDisappear(animated)
        self.removeObservers()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        log.warning("Recieved Memory Warning")
        // Dispose of any resources that can be recreated.
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //        defer{
        //            log.verbose("Segue transfer: \(segue.identifier)")
        //        }
        //
        //        if segue.identifier == Segue.SEGUE_CREATION_TO_SELECTION{
        //            let selectionViewController = segue.destination as! SelectionViewController
        //            selectionViewController.path = self.path
        //        }
        //        if segue.identifier == Segue.SEGUE_CREATION_TO_MAKE{
        //            let makeTableViewController = segue.destination as! MakeTableViewController
        //            makeTableViewController.path = self.path
        //        }
        //        if segue.identifier == Segue.SEGUE_CREATION_TO_MODEL{
        //            let array = Users_Wardrobe.selectedCloset[path[PathType.PATHTYPE_CATEGORY_STRING]!]![path[PathType.PATHTYPE_SUBCATEGORY_STRING]!]
        //
        //            let modelController = segue.destination as! ModelTableViewController
        //            modelController.arrayOfItems = array
        //            modelController.path = self.path
        //        }
        //        if segue.identifier == Segue.SEGUE_CREATION_TO_DETAIL{
        //            let detailedViewController = segue.destination as! DetailedViewController
        //            detailedViewController.path = self.path
        //        }
        
    }
    
}



//MARK: - IBAction Function -Extension CreateItemViewController
extension CreateItemViewController{
    @IBAction func createItem(_ sender: UIButton) {
        //TODO: -Implement save system
//        do{
//            saveItemVars()
//            try Users_Wardrobe.save(categorySelected, funcSubCategory: subCategorySelected, item: viewItem)
////        }
//        
//            
//        catch ItemError.incorrectSubCategory{
//            playSoundEffects(incorrectSFX)
//            let alert = UIAlertController(title: "SubCategory Missing", message: "Enter in correct subcateogry", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion:nil)
//        }catch ItemError.missingModelString{
//            playSoundEffects(incorrectSFX)
//            let alert = UIAlertController(title: "Model String Missing", message: "Enter in correct Model String", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion:nil)
//        }catch ItemError.addImage{
//            
//            playSoundEffects(incorrectSFX)
//            let alert = UIAlertController(title: "Image not selected", message: "Selctect image", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion:nil)
//        }catch{
//            playSoundEffects(incorrectSFX)
//            assertionFailure("Unknow error type thrown")
//        }
//        
//        subCategoryPickerView.reloadAllComponents()
//        subCategoryPickerView.reloadInputViews()
//        
//        
//        defaults.addAndSend("SAVE_BUTTON_BUTTON_PRESSED")
//        
//        performSegue(withIdentifier: Segue.SEGUE_CREATION_TO_SELECTION, sender: self)
    }
    @IBAction func setItemImage(_ sender: UIButton) {
        self.setImagePicker()
    }
    @IBAction func ClearInputs(_ sender: UIButton) {
        self.clear()
    }
    
    
    
    //MARK: -Action Sub Functions
    func saveItemVars(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        var tempDateReleased:String?
        var templastTimeWorn:String?
        var tempdatePurchased:String?
        let tempdateDeleted:String?
        
        //        if (dateReleased?.value != nil){
        //            tempDateReleased = dateFormatter.string(from: self.dateReleased!.value)
        //        }
        if (lastTimeWorn?.value != nil){
            viewItem.lastTimeWorn = lastTimeWorn?.value as! NSDate
        }
        //        if (datePurchased?.value != nil){
        //            tempdatePurchased = dateFormatter.string(from: self.datePurchased!.value)
        //        }
        if(model!.value != ""){viewItem.model = model!.value}else{viewItem.model = "N/A"}
        
        if(brand!.value != ""){viewItem.brand = brand!.value}else{viewItem.brand = "N/A"}
        
        viewItem.isFavorite = NSNumber(value: (favorited?.value)!)
        
        viewItem.price = Double((payedPrice!.value)!)!
        
        viewItem.timesWorn = Int16((timesWorn?.value)!)!
        
        //        if(templastTimeWorn != ""  && templastTimeWorn != nil){viewItem.lastTimeWorn = templastTimeWorn}else{viewItem.dateDeleted = "N/A"}
        
        //        if(kind!.value != ""){viewItem.kind = model!.value}else{viewItem.kind = "N/A"}
        
        //        if(size!.value != ""){viewItem.size = size!.value}else{viewItem.size = "N/A"}
        
        //        if(tempdatePurchased != ""  && tempdatePurchased != nil){viewItem.datePurchased = tempdatePurchased}else{viewItem.dateReleased = "N/A"}
        
        
        //        if(color!.value != ""){viewItem.color = color!.value}else{viewItem.color = "N/A"}
        
        //        if(secondaryColor!.value != ""){viewItem.secondaryColor = secondaryColor!.value}else{viewItem.secondaryColor = "N/A"}
        
        //        if(thirdColor!.value != ""){viewItem.thirdColor = thirdColor!.value}else{viewItem.thirdColor = "N/A"}
        
        if(itemNotes!.value != ""){viewItem.itemNotes = itemNotes!.value}else{viewItem.itemNotes = "N/A"}
        
        //        if(tempDateReleased != ""  && tempDateReleased != nil){viewItem.dateReleased = tempDateReleased}else{viewItem.dateReleased = "N/A"}
        
        //        viewItem.retailPrice = Double((retailPrice!.value)!)  ?? 0.0
        
        //        if(condition!.value != ""){viewItem.condition = condition!.value}else{viewItem.condition = "N/A"}
        
        //        if(primaryMaterial!.value != ""){viewItem.primaryMaterial = primaryMaterial!.value}else{viewItem.primaryMaterial = "N/A"}
        
        //        if(secondaryColor!.value != ""){viewItem.secondaryColor = secondaryColor!.value}else{viewItem.secondaryColor = "N/A"}
        
        //        if(sellerURL!.value != ""){viewItem.sellerURL = sellerURL!.value}else{viewItem.sellerURL = "N/A"}
        
        //        if(storeLocation!.value != ""){viewItem.storeLocation = storeLocation!.value}else{viewItem.storeLocation = "N/A"}
        
        //        if(sellerName!.value != ""){viewItem.sellerName = sellerName!.value}else{viewItem.sellerName = "N/A"}
        
        //        viewItem.isThisNew = isThisNew!.value  ?? false
        if (lastTimeWorn?.value != nil){
            viewItem.lastTimeWorn = lastTimeWorn?.value as? NSDate
        }
        if (dateDeleted?.value != nil){
            viewItem.dateDeleted = dateDeleted?.value! as! NSDate
        }
        
        //        self.addIdToItem()
        
    }
    func clear(){
        self.categoryInputTextField.text = ""
        self.subCategoryInputTextField.text = ""
        
        self.pictureForSelectedItemImage.image = UIImage(named: BLANK_IMAGE_STRING)
        
        
        self.model?.value = "N/A"
        self.brand?.value = "N/A"
        self.favorited?.value = false
        self.payedPrice?.value = "0.0"
        self.timesWorn?.value = "0.0"
        self.lastTimeWorn?.value = nil
        //        self.datePurchased?.value = nil
        //        self.color?.value = "N/A"
        //        self.secondaryColor?.value = "N/A"
        //        self.thirdColor?.value = "N/A"
        self.itemNotes?.value = "N/A"
        //        self.dateReleased?.value = nil
        //        self.retailPrice?.value = "0.0"
        //        self.condition?.value = "N/A"
        //        self.primaryMaterial?.value = "N/A"
        //        self.secondaryMaterial?.value = "N/A"
        //        self.sellerURL?.value = "N/A"
        //        self.isThisNew?.value = false
        
        self.tableView.reloadData()
        
        playSoundEffects(clearSFX)
    }
    //    func addIdToItem(){
    //        if Users_Wardrobe.closetSelectionString == MY_CLOSET{
    //            viewItem.id = Users_Wardrobe.countClosetUp()
    //        }else if Users_Wardrobe.closetSelectionString == MY_WANTS_CLOSET{
    //            viewItem.id = Users_Wardrobe.countWishlistDown()
    //        }
    //    }
}



//MARK: - Initializers Created Methods -Extension CreateItemViewController
extension CreateItemViewController{
    func setUp(){
        
        playSoundEffects(addSFX)
        self.setUI()
        self.setPickerInfo()
        self.animateAllButtons()
        
        viewItem = Item(context: context)
        
        GlobalUserInteractiveQueue.async(execute: {[unowned self] in
            self.initializeRETableView()
            self.setUpTableView()
        })
        
        viewItem.image = UIImagePNGRepresentation((UIImage(named: BLANK_IMAGE_STRING))!)! as NSData
    }//Sets up data
    func createBasicCells(){
        
    }
    func createMiscCells(){
        
    }
    //    func setTitle(){
    //        //TODO: -Fix magic values put in constant
    //        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: "Create Item")
    //        if self.title == MY_CLOSET{
    //            self.navigationController?.navigationBar.isTranslucent = false
    //            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
    //        }else if self.title == MY_WANTS_CLOSET{
    //            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
    //        }
    //    }
    func setPickerInfo(){
        GlobalUserInteractiveQueue.async(execute: {
            self.categoryPickerView.delegate = self
            self.categoryInputTextField.inputView = self.categoryPickerView
            
            
            //Sub-Category
            self.subCategoryPickerView.delegate = self
            self.subCategoryInputTextField.inputView = self.subCategoryPickerView
            self.subCategoryInputTextField.isEnabled = false
        })
    }
    func setUI(){
//        self.setTitle()
        self.pictureForSelectedItemImage.alpha = 0.5
    }
    func initializeRETableView(){
        self.manager = RETableViewManager.init(tableView: self.tableView, delegate: self)
        
        self.basicSection = RETableViewSection(headerTitle: "Basic Section")
//        self.miscSection = RETableViewSection(headerTitle: "Misc Section")
        
        self.model = RETextItem(title: "Model:", value: String(), placeholder: "Enter Item Name")
        self.model?.style
        //        self.brand = REPickerItem(title: "Brand", value: ["--:--"], placeholder: "--:--", options: ["1"])
        self.brand = RETextItem(title: "Brand:", value: String(), placeholder: "Enter Item brand")
        self.favorited = REBoolItem(title: "Favorite:", value: false)
        self.payedPrice = RENumberItem(title: "Originl Price:", value: String(), placeholder: "Enter Value for The Item")
        self.timesWorn = RENumberItem(title: "Times Worn/Used:", value: String(), placeholder: "Enter Value for times worn")
        self.lastTimeWorn = REDateTimeItem(title: "Last Time Worn:", value: nil , placeholder: nil, format: "MM-dd-yyyy", datePickerMode: UIDatePickerMode.date)
        //        self.kind = RETextItem(title: "Kind:", value: String(), placeholder: "Enter Item kind")
        //        self.size = RETextItem(title: "Size:", value: String(), placeholder: "Enter Item size")
        //        self.datePurchased = REDateTimeItem(title: "Date Purchased:", value: nil , placeholder: nil, format: "MM-dd-yyyy", datePickerMode: UIDatePickerMode.date)
        //        self.color = REPickerItem(title: "Color", value: COLOR_TYPE, placeholder: "Color", options: [])
        //        self.color = RETextItem(title: "Color:", value: String(), placeholder: "Enter Item color")
        //        //        self.secondaryColor = REPickerItem(title: "Secondary Color", value: COLOR_TYPE, placeholder: nil, options: [])
        //        self.secondaryColor = RETextItem(title: "SecondaryColor:", value: String(), placeholder: "Enter Item SecondaryColor")
        //        //        self.thirdColor = REPickerItem(title: "Third Color", value: COLOR_TYPE, placeholder: nil, options: [])
        //        self.thirdColor = RETextItem(title: "Third Color:", value: String(), placeholder: "Enter Item Third Color")
        self.itemNotes = RELongTextItem(title: "Item Notes:", value: String(), placeholder: nil)
        //        self.isThisNew = REBoolItem(title: "New Item:", value: false)
        //        self.dateReleased = REDateTimeItem(title: "Release Date", value: nil , placeholder: nil, format: "MM-dd-yyyy", datePickerMode: UIDatePickerMode.date)
        //        self.retailPrice = RENumberItem(title: "Paid Price:", value: String(), placeholder: "Enter Paid Price For The Item")
        //        //        self.condition = REPickerItem(title: "Item Condition", value: ItemAttributeName.ITEM_CONDITION, placeholder: "Item Condition", options:[])
        //        self.condition = RETextItem(title: "Condition:", value: String(), placeholder: "Enter Item condition")
        //        //        self.primaryMaterial = REPickerItem(title: "Primary Material", value: MATERIAL_TYPE, placeholder: "Material Type", options: [])
        //        self.primaryMaterial = RETextItem(title: "Primary Material:", value: String(), placeholder: "Enter Item Primary Material")
        //        //        self.secondaryMaterial = REPickerItem(title: "Secondary Material", value: MATERIAL_TYPE, placeholder: "Material Type", options: [])
        //        self.secondaryMaterial = RETextItem(title: "Secondary Material:", value: String(), placeholder: "Enter Secondary Material Name")
        //        self.sellerURL = RETextItem(title: "Store Location Or URL:", value: String(), placeholder: "Enter Location")
        //        self.storeLocation = RETextItem(title: "Store Location", value: self.viewItem.storeLocation, placeholder: "Enter Item storeLocation")
        //
        //        self.sellerName = RETextItem(title: "Seller Name", value: self.viewItem.sellerName, placeholder: "Enter Item Seller Name")
    }
    func setUpTableView(){
        self.manager?.style.setBackgroundImage(UIImage(named: "cellBlackPatternImage"), for: RETableViewCellType.single)
        //        self.manager!.tableView?.sectionIndexColor = UIColor.greenColor()
        self.manager!.tableView?.tintColor = UIColor.purple
        //        self.manager!.tableView?.sectionIndexBackgroundColor = UIColor.greenColor()
        self.manager!.tableView?.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        self.manager!.tableView?.backgroundColor = UIColor.green
        self.manager!.tableView?.separatorColor = UIColor.black
        
        
        self.manager!.addSection(basicSection)
        //        self.manager!.addSection(miscSection)
        
        self.basicSection?.addItem(favorited)
        self.basicSection?.addItem(model)
        self.basicSection?.addItem(brand)
        self.basicSection?.addItem(payedPrice)
        self.basicSection?.addItem(timesWorn)
        self.basicSection?.addItem(lastTimeWorn)
        //        self.basicSection?.addItem(kind)
        //        self.basicSection?.addItem(size)
        
        //        self.miscSection?.addItem(datePurchased)
        //        self.miscSection?.addItem(color)
        //        self.miscSection?.addItem(secondaryColor)
        //        self.miscSection?.addItem(thirdColor)
//        self.basicSection?.addItem(isThisNew)
        //        self.miscSection?.addItem(dateReleased)
        //        self.miscSection?.addItem(retailPrice)
        //        self.miscSection?.addItem(condition)
        //        self.miscSection?.addItem(primaryMaterial)
        //        self.miscSection?.addItem(secondaryMaterial)
        //        self.miscSection?.addItem(sellerURL)
        //        self.miscSection?.addItem(storeLocation)
        //        self.miscSection?.addItem(sellerName)
        self.basicSection?.addItem(itemNotes)
    }
}



//MARK: -Observer-Extension CreateItemViewController
extension CreateItemViewController{
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == ItemCreationProgress{
            self.itemCreationProgress()
            print("Observer Called")
        }else{
            print("Called notification for an observer thats not set up")
        }
    }
    func itemCreationProgress(){
        if categoryInputTextField == nil || categoryInputTextField.text == ""{
            self.categoryInputTextField.layer.borderWidth = 2
            self.categoryInputTextField.layer.borderColor = HighlightColor.priorityHigh.cgColor
            
            self.subCategoryInputTextField.layer.borderWidth = 2
            self.subCategoryInputTextField.layer.borderColor = HighlightColor.priorityHigh.cgColor
        }else{
            self.categoryInputTextField.layer.borderWidth = 2
            self.categoryInputTextField.layer.borderColor = HighlightColor.cleared.cgColor
            
        }
        
        if subCategoryInputTextField == nil || subCategoryInputTextField.text == ""{
            self.subCategoryInputTextField.layer.borderWidth = 2
            self.subCategoryInputTextField.layer.borderColor = HighlightColor.priorityHigh.cgColor
        }else{
            self.subCategoryInputTextField.layer.borderWidth = 2
            self.subCategoryInputTextField.layer.borderColor = HighlightColor.cleared.cgColor
            
        }
        
    }
}

//MARK: -Animation-Extension CreateItemViewController
extension CreateItemViewController{
}



//MARK: - PickerView Methods -Extension CreateItemViewController
extension CreateItemViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPickerView{
            return categoryPickerOptions.count
        }else if pickerView == subCategoryPickerView{
            let pickerRowsPlusAddFieldOption = subCategoryPickerOptions.count + 1
            
            
            return pickerRowsPlusAddFieldOption
            //        }else if pickerView == cellBrandPickerView{
            //            let brandArrayPlus1 = Users_Wardrobe.brandCollection.count + 1
            //
            //
            //            return brandArrayPlus1
            //
        }
        assertionFailure("This shouldn't be happening")
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoryPickerView{
            return categoryPickerOptions[row]
        }else if pickerView == subCategoryPickerView{
            if row == (subCategoryPickerOptions.count){
                
                return "Add New Sub-Category"
            }else{
                return subCategoryPickerOptions[row]
            }
            //        }else if pickerView == cellBrandPickerView{//if pickerView == cellPickerView{
            //            if row == (Users_Wardrobe.brandCollection.count){
            //                return "Add New Sub-Category"
            //            }else{
            //                return Users_Wardrobe.brandCollection[row]
        }
        assertionFailure("This shouldn't be happening")
        return String()
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPickerView{
            subCategoryInputTextField.inputView = subCategoryPickerView
            subCategoryPickerView.delegate = self
            self.pictureForSelectedItemImage.alpha = 0.5
            categorySelected = categoryPickerOptions[row]
            categoryInputTextField.text = categorySelected
            subCategoryInputTextField.isEnabled = true
            //            self.tableView.hidden = true
            subCategoryPickerOptions.removeAll(keepingCapacity: false)
            
            
            //TODO: - Add items being grabbed and displaying the multiple kinds of cateogries availabe by putting them in the array
            let items = [Item]()
            
            for itemTemp in items{
                let subCat = itemTemp.subCategory
                subCategoryPickerOptions.append(subCat!)
            }
            
            subCategoryInputTextField.text = String()
            
        }else if pickerView == subCategoryPickerView{
            defer{
                //                self.tableView.dataSource = self
                //                self.tableView.delegate = self
                //                self.tableView.reloadData()
                //                self.tableView.hidden = false
            }
            if row == (subCategoryPickerOptions.count){
                subCategoryInputTextField.inputView = nil
                subCategoryInputTextField.reloadInputViews()
                subCategoryInputTextField.delegate = self
                subCategoryInputTextField.text = String()
                self.pictureForSelectedItemImage.alpha = 1.0
            }else{
                subCategorySelected = subCategoryPickerOptions[row]
                subCategoryInputTextField.text = subCategorySelected
                self.pictureForSelectedItemImage.alpha = 1.0
            }
            
        }
    }
}



//MARK: - ImagePickerView Methods -Extension CreateItemViewController
extension CreateItemViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setImagePicker(){
        //Set ImagePicker
        let imagePicker = UIImagePickerController()
        //Set Picker delegeate
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        //Set ImagePicker options
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = true
        
        //Present the image picker on screen
        self.present(imagePicker, animated: true, completion: nil)
    }
    //After image is selected the item image is set to that image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //var video = info[UIImagePickerControllerMediaURL] as? NSURL
        let picture = info[UIImagePickerControllerOriginalImage] as? UIImage
        pictureForSelectedItemImage.image = picture
        viewItem.image = UIImagePNGRepresentation(picture!) as! NSData
        //pictureButtonForSelectedItemImage.setImage(picture, forState: UIControlState.Normal)
        //Dismiss Pickerview
        self.dismiss(animated: true, completion: nil)
    }
}



//MARK: -Field methods -Extension CreateItemViewController
extension CreateItemViewController: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        
        textField.isFirstResponder
        return true
        
    }// return NO to disallow editing.
    func textFieldDidBeginEditing(_ textField: UITextField){
        textField.becomeFirstResponder()
    } // became first responder
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    } // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    func textFieldDidEndEditing(_ textField: UITextField){
        if textField == subCategoryInputTextField{
            subCategorySelected = subCategoryInputTextField.text
        }
        
        textField.resignFirstResponder()
        
    } // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    func textFieldShouldClear(_ textField: UITextField) -> Bool{
        log.info("textField: " + textField.text! + " cleared")
        return true
    } // called when clear button pressed. return NO to ignore (no notifications)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Next as return button, for other fields
        if textField == categoryInputTextField{
            categorySelected = categoryInputTextField.text
            subCategoryInputTextField.delegate = self
            subCategoryInputTextField.becomeFirstResponder()
        }else if textField == subCategoryInputTextField{
            subCategorySelected = subCategoryInputTextField.text
            subCategoryPickerOptions.append(subCategorySelected)
            subCategoryPickerView.removeFromSuperview()
            
            //            self.tableView.dataSource = self
            //            self.tableView.delegate = self
            //            self.tableView.reloadData()
            //            self.tableView.hidden =
        }
        return true
    }
}



//MARK: - UI-CreateItemViewController Extension
extension CreateItemViewController{
    func animateAllButtons(){
        self.animateImage()
        self.animateButtons()
        
        //    self.animateLogo()
        //    self.animateViews()
        
    }
    func animateLogo(){
        //    logoCustomization(self.logoImage)
    }
    func animateImage(){
        imageCustomization(self.pictureForSelectedItemImage)
    }
    func animateButtons(){
        clearButtonCustomization(self.clearButton)
        addButtonCustomization(self.saveButton)
        nameLabelCustomizer(self.categoryLabel)
        nameLabelCustomizer(self.subCategoryLabel)
    }
}



//MARK: - Observers/Notifications-CreateItemViewController Extension
extension CreateItemViewController{
    func setUpObservers(){
        self.categoryInputTextField.addObserver(self, forKeyPath: ItemCreationProgress, options: NSKeyValueObservingOptions.new, context: nil)
        self.subCategoryInputTextField.addObserver(self, forKeyPath: ItemCreationProgress, options: NSKeyValueObservingOptions.new, context: nil)
        
    }
    func removeObservers(){
        self.categoryInputTextField.removeObserver(self, forKeyPath: ItemCreationProgress)
        self.subCategoryInputTextField.removeObserver(self, forKeyPath: ItemCreationProgress)
    }
}

//MARK: -Anylitics-CreateItemViewController Extension
//    extension CreateItemViewController{
//        func logPageView(){
//            GlobalBackgroundQueue.async(execute: {
//                GlobalBackgroundQueue.async{
//
//                let pageCount:Int? = defaults.returnIntValue("CREATE_PAGE_COUNT")
//                let saveButtonPressed:Int? = defaults.returnIntValue("SAVE_BUTTON_BUTTON_PRESSED")
//
//
//                Answers.logContentView(withName: "Create Content View",
//                    contentType: "Create Item View",
//                    contentId: "MF7",
//                    customAttributes: ["CREATE_PAGE_COUNT": pageCount!,
//                        "SAVE_BUTTON_BUTTON_PRESSED": saveButtonPressed!
//                    ])
//             }
//        }
//}

