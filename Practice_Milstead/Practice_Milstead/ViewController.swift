//
//  ViewController.swift
//  Practice_Milstead
//
//  Created by Kori Kolodziejczak on 8/17/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  var people = [Person]()
  var teacher = [Person]()
  var allArray = [[Person]]()

  var sectionTitle = ["Students", "Teachers"]
  
  var nathan = Person(firstName: "Nathan", lastName: "Ma")
  var tuan = Person(firstName: "Tuan", lastName: "Vu")
  var brian = Person(firstName: "Brian", lastName: "Mendez")
  var brad = Person(firstName: "Brad", lastName: "Johnson")
  var john = Person(firstName: "John", lastName: "Clum")

  
  override func viewDidLoad() {
    super.viewDidLoad()
    people = [nathan, tuan, brian]
    teacher = [brad, john]
    allArray = [people, teacher]

    
    
  }
  override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    let indexPath = self.tableView.indexPathForSelectedRow()
    if segue.identifier == "pushDetail" {
      var destination = segue.destinationViewController as DetailViewController
      destination.personProfile = allArray[indexPath.section][indexPath.row]
      println("prepareForSegue")
      
    }
  }

  override func viewWillAppear(animated: Bool) {
    println("viewWillAppear")

    tableView.reloadData()
  }
  
  func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
    println("numberOfSectionsInTableView")

    return self.allArray.count
  }
  func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    println("numberOfRowsInSection")
    return allArray[section].count
  }
  
  func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
    println("titleForHeaderInSection")

    return sectionTitle[section]
  }
  
  func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    cell.textLabel.text = allArray[indexPath.section][indexPath.row].fullName()
    println("cellForRowAtIndexPath")

//    self.preProfile = allArray[indexPath.section][indexPath.row]
    
    return cell
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
}

