//
//  ViewProgressUpdateViewController.swift
//  Progress Journal
//
//  Created by Divyanshu Upadhyay on 25/02/20.
//  Copyright © 2020 Divyanshu Upadhyay. All rights reserved.
//

import UIKit

class ViewProgressUpdateViewController: UIViewController {

    
    var progressUpdate: ProgressUpdate?
    @IBOutlet weak var showImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = progressUpdate?.title
        
      if let imageData = progressUpdate?.image
      {
         showImageView.image = UIImage(data: imageData)

      }
        // Do any additional setup after loading the view.
    }
    

    

}
