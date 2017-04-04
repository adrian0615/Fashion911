//
//  BodyViewController.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 3/27/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit

class BodyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var firstName: String = " "
    var lastName: String = " "
    var phone: String = " "
    var email: String = " "
    var eventType: String = " "
    var date: TimeInterval = 1491109500000
    var height: String = " "
    var bodyType: String = " "
    
    let heights: [String] = ["Under 4'8\"", "4'8\"", "4'9\"", "4'10\"", "4'11\"", "5'0\"", "5'1\"", "5'2\"", "5'3\"", "5'4\"", "5'5\"", "5'6\"", "5'7\"", "5'8\"", "5'9\"", "5'10\"", "5'11\"", "6'0\"", "6'1\"", "6'2\"", "6'3\"", "6'4\"", "6'5\"", "6'6\"", "6'7\"", "6'8\"", "6'9\"", "6'10\"", "6'11\"", "7'0\"+"]
    
    let bodyTypes: [String] = ["Slim/Thin", "Athletic/Toned", "Average", "Full Figured/Muscular", "Big & Tall/BBW"]

    @IBOutlet var heightPicker: UIPickerView!
    @IBOutlet var bodyTypePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Body Info"
        
        if UIImage(named: "FashionBackground") != nil {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "FashionBackground")!)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:
            "Next", style: .plain, target: self, action:
            #selector(nextButtonTapped))
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        heightPicker.delegate = self
        heightPicker.dataSource = self
        
        heightPicker.layer.borderColor = UIColor.lightGray.cgColor
        heightPicker.layer.borderWidth = 1
        
        bodyTypePicker.delegate = self
        bodyTypePicker.dataSource = self
        
        bodyTypePicker.layer.borderColor = UIColor.lightGray.cgColor
        bodyTypePicker.layer.borderWidth = 1
        
        // Do any additional setup after loading the view.
    }
    
    func nextButtonTapped(_ sender: UIBarButtonItem) {
        
        if height == " " {
            height = "Under 4'8\""
        }
        
        if bodyType == " " {
            bodyType = "Slim/Thin"
        }
        
        let sizeVC = self.storyboard!.instantiateViewController(withIdentifier: "SizeViewController") as! SizeViewController
        
        sizeVC.firstName = firstName
        sizeVC.lastName = lastName
        sizeVC.phone = phone
        sizeVC.email = email
        sizeVC.eventType = eventType
        sizeVC.date = date
        sizeVC.height = height
        sizeVC.bodyType = bodyType
        
        
        self.navigationController?.pushViewController(sizeVC, animated:
            true)
        
        return
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var count = 0
        
        if pickerView == heightPicker {
            count = heights.count
        }
        
        if pickerView == bodyTypePicker {
        count = bodyTypes.count
        }
        
        return count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var selection: String = " "
        
        if pickerView == heightPicker {
            selection = heights[row]
        }
        
        if pickerView == bodyTypePicker {
            selection = bodyTypes[row]
        }
        
        return selection
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if pickerView == heightPicker {
            height = self.heights[row]
        }
        
        if pickerView == bodyTypePicker {
            bodyType = self.bodyTypes[row]
        }
    
    }
    
}
