//
//  PhotoVC.swift
//  NetworkApp
//
//  Created by Nigar on 09.04.23.
//

import UIKit
import SDWebImage


class PhotoVC: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    var photoModel: Photos?
    var photoMod = PhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageUrl = URL(string: photoModel?.thumbnailUrl ?? "")
        photo.sd_setImage(with: imageUrl)
        photoMod.getPhotosItems()
    }

}
