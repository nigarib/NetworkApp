//
//  PostSelectVC.swift
//  NetworkApp
//
//  Created by Nigar on 02.04.23.
//

import UIKit

class PostSelectVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var table: UITableView!
    
    var commentModel = CommentViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "\(CellTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(CellTableViewCell.self)")
        
        commentModel.getCommentItems()
        commentModel.completion = {
            self.table.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commentModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CellTableViewCell.self)") as! CellTableViewCell
        cell.bodyLabel.text = commentModel.items[indexPath.row].body
        cell.titleLabel.text = ""
        return cell
    }

}
