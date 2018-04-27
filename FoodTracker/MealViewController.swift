//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Restricted on 12/16/17.
//
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    //@IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    /*
 
        This value is either passed by 'MealTableViewController' in 'prepare(for:sender:)' or constructed as part of adding a new meal.*/
    
    var meal: Meal?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self //refers to the ViewController class
        // Do any additional setup after loading the view, typically from a nib.
    }


    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //nameLabel.text = textField.text
        
    }
    
    
    //MARK: UIImagePicketControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //  The info dictionary may contain multiple representations of the image.  You want to use the original.
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        //  Set photoImageView to display the selected image
        
        photoImageView.image = selectedImage
        
        //  Dismiss the picker
        
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Actions
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer){
        
        //  Hide the keyboard
        
        nameTextField.resignFirstResponder()
        
        
        //  UI ImagePickerController is a view controller that lets a user pick media from their phot library
        
        let imagePickerController = UIImagePickerController()
        
       //  Only allow photos to be picked, not taken
        
        imagePickerController.sourceType = .photoLibrary
        
        
        // Make sure ViewController is notified when the user picks an image
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
        
    }
    
        
    
}

