//
//  ViewController.swift
//  CashUp
//
//  Created by Baljot Sekhon on 4/8/18.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red: 130/255, green: 173/255, blue: 242/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ask for access to camera to take pictures of receipt
    @IBOutlet weak var imagePicked: UIImageView!
    
    @IBAction func openCamera(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imageAccess = UIImagePickerController()
            imageAccess.delegate = self
            imageAccess.sourceType = UIImagePickerControllerSourceType.camera;
            imageAccess.allowsEditing = false
            self.present(imageAccess, animated: true, completion: nil)
        }
    }
    
    // access photos from library
    @IBAction func openPhotoLib(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imageAccess = UIImagePickerController()
            imageAccess.delegate = self
            imageAccess.sourceType = .photoLibrary;
            imageAccess.allowsEditing = true
            self.present(imageAccess, animated: true, completion: nil)
        }
    }
    
    // display the chosen image from camera/library
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagePicked.image = image
        dismiss(animated:true, completion: nil)
    }
}

