//
//  File.swift
//  ImageViewer
//
//  Created by Caio Guedes on 27/03/19.
//  Copyright © 2019 Caio Guedes. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let name = imageName {
            title = name
            imageView.image = UIImage(named: name)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false;
    }
}
