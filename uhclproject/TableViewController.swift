//
//  TableViewController.swift
//  LithologyTable
//
//  Created by Himani Makode on 4/2/16.
//  Copyright © 2016 UHCL. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    let detailSegueIdentifier = "ShowDetailSegue"   //New
    
    var  records = [[String]]()
    var record_layer_type_a: String = ""
    var record_competent_layer_a: String = ""
    
    var record_layer_top_tvd_a: String = ""
    var record_over_balance_margin_a: String = ""
    var record_differential_sticking_limit_a: String = ""
    var record_stability_a: String = ""
    var record_pore_pressure_a: String = ""
    var record_fracture_gradient_a: String = ""
    var record_layer_name_a = ""
    @IBOutlet weak var layerName: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "LayerName\tLayerType\t\tCompetentLayer\t\t\tLayerTop\t\t\tOverBalanceMargin\t\t\tDifferentialStickingLimit\t\t\tStabilityMinimum\t\t\tPorePressure\t\t\tFractureGradient "
        //return "Layer Name   |  Layer Type  |   Competent Layer  |  Layer Top  |  OverBalanceMargin  |  Differential Sticking Limit | Stability Minimum | Pore Pressure  | FractureGradient "
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return records.count
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func save(segue:UIStoryboardSegue) {
        let detailViewController = segue.sourceViewController as! DetailViewController
        
        let index = detailViewController.fetch_index
        
        record_layer_type_a = detailViewController.record_layer_type
        record_competent_layer_a = detailViewController.record_competent_layer
        record_layer_top_tvd_a = detailViewController.record_layer_top_tvd
        record_over_balance_margin_a = detailViewController.record_over_balance_margin
        record_differential_sticking_limit_a = detailViewController.record_differential_sticking_limit
        record_stability_a = detailViewController.record_stability
        record_pore_pressure_a = detailViewController.record_pore_pressure
        record_fracture_gradient_a = detailViewController.record_fracture_gradient
        record_layer_name_a = detailViewController.record_layer_name
        
        records[index!][0] = record_layer_name_a
        records[index!][1] = record_layer_type_a
        records[index!][2] = record_competent_layer_a
        records[index!][3] = record_layer_top_tvd_a
        records[index!][4] = record_over_balance_margin_a
        records[index!][5] = record_differential_sticking_limit_a
        records[index!][6] = record_stability_a
        records[index!][7] = record_pore_pressure_a
        records[index!][8] = record_fracture_gradient_a
        
        tableView.reloadData()
    
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        
        let recordDetailVC = segue.sourceViewController as! AddViewController
        record_layer_type_a = recordDetailVC.record_layer_type
        record_competent_layer_a = recordDetailVC.record_competent_layer
        record_layer_top_tvd_a = recordDetailVC.record_layer_top_tvd
        record_over_balance_margin_a = recordDetailVC.record_over_balance_margin
        record_differential_sticking_limit_a = recordDetailVC.record_differential_sticking_limit
        record_stability_a = recordDetailVC.record_stability
        record_pore_pressure_a = recordDetailVC.record_pore_pressure
        record_fracture_gradient_a = recordDetailVC.record_fracture_gradient
        record_layer_name_a = recordDetailVC.record_layer_name
        var new_row = [String]()
        new_row.append(record_layer_name_a)
        new_row.append(record_layer_type_a)
        new_row.append(record_competent_layer_a)
        new_row.append(record_layer_top_tvd_a)
        new_row.append(record_over_balance_margin_a)
        new_row.append(record_differential_sticking_limit_a)
        new_row.append(record_stability_a)
        new_row.append(record_pore_pressure_a)
        new_row.append(record_fracture_gradient_a)
        
        records.append(new_row)
        
    }
    

    
    @IBOutlet weak var cxv: UILabel!
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "mycell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewContentCell
       
        cell.LayerName.text = records[indexPath.row][2]
        cell.layer_type.text = records[indexPath.row][1]
        cell.competent_layer_label.text = records[indexPath.row][0]
        cell.tvd_label.text = records[indexPath.row][3]
        cell.balance_margin_label.text = records[indexPath.row][4]
        cell.st_limit_label.text = records[indexPath.row][5]
        cell.stability_label.text = records[indexPath.row][6]
        cell.pressure_label.text = records[indexPath.row][7]
        cell.gradient_label.text = records[indexPath.row][8]

 
        
        // Configure the cell...

   //     print(records[indexPath.row][0])
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            records.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == detailSegueIdentifier {
            let detailViewController = ((segue.destinationViewController) as! DetailViewController)
                if let editIndex = tableView.indexPathForSelectedRow?.row {
                    detailViewController.index = editIndex
                    detailViewController.allrecords = records[editIndex]
            }
        }
    }
    

}
