//
//  UsersSelectVC.swift
//  NetworkApp
//
//  Created by Nigar on 05.04.23.
//

import UIKit

class UsersSelectVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    
    var user: Users?
    var userModel = UsersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()


        userModel.getUsersItems()
        userModel.completion = {
            self.collection.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1//userModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "UsersViewCell", for: indexPath) as! UsersViewCell
        cell.name.text = user?.name
        cell.userName.text = user?.username
        cell.email.text = user?.email
        cell.address.text = "\(user?.address?.street ?? "") \(user?.address?.geo?.lat ?? "") \(user?.address?.geo?.lng ?? "") \(user?.address?.suite ?? "") \(user?.address?.zipcode ?? "")"
//        cell.address.text = usersModel.items[indexPath.row].address
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collection.frame.width, height: collection.frame.height)
    }
}
