//
//  ViewController.swift
//  ImageViewer
//
//  Created by Caio Guedes on 27/03/19.
//  Copyright © 2019 Caio Guedes. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    private var selected = 0
    private lazy var pictures: [String] = {
        return self.loadImages()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ImageViewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let destination = segue.destination as! DetailsViewController
            destination.imageName = pictures[self.selected]
        }
    }
    
    func loadImages() -> [String] {
        var output = [String]()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items where item.hasPrefix("nssl") {
            output.append(item)
        }
        
        return output
    }
}


// Mark: - Table View operations
extension ViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        cell.textLabel?.text = self.pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pictures.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selected = indexPath.row
        
        performSegue(withIdentifier: "toDetails", sender: self)
    }
}

