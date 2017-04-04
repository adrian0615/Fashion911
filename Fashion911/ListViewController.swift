//
//  ListViewController.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 3/31/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
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
    
    let dateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var contactLabel: UILabel!
    @IBOutlet var eventLabel: UILabel!
    @IBOutlet var heightBodyLabel: UILabel!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var colorsLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var stylistFeeLabel: UILabel!
    
    @IBOutlet var imageVIew: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Confirmation"
        
        if UIImage(named: "FashionBackground") != nil {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "FashionBackground")!)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:
            "Website", style: .plain, target: self, action:
            #selector(websiteButtonTapped))
        
        displayMyAlertMessage(userMessage: "Full application coming soon.  Please visit our website.")
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        
        let eventDate = dateFormatter.string(from: Date(timeIntervalSince1970: (date) / 1000))
        
        let eventTime = timeFormatter.string(from: Date(timeIntervalSince1970: (date) / 1000))
        
        if details == "Extra Details?" {
            details = "No Extra Details Provided"
        }
        
        nameLabel.text = "Name: \(firstName) \(lastName)"
        addressLabel.text = "Location: \(address), \(city), \(state) \(zip)"
        contactLabel.text = "Phone: \(phone) | Email: \(email)"
        eventLabel.text = "Event: \(eventType) on \(eventDate) at \(eventTime)"
        heightBodyLabel.text = "Height: \(height) | Body Type: \(bodyType)"
        sizeLabel.text = "Size(s): \(size)"
        colorsLabel.text = "Colors: You like \(likedColors) and don't like \(dislikedColors)"
        descriptionLabel.text = "Additional Information: \(details)"
        stylistFeeLabel.text = "Budget: \(budget) | Stylist Fee: \(stylistFee)"
        
        imageVIew.image = image
        
    }
    
    func displayMyAlertMessage(userMessage: String) {
        
        OperationQueue.main.addOperation {
            
            let myAlert = UIAlertController(title: "Thank You for Testing Fashion 911 Beta!", message: userMessage, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            myAlert.addAction(action)
            
            self.present(myAlert, animated: true, completion: nil)
            
            return
        }
    }
    
    func websiteButtonTapped(_ sender: UIBarButtonItem) {
        
        let websiteVC = self.storyboard!.instantiateViewController(withIdentifier: "WebsiteViewController") as! WebsiteViewController
        
        self.navigationController?.pushViewController(websiteVC, animated:
            true)
        
        return
    }
    
}
