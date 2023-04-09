//
//  PostViewModel.swift
//  NetworkApp
//
//  Created by Nigar on 01.04.23.
//

import Foundation
class PostViewModel {
    var items = [Post]()
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    var completion: (()->())?
    func getPostItems() {

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    self.items = try JSONDecoder().decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        self.completion?()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
