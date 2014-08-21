//
//  DetailViewController.swift
//  Practice_Milstead
//
//  Created by Kori Kolodziejczak on 8/18/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  var personProfile: Person!
  var noPicImage = UIImage(named: "noPicHead")
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var profileImage: UIImageView!
  
  @IBAction func photoButtonPressed(sender: AnyObject) {
    var pickerController = UIImagePickerController()
    pickerController.delegate = self
    pickerController.allowsEditing = true
    pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    
    self.presentViewController(pickerController, animated: true, completion: nil)

  }
  
  func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
    picker.dismissViewControllerAnimated(true, completion: nil)
    //this gets fired when the image picker is done
    println("user picked an image")
    var editedImage = info[UIImagePickerControllerEditedImage] as UIImage
    self.profileImage.contentMode = UIViewContentMode.ScaleAspectFit
    self.profileImage.image = editedImage
    self.personProfile.image = editedImage
    
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
    //this gets fired when the users cancel out of the process
    picker.dismissViewControllerAnimated(true, completion: nil)
  }

    override func viewDidLoad() {
      super.viewDidLoad()
      firstNameTextField.text = personProfile.firstName
      self.lastNameTextField.text = personProfile.lastName
      self.profileImage.contentMode = UIViewContentMode.ScaleAspectFit
      self.profileImage.image = personProfile.image
      
      if personProfile.image == nil {
        profileImage.contentMode = UIViewContentMode.ScaleAspectFit
        profileImage.image = noPicImage
      }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
  override func viewWillDisappear(animated: Bool) {
    personProfile.firstName = firstNameTextField.text
    personProfile.lastName = lastNameTextField.text
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
