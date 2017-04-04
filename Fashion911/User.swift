//
//  User.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 3/17/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import Foundation
import UIKit



class User : Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.email == rhs.email && lhs.phone == rhs.phone && lhs.address == rhs.address && lhs.city == rhs.city && lhs.state == rhs.state && lhs.zip == rhs.zip && lhs.userId == rhs.userId && lhs.height == rhs.height && lhs.size == rhs.size && lhs.bodyType == rhs.bodyType && lhs.eventType == rhs.eventType && lhs.eventTime == rhs.eventTime && lhs.likedColors == rhs.likedColors && lhs.dislikedColors == rhs.dislikedColors && lhs.description == rhs.description && lhs.clothingBudget == rhs.clothingBudget && lhs.stylistFee == rhs.stylistFee
    }
    
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var address: String
    var city: String
    var state: String
    var zip: String
    var userId: Int
    var height: String
    var size: String
    var bodyType: String
    var eventType: String
    var eventTime: TimeInterval
    var image: UIImage
    var likedColors: String
    var dislikedColors: String
    var description: String
    var clothingBudget: String
    var stylistFee: String
    
    
    
    init(firstName: String, lastName: String, email: String, phone: String, address: String, city: String, state: String, zip: String, userId: Int, height: String, size: String, bodyType: String, eventType: String, eventTime: TimeInterval, image: UIImage, likedColors: String, dislikedColors: String, description: String, clothingBudget: String, stylistFee: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.userId = userId
        self.height = height
        self.size = size
        self.bodyType = bodyType
        self.eventType = eventType
        self.eventTime = eventTime
        self.image = image
        self.likedColors = likedColors
        self.dislikedColors = dislikedColors
        self.description = description
        self.clothingBudget = clothingBudget
        self.stylistFee = stylistFee
    }
    
    convenience init?(jsonObject: [String: Any]) {
        
        
        let userImage = jsonObject["image"] as? String
        
        
        guard let userFirst = jsonObject["firstName"] as? String,
            let userLast = jsonObject["lastName"] as? String,
            let userEmail = jsonObject["email"] as? String,
            let userPhone = jsonObject["phoneNumber"] as? String,
            let userAddress = jsonObject["address"] as? String,
            let userCity = jsonObject["city"] as? String,
            let userState = jsonObject["state"] as? String,
            let userZip = jsonObject["zipCode"] as? String,
            let theUserId = jsonObject["id"] as? Int,
            let userHeight = jsonObject["height"] as? String,
            let userSize = jsonObject["size"] as? String,
            let userBodyType = jsonObject["bodyType"] as? String,
            let userEventType = jsonObject["eventType"] as? String,
            let userEventTime = jsonObject["timestamp"] as? TimeInterval,
            let userLikedColors = jsonObject["colorsLiked"] as? String,
            let userDislikedColors = jsonObject["colorsDisliked"] as? String,
            let userDescription = jsonObject["description"] as? String,
            let userClothingBudget = jsonObject["budget"] as? String,
            let userStylistFee = jsonObject["fee"] as? String else {
                return nil
        }
        
        var photo = UIImage(named: "silhouette-photo")
        if userImage != nil {
            let imageData = Data(base64Encoded: userImage!)
            photo = UIImage(data: imageData!)
        }
        
        
        self.init(firstName: userFirst, lastName: userLast, email: userEmail, phone: userPhone, address: userAddress, city: userCity, state: userState, zip: userZip, userId: theUserId, height: userHeight, size: userSize, bodyType: userBodyType, eventType: userEventType, eventTime: userEventTime, image: photo!, likedColors: userLikedColors, dislikedColors: userDislikedColors, description: userDescription, clothingBudget: userClothingBudget, stylistFee: userStylistFee)
        
    }
    
}
