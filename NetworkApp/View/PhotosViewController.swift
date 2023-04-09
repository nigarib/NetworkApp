//
//  PhotosViewController.swift
//  NetworkApp
//
//  Created by Nigar on 01.04.23.
//

import UIKit
import SDWebImage

class PhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var photosModel = PhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosModel.getPhotosItems()
        photosModel.completion = {
            self.collection.reloadData()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "PhotosViewCell", for: indexPath) as! PhotosViewCell
        cell.labelPhoto.text = photosModel.items[indexPath.row].title
        let imageUrl = URL(string: photosModel.items[indexPath.row].thumbnailUrl ?? "")
        cell.imagePhoto.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PhotoVC") as! PhotoVC
        vc.photoModel = photosModel.items[indexPath.item]
        navigationController?.show(vc, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collection.frame.width, height: 250)
    }
}
