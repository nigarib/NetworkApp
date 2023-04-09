//
//  CommentViewModel.swift
//  NetworkApp
//
//  Created by Nigar on 03.04.23.
//

import Foundation

class CommentViewModel {
    
    var items = [Comment]()
    var postId: Int?
    var completion: (()->())?
    var errorCallBack: ((String)->())?
    func getCommentItems() {
        
        NetworkManager.shared.request(path: "posts/\(postId ?? 0)/comments") { data, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallBack?(errorMessage)
            } else if let data = data {
                do {
                    self.items = try JSONDecoder().decode([Comment].self, from: data)
                    self.completion?()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }

//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                do {
//                    self.items = try JSONDecoder().decode([Comment].self, from: data)
//                    DispatchQueue.main.async {
//                        self.completion?()
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }.resume()
    }
}
