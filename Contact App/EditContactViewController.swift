//
//  EditContactViewController.swift
//  Contact App
//
//  Created by bmiit on 4/2/22.
//

import UIKit
import CoreData

class EditContactViewController: UIViewController {
    var contact:Contact? = nil
    
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtPhoneNumber: UITextField!
    @IBOutlet var btnsaveEditedContect: UIBarButtonItem!
   
    @IBAction func actionUpdateContact(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
                
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        do{
            let results:NSArray = try context.fetch(request) as NSArray
            for result in results {
                let newContact = result as! Contact
                if(newContact == contact){
                    newContact.name = txtName.text
                    newContact.phoneNumber = txtPhoneNumber.text
                    try context.save()
                    navigationController?.popViewController(animated: true)
                }
            }
        }
        catch{
            print("Can't update contact")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(contact != nil){
            txtName.text=contact?.name
            txtPhoneNumber.text=contact?.phoneNumber
        }
        
    }
}
