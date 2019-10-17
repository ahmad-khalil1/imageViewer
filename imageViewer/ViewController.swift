//
//  ViewController.swift
//  imageViewer
//
//  Created by ahmad$$ on 10/17/19.
//  Copyright © 2019 ahmad. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pituresArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item .hasPrefix("nssl") {
                pituresArray.append(item)
            }
            pituresArray = pituresArray.sorted()
        }
        tableView.separatorStyle = .none
        tableView.rowHeight = 50
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pituresArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"picture" , for: indexPath)
        cell.textLabel?.text = pituresArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        vc.selectedPicture = pituresArray[indexPath.row]
        vc.title = "\(indexPath.row + 01) of \(pituresArray.count)"
        navigationController?.pushViewController(vc, animated: true)
    }
}

