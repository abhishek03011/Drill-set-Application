//
//  GraphPopController.swift
//  uhclproject
//
//  Created by Abhishek Kumar on 4/22/16.
//  Copyright © 2016 Abhishek Kumar. All rights reserved.
//

import UIKit

class GraphPopController: UIViewController{
    
     var del = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var received:String = ""
    var pore:String = "0"
    var trip:String = "0"
    var fracture:String = "0"
    var kick:String = "0"
    var casing:String = "0"
    var donedata = ""
    var tripdata = ""
    var graddata = ""
    var fracdata = ""
    var casdata = ""
    var kickdata = ""

    
    @IBOutlet weak var porePressure: UISwitch!
    
    @IBOutlet weak var tripMargin: UISwitch!
    
    @IBOutlet weak var fractureGradient: UISwitch!
    
    @IBOutlet weak var kickmargin: UISwitch!
    
    @IBOutlet weak var casingDepth: UISwitch!
    
    @IBOutlet weak var overhead: UISwitch!
    
    @IBOutlet weak var Diffrential: UISwitch!
    
    @IBOutlet weak var Stability: UISwitch!
    
    
    @IBAction func PorePressure(sender: UISwitch)
    {
        if !sender.on
        {
            pore = "1"
        }
        else
        {
            pore = "1"
            porePressure.setOn(true, animated: true)
        }
    }
    
    @IBAction func tripmargin(sender: UISwitch)
    {
        if !sender.on
        {
        trip = "1"
        }
        else
        {
            trip = "0"
            tripMargin.setOn(true, animated: true)
        }
    }
    
    @IBAction func fracturegradient(sender: UISwitch)
    {
        if !sender.on
        {
            fracture = "1"
        }
        else
        {
            fracture = "0"
            fractureGradient.setOn(true, animated: true)
        }

    }
    
    @IBAction func kickmargin(sender: UISwitch)
    {
        if !sender.on
        {
            kick = "1"
        }
        else
        {
            kick = "0"
            kickmargin.setOn(true, animated: true)
        }

    }
    
    @IBAction func casingdepth(sender: UISwitch)
    {
        if !sender.on
        {
            casing = "1"
        }
        else{
            casing = "1"
        
        }

    }
    
    @IBAction func Doneswitch(sender: UIButton)
    {
    
        donedata = pore
        tripdata = trip
        fracdata = fracture
        kickdata = kick
        casdata = casing

   
    
    }
    
    override func viewWillAppear(animated: Bool)
    {
    //super.viewWillAppear(true)
        
        if del.checked == "1"
        {
        porePressure.setOn(false, animated: true)
        
        }
        if  del.checked1 == "1"
        {
            tripMargin.setOn(false, animated: true)
        }
        if del.checked2 == "1"
        {
            fractureGradient.setOn(false, animated: true)
        }
        
        if del.checked3 == "1"
        {
            kickmargin.setOn(false, animated: true)
        }
        
        if del.checked4 == "0"
        {
            casingDepth.setOn(false, animated: true)
        }
    }
    
    

    
      override func viewDidLoad()
      {
       super.viewDidLoad()
  casingDepth.setOn(false, animated: true)
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
