//
//  ContactsTableViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 08/02/2022.
//

import UIKit
import MessageUI
import SafariServices

class ContactsTableViewController: UITableViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
   
    
    
    var kontaktini = kontakti.createKontakti()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func makeACall(_ sender: UIButton) {
        let phone: String = "26483024"
        guard let url = URL(string: "tel://\(phone)") else {return}
        let bool = UIApplication.shared.canOpenURL(url)
        /*{
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }*/
        print(bool)
        
        /*
        if let url = URL(string: "tel://26483024"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }*/
        
    }
    
    
    @IBAction func makeACallBtnTapped(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        let valstina = kontaktini[indexpath.row].valsts
        print(valstina)
        
        let phone: String = kontaktini[indexpath.row].telefons
        guard let url = URL(string: "tel://\(phone)") else {return}
        var bool = UIApplication.shared.canOpenURL(url)
        if bool == true {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            bool = false
        }
        
    }
    @IBAction func sendAMessage(_ sender: UIButton) {

        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        
        let composeVC = MFMessageComposeViewController()
        // Set the delegate for the MessageComposeViewController
        composeVC.messageComposeDelegate=self
        //let Configure the fields of the interface.
        composeVC.recipients=[kontaktini[indexpath.row].telefons]
        composeVC.body = ""//"I love Swift!"
        // Present the view controller modally
        if MFMessageComposeViewController.canSendText(){
            self.present(composeVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func sendAnEmailBtnTapped(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        let valstina = kontaktini[indexpath.row].valsts
        print(valstina)
        
        let compVC = MFMailComposeViewController()
        compVC.mailComposeDelegate = self
        compVC.setToRecipients([kontaktini[indexpath.row].epasts])
        compVC.setMessageBody("", isHTML: true)
        if MFMailComposeViewController.canSendMail() {
            self.present(compVC, animated: true, completion: nil)
        }
        
        /*
        if MFMailComposeViewController.canSendMail() {
            let emailVC = MFMailComposeViewController()
            emailVC.delegate = self
            emailVC.setSubject("New Equistro order")
            //emailVC.
            emailVC.setToRecipients(["zideleanda@gmail.com"])
            emailVC.setMessageBody("<h1>I would like to order these products!</h1>", isHTML: true)
            present(UINavigationController(rootViewController: emailVC), animated: true)
        } else {
            guard let url = URL(string: "https://www.google.com") else {
                return
            }
            let emailVC = SFSafariViewController(url: url)
            present(emailVC, animated: true)
        }
        */
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return kontaktini.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath) as? ContactsTableViewCell else {return UITableViewCell()}

        // Configure the cell...
        /*
         let fmsystem = mineralsVitamins[indexPath.row]
         cell.FMSname?.text = fmsystem.name//[indexPath.row]
         cell.FMSimage?.image = UIImage(named: fmsystem.image)
         */
        let kontIndex = kontaktini[indexPath.row]
        cell.valstsLabel?.text = kontIndex.valsts
        cell.fonsValstim?.image = UIImage(named: kontIndex.karogs)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
