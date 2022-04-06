import UIKit
import CoreData
class ContactOperationVC: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtPhoneNumber: UITextField!
    @IBOutlet var btnSaveContact: UIBarButtonItem!
   
    @IBAction func saveContactAction(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: context)
        let newContact = Contact(entity: entity!, insertInto: context )
        
        newContact.id = contacts.count as NSNumber
        newContact.name = txtName.text
        newContact.phoneNumber = txtPhoneNumber.text
        do{
            try context.save()
            contacts.append(newContact)
            navigationController?.popViewController(animated: true)
        }
        catch{
            print("Can't add new contact")
        }
    }
    override func viewDidLoad() {
        self.title="Add New Contact"
        super.viewDidLoad()
    }
}
