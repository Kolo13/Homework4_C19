//
//  DetailViewController.swift
//  Practice_Milstead
//
//  Created by Kori Kolodziejczak on 8/18/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  var personProfile: Person!

   @IBOutlet weak var firstNameTextField: UITextField!
   @IBOutlet weak var lastNameTextField: UITextField!
  
    override func viewDidLoad() {
      super.viewDidLoad()
      
      firstNameTextField.text = personProfile.firstName
      lastNameTextField.text = personProfile.lastName
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
