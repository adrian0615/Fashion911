//
//  SizeViewController.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 3/27/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit

class SizeViewController: UIViewController {
    
    
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

    @IBOutlet var clothingSizeField: UITextField!
    @IBOutlet var colorsLikeField: UITextField!
    @IBOutlet var colorsDontLikeField: UITextField!
    @IBOutlet var extraDetailsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Clothing Info"
        
        if UIImage(named: "FashionBackground") != nil {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "FashionBackground")!)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:
            "Next", style: .plain, target: self, action:
            #selector(nextButtonTapped))
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        hideKeyboardWhenTappedAround()
        
        clothingSizeField.layer.borderColor = UIColor.lightGray.cgColor
        clothingSizeField.layer.borderWidth = 1
        
        colorsLikeField.layer.borderColor = UIColor.lightGray.cgColor
        colorsLikeField.layer.borderWidth = 1
        
        colorsDontLikeField.layer.borderColor = UIColor.lightGray.cgColor
        colorsDontLikeField.layer.borderWidth = 1
        
        extraDetailsView.layer.borderColor = UIColor.lightGray.cgColor
        extraDetailsView.layer.borderWidth = 1
        
    }
    
    func nextButtonTapped(_ sender: UIBarButtonItem) {
        
        if (clothingSizeField.text?.isEmpty)! || (colorsLikeField.text?.isEmpty)! || (colorsDontLikeField.text?.isEmpty)! {
            
            displayMyAlertMessage(userMessage: "All fields are required")
            
            return
        }
        
        
        size = clothingSizeField.text!
        likedColors = colorsLikeField.text!
        dislikedColors = colorsDontLikeField.text!
        details = extraDetailsView.text
        
        
        let imageVC = self.storyboard!.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        
        imageVC.firstName = firstName
        imageVC.lastName = lastName
        imageVC.phone = phone
        imageVC.email = email
        imageVC.eventType = eventType
        imageVC.date = date
        imageVC.height = height
        imageVC.bodyType = bodyType
        imageVC.size = size
        imageVC.likedColors = likedColors
        imageVC.dislikedColors = dislikedColors
        imageVC.details = details
        
        
        self.navigationController?.pushViewController(imageVC, animated:
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
