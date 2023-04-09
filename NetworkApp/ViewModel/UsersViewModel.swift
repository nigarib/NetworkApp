//
//  UsersViewModel.swift
//  NetworkApp
//
//  Created by Nigar on 05.04.23.
//

import Foundation
class UsersViewModel {
    
    var items = [Users]()
    var postId: Int?
    var completion: (()->())?
    var errorCallBack: ((String)->())?
    func getUsersItems() {
        
//        NetworkManager.shared.request(path: "users") { data, errorMessage in
//            if let errorMessage = errorMessage {
//                self.errorCallBack?(errorMessage)
//            } else if let data = data {
//                do {
//                    self.items = try JSONDecoder().decode([Users].self, from: data)
//                    self.completion?()
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
        
        NetworkManager.shared.request(model: [Users].self, path: "users") { data, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallBack?(errorMessage)
            } else if let data = data {
                self.items = data
                self.completion?()
            }
        }
        
        
    }
}
