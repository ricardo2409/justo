//
//  ViewModel.swift
//  Justo
//
//  Created by Ricardo Trevino on 8/10/22.
//

import Foundation

class ViewModel {
    func fetchUsers(_ completion: @escaping (_ users: User) -> (Void)) {
        let repository = UserRepository()
        
        repository.fetchUsers { users in
            completion(users)
        }
    }
    
}
