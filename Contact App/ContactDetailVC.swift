//
//  ContactDetailVC.swift
//  Contact App
//
//  Created by bmiit on 3/31/22.
//

import UIKit

class ContactDetailVC: UIViewController {

    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblPhoneNumber: UILabel!
    
    var contact:Contact? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if(contact != nil){
            lblName.text=contact?.name
            lblPhoneNumber.text=contact?.phoneNumber
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
