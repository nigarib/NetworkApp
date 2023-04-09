//
//  PostViewController.swift
//  NetworkApp
//
//  Created by Nigar on 01.04.23.
//

import UIKit

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var postModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "\(CellTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(CellTableViewCell.self)")
        postModel.getPostItems()
        postModel.completion = {
            self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CellTableViewCell.self)") as! CellTableViewCell
        cell.bodyLabel.text = postModel.items[indexPath.row].body
        cell.titleLabel.text = postModel.items[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PostSelectVC") as! PostSelectVC
//        vc.commentModel?.body = postModel.items[indexPath.row].title
        vc.commentModel.postId = postModel.items[indexPath.row].id
        navigationController?.show(vc, sender: nil)
    }

}
