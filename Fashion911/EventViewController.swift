//
//  EventViewController.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 3/27/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    var eventType: String = " "
    var date: TimeInterval = 1491109500000
    
    let types: [String] = ["Anniversary","Birthday", "Cocktail Party", "Day Party", "Formal/Gala", "Wedding", "Other"]
    
    
    @IBOutlet var eventPicker: UIPickerView!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Event Info"
        
        if UIImage(named: "FashionBackground") != nil {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "FashionBackground")!)
        }
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:
            "Next", style: .plain, target: self, action:
            #selector(nextButtonTapped))
        
    
        navigationController?.navigationBar.tintColor = UIColor.white
        
        eventPicker.delegate = self
        eventPicker.dataSource = self
        
        eventPicker.layer.borderColor = UIColor.lightGray.cgColor
        eventPicker.layer.borderWidth = 1
        
        datePicker.backgroundColor = UIColor.white
        datePicker.layer.borderColor = UIColor.lightGray.cgColor
        datePicker.layer.borderWidth = 1
        datePicker.timeZone = TimeZone.current
        
        // Do any additional setup after loading the view.
    }
    
    func nextButtonTapped(_ sender: UIBarButtonItem) {
        
        if eventType == " " {
            eventType = "Anniversary"
        }
        
        
    
        let eventDate: Date = datePicker.date
        
        
        date = eventDate.timeIntervalSince1970 * 1000
        
        let profileVC = self.storyboard!.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        profileVC.eventType = eventType
        profileVC.date = date
        
        self.navigationController?.pushViewController(profileVC, animated:
            true)
        
        return
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return types[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        eventType = self.types[row]
    }
    

}
