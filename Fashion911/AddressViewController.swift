//
//  AddressViewController.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 3/27/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let userPost = UserPost()
    
    var firstName: String = " "
    var lastName: String = " "
    var phone: String = " "
    var email: String = " "
    var eventType: String = " "
    var date: TimeInterval = 1491109500000
    var height: String = " "
    var bodyType: String = " "
    var size: String = " "
    var likedColors: String = " "
    var dislikedColors: String = " "
    var details: String = " "
    var image: UIImage = UIImage(named: "silhouette-photo")!
    var address: String = " "
    var city: String = " "
    var state: String = " "
    var zip: String = " "
    var budget: String = " "
    var stylistFee: String = " "
    
    
    var budgets: [String] = ["Under $300", "$300 - $499", "Over $500"]

    @IBOutlet var addressField: UITextField!
    @IBOutlet var addressTwoField: UITextField!
    @IBOutlet var cityField: UITextField!
    @IBOutlet var stateField: UITextField!
    @IBOutlet var zipCodeField: UITextField!
    
    @IBOutlet var budgetPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Final Steps"
        
        if UIImage(named: "FashionBackground") != nil {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "FashionBackground")!)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:
            "Submit", style: .plain, target: self, action:
            #selector(submitButtonTapped))
        
        hideKeyboardWhenTappedAround()
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        addressField.layer.borderColor = UIColor.lightGray.cgColor
        addressField.layer.borderWidth = 1
        
        addressTwoField.layer.borderColor = UIColor.lightGray.cgColor
        addressTwoField.layer.borderWidth = 1
        
        cityField.layer.borderColor = UIColor.lightGray.cgColor
        cityField.layer.borderWidth = 1
        
        stateField.layer.borderColor = UIColor.lightGray.cgColor
        stateField.layer.borderWidth = 1
        
        zipCodeField.layer.borderColor = UIColor.lightGray.cgColor
        zipCodeField.layer.borderWidth = 1
        
        budgetPicker.delegate = self
        budgetPicker.dataSource = self
        
        budgetPicker.layer.borderColor = UIColor.lightGray.cgColor
        budgetPicker.layer.borderWidth = 1
        
    }
    
    func submitButtonTapped(_ sender: UIBarButtonItem) {
        
        if (addressField.text?.isEmpty)! || (cityField.text?.isEmpty)! || (stateField.text?.isEmpty)! || (zipCodeField.text?.isEmpty)! {
            
            displayMyAlertMessage(userMessage: "All fields are required")
            return
        }
        
        if zipCodeField.text?.isValidZipCode == false {
            displayMyAlertMessage(userMessage: "Please enter 5-digit zip code")
            
            return
        }
        
        
        if budget == " " {
            budget = "Under $300"
        }
        if budget == "Under $300" {
            stylistFee = "$100"
        }
        if budget == "$300 - $499" {
            stylistFee = "$150"
        }
        if budget == "Over $500" {
            stylistFee = "$200"
        }
        
        if addressTwoField.text?.isEmpty == false {
            address = "\(addressField.text!), \(addressTwoField.text!)"
        } else {
            address = addressField.text!
        }
        city = cityField.text!
        state = stateField.text!
        zip = zipCodeField.text!
        
        
        /*userPost.postRegister(firstName: firstName, lastName: lastName, email: email, phone: phone, address: address, city: city, state: state, zip: zip, height: height, size: size, bodyType: bodyType, eventType: eventType, eventTime: date, image: image, likedColors: likedColors, dislikedColors: dislikedColors, description: details, clothingBudget: budget, stylistFee: stylistFee) { result in
            switch result {
                
            case let .success(user):
                
                OperationQueue.main.addOperation {
                    
                    let listVC = self.storyboard!.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
                    
                    listVC.firstName = user.firstName
                    listVC.lastName = user.lastName
                    listVC.phone = user.phone
                    listVC.email = user.email
                    listVC.eventType = user.eventType
                    listVC.date = user.eventTime
                    listVC.height = user.height
                    listVC.bodyType = user.bodyType
                    listVC.size = user.size
                    listVC.likedColors = user.likedColors
                    listVC.dislikedColors = user.dislikedColors
                    listVC.details = user.description
                    listVC.image = user.image
                    listVC.address = user.address
                    listVC.city = user.city
                    listVC.state = user.state
                    listVC.zip = user.zip
                    listVC.budget = user.clothingBudget
                    listVC.stylistFee = user.stylistFee
                    
                    self.navigationController?.pushViewController(listVC, animated:
                        true)
                    return
                }
            case let .failureWrongInfo(errorMessage) :
                print(errorMessage)
                self.displayMyAlertMessage(userMessage: "Unable to submit data.  Please try again.")
                
            case let .failure(error) :
                print("Failed to Register: \(error)")
            }
        }*/
        
        let listVC = self.storyboard!.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        listVC.firstName = firstName
        listVC.lastName = lastName
        listVC.phone = phone
        listVC.email = email
        listVC.eventType = eventType
        listVC.date = date
        listVC.height = height
        listVC.bodyType = bodyType
        listVC.size = size
        listVC.likedColors = likedColors
        listVC.dislikedColors = dislikedColors
        listVC.details = details
        listVC.image = image
        listVC.address = address
        listVC.city = city
        listVC.state = state
        listVC.zip = zip
        listVC.budget = budget
        listVC.stylistFee = stylistFee
        
        self.navigationController?.pushViewController(listVC, animated:
            true)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return budgets.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return budgets[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        budget = self.budgets[row]
    }
    
    func displayMyAlertMessage(userMessage: String) {
        
        OperationQueue.main.addOperation {
            
            let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            myAlert.addAction(action)
            
            self.present(myAlert, animated: true, completion: nil)
            
            return
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

}

extension String {
    
    var isValidZipCode: Bool {
        
        if self.characters.count == 5 {
            return true
        }
        return false
    }
}
