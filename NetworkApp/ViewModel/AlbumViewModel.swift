//
//  AlbumViewModel.swift
//  NetworkApp
//
//  Created by Nigar on 02.04.23.
//

import Foundation
class AlbumViewModel {
    
    var items = [Album]()
    let url = URL(string: "https://jsonplaceholder.typicode.com/albums")!
    var completion: (()->())?
    
    func getAlbumItems() {

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    self.items = try JSONDecoder().decode([Album].self, from: data)
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
