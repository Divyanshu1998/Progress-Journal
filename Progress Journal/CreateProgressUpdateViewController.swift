//
//  CreateProgressUpdateViewController.swift
//  Progress Journal
//
//  Created by Divyanshu Upadhyay on 25/02/20.
//  Copyright © 2020 Divyanshu Upadhyay. All rights reserved.
//

import UIKit

class CreateProgressUpdateViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    
    var pickerController = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = addButton.frame.size.height / 2.0
        
        pickerController.delegate = self

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage
        {
            photoImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func libraryButton(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func takePhotoButton(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let ProgressUpdateSaved = ProgressUpdate(context: context)
            ProgressUpdateSaved.title = titleTextField.text
            ProgressUpdateSaved.image = photoImageView.image?.jpegData(compressionQuality: 0.8)
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
        }
        
        
        navigationController?.popViewController(animated: true)
    }
}
