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
        print("User Repository fetchUsers")

        let URL = "https://randomuser.me/api/"

        AF.request(URL, method: .get).validate().responseJSON { response in
            switch response.result {
            case.success(let value):
                let json = JSON(value)
                print("JSON: \(json.dictionaryValue["results"] ?? "Error al leer")")
            case.failure(let error):
                print(error)
            }
        }
        /*
        AF.request(URL).responseDecodable(of: User.self) { response in
            switch response.result {
               case .success(let post):
                   print("Recieved post: \(post)")

               case .failure(let error):
                   print("Failed with error: \(error)")
               }

            guard let users = response.value else { return }
            print("Completion")

            completion(users)
        }
        */
    }
    
}
