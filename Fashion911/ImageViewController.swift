//
//  ImageViewController.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 3/27/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
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
    
    var imagePicker: UIImagePickerController!
    

    @IBOutlet var uploadPhotoButton: UIButton!
    @IBOutlet var takePhotoButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func uploadButtonTapped(_ sender: Any) {
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func takePhotoButtonTapped(_ sender: Any) {
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Image"
        
        if UIImage(named: "FashionBackground") != nil {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "FashionBackground")!)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:
            "Next", style: .plain, target: self, action:
            #selector(nextButtonTapped))
        
        navigationController?.navigationBar.tintColor = UIColor.white

        imageView.isHidden = true
        
        uploadPhotoButton.layer.borderColor = UIColor.white.cgColor
        uploadPhotoButton.layer.borderWidth = 1
        
        takePhotoButton.layer.borderColor = UIColor.white.cgColor
        takePhotoButton.layer.borderWidth = 1
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.isHidden = false
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            imageView.image = image
        } else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        } else {
           displayMyAlertMessage(userMessage: "Unable to select image.  Try again later.")
            dismiss(animated: true, completion: nil)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func nextButtonTapped(_ sender: UIBarButtonItem) {
        
        if imageView.image != nil {
            image = imageView.image!
        }
        
        
        
        let addressVC = self.storyboard!.instantiateViewController(withIdentifier: "AddressViewController") as! AddressViewController
        
        addressVC.firstName = firstName
        addressVC.lastName = lastName
        addressVC.phone = phone
        addressVC.email = email
        addressVC.eventType = eventType
        addressVC.date = date
        addressVC.height = height
        addressVC.bodyType = bodyType
        addressVC.size = size
        addressVC.likedColors = likedColors
        addressVC.dislikedColors = dislikedColors
        addressVC.details = details
        addressVC.image = image
        
        self.navigationController?.pushViewController(addressVC, animated:
            true)
        
        return
    }
    
    func displayMyAlertMessage(userMessage: String) {
        
        OperationQueue.main.addOperation {
            
            let myAlert = UIAlertController(title: "Thank You", message: userMessage, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            myAlert.addAction(action)
            
            self.present(myAlert, animated: true, completion: nil)
            
            return
        }
    }


}
