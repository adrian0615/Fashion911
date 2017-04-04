//
//  ProfileViewController.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 3/27/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var firstName: String = " "
    var lastName: String = " "
    var phone: String = " "
    var email: String = " "
    var eventType: String = " "
    var date: TimeInterval = 1491109500000

    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var emailField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contact Info"
        
        if UIImage(named: "FashionBackground") != nil {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "FashionBackground")!)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:
            "Next", style: .plain, target: self, action:
            #selector(nextButtonTapped))
        
        hideKeyboardWhenTappedAround()
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        firstNameField.layer.borderColor = UIColor.lightGray.cgColor
        firstNameField.layer.borderWidth = 1
        
        lastNameField.layer.borderColor = UIColor.lightGray.cgColor
        lastNameField.layer.borderWidth = 1
        
        phoneField.layer.borderColor = UIColor.lightGray.cgColor
        phoneField.layer.borderWidth = 1
        
        emailField.layer.borderColor = UIColor.lightGray.cgColor
        emailField.layer.borderWidth = 1

        // Do any additional setup after loading the view.
    }
    
    func nextButtonTapped(_ sender: UIBarButtonItem) {
        
        if (firstNameField.text?.isEmpty)! || (lastNameField.text?.isEmpty)! || (phoneField.text?.isEmpty)! || (emailField.text?.isEmpty)! {
            
            displayMyAlertMessage(userMessage: "All fields are required")
            
            return
        }
        
        let emailText = emailField.text!
        let phoneText = phoneField.text!
        
        if emailText.isValidEmailAddress == false && phoneText.isValidPhoneNumber == false {
            displayMyAlertMessage(userMessage: "Please enter valid phone number and email address")
            
            return
        }
        
        if emailText.isValidEmailAddress == false {
            displayMyAlertMessage(userMessage: "Please enter valid email address")
            
            return
        }
        
        if phoneText.isValidPhoneNumber == false {
            displayMyAlertMessage(userMessage: "Please enter valid phone number")
            
            return
        }
        
        firstName = firstNameField.text!
        lastName = lastNameField.text!
        phone = phoneField.text!
        email = emailField.text!
        
        let bodyVC = self.storyboard!.instantiateViewController(withIdentifier: "BodyViewController") as! BodyViewController
        
        bodyVC.firstName = firstName
        bodyVC.lastName = lastName
        bodyVC.phone = phone
        bodyVC.email = email
        bodyVC.eventType = eventType
        bodyVC.date = date
        
        
        self.navigationController?.pushViewController(bodyVC, animated:
            true)
        
        return
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
    
    var isValidEmailAddress: Bool {
        let types: NSTextCheckingResult.CheckingType = [.link]
        let linkDetector = try? NSDataDetector(types: types.rawValue)
        let range = NSMakeRange(0, self.characters.count)
        let result = linkDetector?.firstMatch(in: self, options: .reportCompletion, range: range)
        let scheme = result?.url?.scheme ?? ""
        return scheme == "mailto" && result?.range.length == self.characters.count
    }
    
    var isValidPhoneNumber: Bool {
        let types: NSTextCheckingResult.CheckingType = [.phoneNumber]
        let phoneNumberDetector = try? NSDataDetector(types: types.rawValue)
        let range = NSMakeRange(0, self.characters.count)
        let result = phoneNumberDetector?.firstMatch(in: self, options: .reportCompletion, range: range)
        let scheme = result?.phoneNumber ?? ""
        return scheme == self && result?.range.length == self.characters.count && self.characters.count > 9
        
    }

}
