import UIKit
import CoreData

var contacts=[Contact]()
class ContactTableViewVC:UITableViewController{
    
    //    var contacts:[Contact]=[]
    var firsLoad = true
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    @IBAction func addNewItem(_ sender: UIButton) {
        // Make a new index path for the 0th section, last row
        let lastRow = tableView.numberOfRows(inSection: 0)
        let indexPath = IndexPath(row: lastRow, section: 0)
        // Insert this new row into the table
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    override func viewDidLoad() {
        if(firsLoad){
            firsLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
            tableView.rowHeight = UITableView.automaticDimension
            do{
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let contact = result as! Contact
                    contacts.append(contact)
                }
            }
            catch{
                print("Fetch failed")
            }
        }
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let thisContact: Contact!
        thisContact = contacts[indexPath.row]
        
        contactCell.textLabel?.text = thisContact.name
        //        contactCell.detailTextLabel?.text = thisContact.phoneNumber
        return contactCell
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "viewContactSegue"){
            let indexPath = tableView.indexPathForSelectedRow!
            let contactDetail = segue.destination as? ContactDetailVC
            let selectedContact:Contact!
            selectedContact = contacts[indexPath.row]
            contactDetail?.contact = selectedContact
            contactDetail?.selectedContactIndexPath = indexPath
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteContact = contacts[indexPath.row]
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            context.delete(deleteContact)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                tableView.reloadData()
            
        }
    }
}
