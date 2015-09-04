//
//  NotesViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 9/3/15.
//  Copyright © 2015 BangBangStudios. All rights reserved.
//
import Foundation
import UIKit
      
enum NotesError: ErrorType{
    case NoValue, IncorrectValue
}

class NotesViewController: UIViewController {
    var notesArray = [String]()
    
    /// Textfield that takes new  not
    var notesTextView = UITextView()
    var notesTextViewLabel = UILabel()
    var notesNoteLabel = UILabel()
    var notesTextField = UITextField()
    var notesSaveButton = UIButton()
    
    var notesTextViewRec = CGRect()
    var notesTextViewLabelRec = CGRect()
    var notesNoteLabelRec = CGRect()
    var notesTextFieldRec = CGRect()
    var notesSaveButtonRec = CGRect()
    
    func loadNotes(){
        let myDefault = NSUserDefaults.standardUserDefaults()
//        for (index, value) in myDefault.{
//            notesArray.append(value)
//        }
        
    }
    func save(){
        let string = notesTextField.text
        
        notesArray.append(string!)
        
        let myDefault = NSUserDefaults.standardUserDefaults()
        
        myDefault.setValue(string, forKey: string!)
        
        myDefault.synchronize()
    }
    
    func setOutlets(){
        notesTextView = UITextView(frame: CGRect())
        notesTextViewLabel = UILabel(frame: CGRect())
        notesNoteLabel = UILabel(frame: CGRect())
        notesTextField = UITextField(frame: CGRect())
        notesSaveButton = UIButton(frame: CGRect())
        
        
        //UILabel
        //buttonWithType returns type AnyObject, so you need to cast it as a UIButton
//        var label: UILabel = UILabel()
//        label.frame = CGRectMake(50, 50, 200, 21)
//        label.backgroundColor = UIColor.blackColor()
//        label.textColor = UIColor.whiteColor()
//        label.textAlignment = NSTextAlignment.Center
//        label.text = "test label"
//        self.view.addSubview(label)
        
        //UIButton
//        var button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
//        button.frame = CGRectMake(100, 100, 100, 50)
//        button.backgroundColor = UIColor.greenColor()
//        button.setTitle("Button", forState: UIControlState.Normal)
//        button.addTarget(self, action: "Action:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(button)
        
        //UITextField
//        var txtField: UITextField = UITextField()
//        txtField.frame = CGRectMake(50, 70, 200, 30)
//        txtField.backgroundColor = UIColor.grayColor()
//        self.view.addSubview(txtField)



        
        setOutletsSize()
        
        self.view.addSubview(notesTextView)
        self.view.addSubview(notesTextViewLabel)
        self.view.addSubview(notesNoteLabel)
        self.view.addSubview(notesTextField)
        self.view.addSubview(notesSaveButton)
        
    }
    func setOutletsSize(){
        //View Size
        let viewSize = self.view.bounds.size

        //
        let notesTextViewLabelRec = CGRect(x: 0, y: 0,
                                    width: viewSize.width * 0.25, height: viewSize.height * 0.10)
        
        notesTextViewLabel.frame = notesTextViewLabelRec
        
        //
        let notesTextViewRec = CGRect(x:notesTextViewLabelRec.origin.x + notesTextViewLabelRec.size.width, y:notesTextViewLabelRec.origin.y + notesTextViewLabelRec.size.height, width: viewSize.width * 0.25, height: viewSize.height * 0.80)
        
        notesTextView.frame = notesTextViewRec
        
        //
        let notesNoteLabelRec = CGRect(x: notesTextViewRec.origin.x * 1.2, y: 0,
                                width: viewSize.width * 0.70, height: viewSize.height * 0.10)
        
        //
        notesNoteLabel.frame = notesNoteLabelRec
        
        //
        let notesTextFieldRec = CGRect(x: notesNoteLabelRec.width * 1.3, y: notesNoteLabelRec.origin.y + notesNoteLabelRec.size.height,
                                width: viewSize.width * 0.70, height: viewSize.height * 0.80)
        
        notesTextField.frame = notesTextFieldRec
        
        //
        let notesSaveButtonRec = CGRect(x: notesTextFieldRec.origin.x + notesTextFieldRec.size.width, y: notesTextFieldRec.origin.y, width: viewSize.width * 0.25, height: viewSize.height * 0.10)
        
        notesSaveButton.frame = notesSaveButtonRec
//
//        self.showDetailViewController(notesTextField, sender: self)
//        self.addChildViewController(notesTextViewLabel)
//        self.addChildViewController(notesTextView)
//        self.addChildViewController(notesNoteLabel)
//        self.addChildViewController(notesNoteLabel)
//        self.addChildViewController(notesTextField)
    }
}
