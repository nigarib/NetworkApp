//
//  AlbumsViewController.swift
//  NetworkApp
//
//  Created by Nigar on 01.04.23.
//

import UIKit

class AlbumsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var albumModel = AlbumViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        table.register(UINib(nibName: "\(CellTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(CellTableViewCell.self)")
        albumModel.getAlbumItems()
        albumModel.completion = {
            self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albumModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CellTableViewCell.self)") as! CellTableViewCell
        cell.titleLabel.text = albumModel.items[indexPath.row].title
        cell.bodyLabel.text = ""
        return cell
    }
    
}
