//
//  ContactDetailVC.swift
//  Contact App
//
//  Created by bmiit on 3/31/22.
//

import UIKit
import CoreData
class ContactDetailVC: UIViewController {
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblPhoneNumber: UILabel!
    
    @IBAction func btnDelete(_ sender: UIBarButtonItem) {
        
//        let deleteAlert = UIAlertController(title: "Delete Contact", message: "Are you sure??? This contact will be deleted permanently", preferredStyle:.alert)
//
//        deleteAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Contact") // Find this name in your .xcdatamodeld file
////            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//            do{
//                try context.delete(contact!)
//                navigationController?.popViewController(animated: true)
//            }
//            catch{
//                print("Can't update contact")
//            }
//        }))
//
//        deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
//            print("Handle Cancel Logic here")
//        }))
//
//        present(deleteAlert, animated: true, completion: nil)
        
    }
    var contact:Contact? = nil
    var selectedContactIndexPath:IndexPath! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if(contact != nil && selectedContactIndexPath != nil){
            lblName.text=contact?.name
            lblPhoneNumber.text=contact?.phoneNumber
        }
    }
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        let indexPath = tableView.indexPathForSelectedRow!
    //        let contactDetail = segue.destination as? ContactDetailVC
    //        let selectedContact:Contact!
    //        selectedContact = contacts[indexPath.row]
    //        contactDetail?.contact = selectedContact
    //        contactDetail?.selectedContactIndexPath = indexPath
    //        tableView.deselectRow(at: indexPath, animated: true)
    //    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "updateContactSegue"){
            let editContactDetail = segue.destination as? EditContactViewController
            let selectedContact:Contact!
            selectedContact = contacts[selectedContactIndexPath.row]
            editContactDetail?.contact = selectedContact
        }
    }
    
}
