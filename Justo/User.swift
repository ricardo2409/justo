//
//  User.swift
//  Justo
//
//  Created by Ricardo Trevino on 8/10/22.
//

import Foundation

struct User : Decodable{
    var name : String
    var gender : String
    var location : String
    var email : String
    var dob : String
    var phoneNo : String
    var cellNo : String
    var profilePic : String
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case location
        case email
        case dob
        case phoneNo = "phone"
        case cellNo = "cell"
        case profilePic = "picture"
    }
   
    /*
    init(dict : Dictionary<String, Any?>) {
        name = Name(dict: dict["name"] as! Dictionary<String, String>)
        gender = Gender.parse(rawValue: dict["gender"] as! String) ?? Gender.other
        location = Location(dict: dict["location"] as! Dictionary<String, Any?>)
        email = dict["email"] as? String ?? ""
        dob = DOB(dict: dict["dob"] as! Dictionary<String, Any?>)
        phoneNo = dict["phone"] as? String ?? ""
        cellNo = dict["cell"] as? String ?? ""
        profilePic = ProfilePicture(dict: dict["picture"] as! Dictionary<String, String>)
    }
     */
}
