//
//  UserRepository.swift
//  Justo
//
//  Created by Ricardo Trevino on 8/10/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserRepository {
    
    func fetchUsers(_ completion: @escaping (_ users: User) -> (Void)) {

        let URL = "https://randomuser.me/api/"

        AF.request(URL, method: .get).validate(statusCode: 200..<600).responseJSON { response in
            switch response.result {
            case.success(let value):
                let json = JSON(value)
                //Create User
                let title = json["results"][0]["name"]["title"].rawValue as! String
                let first = json["results"][0]["name"]["first"].rawValue as! String
                let last = json["results"][0]["name"]["last"].rawValue as! String
                let name = title + " " + first + " " + last
                let gender = json["results"][0]["gender"].rawValue as! String
                let latitude = json["results"][0]["location"]["coordinates"]["latitude"].rawValue as! String
                let longitude = json["results"][0]["location"]["coordinates"]["longitude"].rawValue as! String
                let email = json["results"][0]["email"].rawValue as! String
                let country = json["results"][0]["location"]["country"].rawValue as! String
                let age = String(json["results"][0]["dob"]["age"].rawValue as! Int)
                let phone = json["results"][0]["phone"].rawValue as! String
                let cell = json["results"][0]["cell"].rawValue as! String
                let thumbnail = json["results"][0]["picture"]["medium"].rawValue as! String
                let large = json["results"][0]["picture"]["large"].rawValue as! String
                let user = User(name: name, gender: gender, latitude: latitude, longitude: longitude, email: email, country: country, age: age, phoneNo: phone, cellNo: cell, profilePicThumbnail: thumbnail, profilePicLarge: large)
               
                completion(user)
                
            case.failure(let error):
                print(error)
            }
        }
    }
    
}
