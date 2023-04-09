//
//  PhotosViewModel.swift
//  NetworkApp
//
//  Created by Nigar on 08.04.23.
//

import Foundation
class PhotosViewModel {
    
    var items = [Photos]()
    var postId: Int?
    var completion: (()->())?
    var errorCallBack: ((String)->())?
    func getPhotosItems() {
           
        NetworkManager.shared.request(model: [Photos].self, path: "photos") { data, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallBack?(errorMessage)
            } else if let data = data {
                self.items = data
                self.completion?()
            }
        }
        
        
    }
}
