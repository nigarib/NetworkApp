//
//  UsersViewController.swift
//  NetworkApp
//
//  Created by Nigar on 01.04.23.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    var usersModel = UsersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.register(UINib(nibName: "\(CellTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(CellTableViewCell.self)")
        usersModel.getUsersItems()
        usersModel.completion = {
            self.table.reloadData()
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CellTableViewCell.self)") as! CellTableViewCell
        cell.titleLabel.text = usersModel.items[indexPath.row].name
        cell.bodyLabel.text = usersModel.items[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UsersSelectVC") as! UsersSelectVC
        vc.user = usersModel.items[indexPath.item]
//        vc.commentModel?.body = postModel.items[indexPath.row].title
//        vc.userModel.postId = usersModel.items[indexPath.row].id
        
        navigationController?.show(vc, sender: nil)
    }

}
