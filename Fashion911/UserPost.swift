//
//  UserPost.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 3/17/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit
import Foundation


internal enum UserPostResult {
    case success(User)
    case failureWrongInfo([String: Any])
    case failure(UserPost.Error)
}

class UserPost {
    
    enum Error: Swift.Error {
        case http(HTTPURLResponse)
        case system(Swift.Error)
    }
    
    
    
    //Need to add description, clothingBudget, and stylistFee
    func postRegister(firstName: String, lastName: String, email: String, phone: String, address: String, city: String, state: String, zip: String, height: String, size: String, bodyType: String, eventType: String, eventTime: TimeInterval, image: UIImage, likedColors: String, dislikedColors: String, description: String, clothingBudget: String, stylistFee: String, completion: @escaping (UserPostResult) -> ()) {
        
        let session = URLSession.shared
        
        let url = URL(string: "https://fashion-911.herokuapp.com/add_client.json")!
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let imageData = UIImageJPEGRepresentation(image, 1.0)
        let imageString = imageData?.base64EncodedString()
        
        let payload = try! JSONSerialization.data(withJSONObject: ["firstName": firstName, "lastName": lastName, "email": email, "phoneNumber": phone, "address": address, "city": city, "state": state, "zipCode": zip, "height": height, "size": size, "bodyType": bodyType, "eventType": eventType, "timestamp": eventTime, "image": imageString!, "colorsLiked": likedColors, "colorsDisliked": dislikedColors, "description": description, "budget": clothingBudget, "fee": stylistFee], options: [])
        request.httpBody = payload
        
        let task = session.dataTask(with: request) { (optionalData, optionalResponse, optionalError) in
            
            if let data = optionalData {
                print(data)
                completion(self.processPostRegister(data: data, error: optionalError))
                
                
            } else if let response = optionalResponse {
                let error = Error.http(response as! HTTPURLResponse)
                completion(.failure(error))
                
                
                print("optionalResponse: \(String(describing: optionalResponse))")
                
            } else {
                completion(.failure(.system(optionalError!)))
            }
        }
        task.resume()
    }
    // maybe do if object["status"] == 500 do an error message
    func processPostRegister(data: Data, error: Swift.Error?) -> UserPostResult {
        if let object = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] {
            if let user = User.init(jsonObject: object) {
                return .success(user)
            } else if object["message"] != nil {
                return .failureWrongInfo(object)
            } else {
                return .failure(.system(error!))
            }
        } else {
            return .failure(.system(error!))
    }
    }
}
