//
//  ForMusculoskeletalSystemTableViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 03/02/2022.
//

import UIKit

class ForMusculoskeletalSystemTableViewController: UITableViewController {
    
    
    var forMuscles = ForMuscles.createFMs()
    var forMusculoskeletalSystems = ForMusculoskeletalSystem.createFMSs()
    var forSkinCandHs = ForSkinCandH.createFSkinCandH()
    var forMetabolisms = ForMetabolism.createFMet()
    var forBreedings = ForBreeding.createFBs()
    var forRespiratTracks = ForRespiratoryTrack.createFRTs()
    var forDigestiveSystems = ForDigestiveSystem.createFDSs()
    var forNervousSystems = ForNervousSystem.createFNSs()
    var forHighPerformances = ForHighPerf.createFHPs()
    var mineralsVitamins = MineralsVitamins.createMinVits()
    
    var part: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func viewOne(_ sender: Any) {
//        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        guard let vc = storyBoard.instantiateViewController(identifier: "Ident") as? OneForMusculoskeletalSystemViewController else {return}
//        
//        vc.fmsystemOne = forMusculoskeletalSystems[3]
//        
//        navigationController?.pushViewController(vc, animated: true)
      //  prepare(for: viewOne(Any?), sender: viewOne(_:))

   }
    
    // MARK: - Table view data source

    
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return forMusculoskeletalSystems.count
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if part == 2 {
            return forSkinCandHs.count
        } else if part == 3 {
            return forMetabolisms.count
        } else if part == 4 {
            return forBreedings.count
        } else if part == 8 {
            return forRespiratTracks.count
        } else if part == 6 {
            return forDigestiveSystems.count
        } else if part == 7 {
            return forNervousSystems.count
        } else if part == 5 {
            return forHighPerformances.count
        } else if part == 1 {
            return forMusculoskeletalSystems.count
        } else if part == 0 {
            return forMuscles.count
        } else {
            return mineralsVitamins.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("indexPath", indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "musculoskeletalSystem", for: indexPath) as? ForMusculoskeletalSystemTableViewCell else {return UITableViewCell()}
        
        if part == 2 {
            let fmsystem = forSkinCandHs[indexPath.row]
            cell.FMSname?.text = fmsystem.name//[indexPath.row]
            cell.FMSimage?.image = UIImage(named: fmsystem.image)
        } else if part == 3 {
            let fmsystem = forMetabolisms[indexPath.row]
            cell.FMSname?.text = fmsystem.name//[indexPath.row]
            cell.FMSimage?.image = UIImage(named: fmsystem.image)
        } else if part == 4 {
            let fmsystem = forBreedings[indexPath.row]
            cell.FMSname?.text = fmsystem.name//[indexPath.row]
            cell.FMSimage?.image = UIImage(named: fmsystem.image)
        } else if part == 8 {
            let fmsystem = forRespiratTracks[indexPath.row]
            cell.FMSname?.text = fmsystem.name//[indexPath.row]
            cell.FMSimage?.image = UIImage(named: fmsystem.image)
        } else if part == 6 {
            let fmsystem = forDigestiveSystems[indexPath.row]
            cell.FMSname?.text = fmsystem.name//[indexPath.row]
            cell.FMSimage?.image = UIImage(named: fmsystem.image)
        } else if part == 7 {
            let fmsystem = forNervousSystems[indexPath.row]
            cell.FMSname?.text = fmsystem.name//[indexPath.row]
            cell.FMSimage?.image = UIImage(named: fmsystem.image)
        } else if part == 5 {
            let fmsystem = forHighPerformances[indexPath.row]
            cell.FMSname?.text = fmsystem.name//[indexPath.row]
            cell.FMSimage?.image = UIImage(named: fmsystem.image)
        } else if part == 0 {
            let fmsystem = forMuscles[indexPath.row]
            cell.FMSname?.text = fmsystem.name//[indexPath.row]
            cell.FMSimage?.image = UIImage(named: fmsystem.image)
        } else if part == 1 {
            let fmsystem = forMusculoskeletalSystems[indexPath.row]
            cell.FMSname?.text = fmsystem.name//[indexPath.row]
            cell.FMSimage?.image = UIImage(named: fmsystem.image)
        } else {
            let fmsystem = mineralsVitamins[indexPath.row]
            cell.FMSname?.text = fmsystem.name//[indexPath.row]
            cell.FMSimage?.image = UIImage(named: fmsystem.image)
        }
        // Configure the cell...
        //let fmsystem = forSkinCandHs[indexPath.row]
        
        
//        cell.FMSbutton.sendAction(toNextView(indexPath: indexPath.row))
        
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let oneFMSVC = segue.destination as! OneForMusculoskeletalSystemViewController
            if part == 2 {
                oneFMSVC.fskin = forSkinCandHs[indexPath.row]
            } else if part == 3 {
                oneFMSVC.fmetabolism = forMetabolisms[indexPath.row]
            } else if part == 4 {
                oneFMSVC.fbreeding = forBreedings[indexPath.row]
            } else if part == 8 {
                oneFMSVC.fresptrack = forRespiratTracks[indexPath.row]
            } else if part == 6 {
                oneFMSVC.fdigsystem = forDigestiveSystems[indexPath.row]
            } else if part == 7 {
                oneFMSVC.fnervsystem = forNervousSystems[indexPath.row]
            } else if part == 5 {
                oneFMSVC.fhperformance = forHighPerformances[indexPath.row]
            } else if part == 0 {
                oneFMSVC.fmuscles = forMuscles[indexPath.row]
            } else if part == 1 {
                oneFMSVC.fmsystemOne = forMusculoskeletalSystems[indexPath.row]
            } else {
                oneFMSVC.minvit = mineralsVitamins[indexPath.row]
            }
        }
    }
    

}
