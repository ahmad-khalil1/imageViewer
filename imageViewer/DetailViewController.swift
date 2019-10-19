//
//  DetailViewController.swift
//  imageViewer
//
//  Created by ahmad$$ on 10/17/19.
//  Copyright © 2019 ahmad. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageViewer: UIImageView!
    
    var selectedPicture : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pictureName = selectedPicture {
        imageViewer.image = UIImage(named: pictureName)
        }
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
//        title = selectedPicture
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped(){
        guard let image = imageViewer.image?.jpegData(compressionQuality: 0.8) else {fatalError("error geting the photo")}
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        //the line for ipad to not crash
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true)
    }

}
