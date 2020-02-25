//
//  ProgressUpdateTableViewController.swift
//  Progress Journal
//
//  Created by Divyanshu Upadhyay on 25/02/20.
//  Copyright © 2020 Divyanshu Upadhyay. All rights reserved.
//

import UIKit

class ProgressUpdateTableViewController: UITableViewController {

    var updates: [ProgressUpdate] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool = true) {
        coreDataInfo()
        
    }
    
    
    func coreDataInfo()
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
        if let coreDataUpdates =   try? context.fetch(ProgressUpdate.fetchRequest()) as? [ProgressUpdate]
        {
            updates = coreDataUpdates
            }
            tableView.reloadData()
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return updates.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath)
        
        let proUpdate = updates[indexPath.row]
        
        if let imageData = proUpdate.image
        {
            cell.imageView?.image = UIImage(data: imageData)

        }
        cell.textLabel?.text = proUpdate.title


        return cell
    }

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            let proUpdate = updates[indexPath.row]
                    if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                        context.delete(proUpdate)
                        coreDataInfo()
            }
                

            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let proUpdate = updates[indexPath.row]

        performSegue(withIdentifier: "showUpdate", sender: proUpdate)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewProgressUpdateVC = segue.destination as? ViewProgressUpdateViewController{
            if let progressUpdate = sender as? ProgressUpdate{
                
                viewProgressUpdateVC.progressUpdate = progressUpdate

            }
        }
    }

    

}
