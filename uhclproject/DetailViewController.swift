//
//  DetailViewController.swift
//  LithologyTable
//
//  Created by Himani Makode on 4/12/16.
//  Copyright © 2016 UHCL. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    var index:Int?
   
    //valdations of textFields
    
    @IBAction func layerTopValidation(sender: UITextField) {
        
        let layerTop : String = topTVDText.text!
        if layerTop.characters.count <= 4 && layerTop.characters.count > 0  {
            let value = Double(layerTop)!
            if (value) >= 0.0 && (value) <= 9999.0 {
            }
            else{
                topTVDText.text = ""
               self.showTopTVDAlert()
            }
        
        }
        else{
            topTVDText.text = ""
        self.showTopTVDAlert()
        }
        
    }
    
    func showTopTVDAlert(){
    
    let alert = UIAlertController(title: "Invalid Inputs",message: "Values must be between 0-9999",preferredStyle: .Alert)
        let defAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(defAction)
        presentViewController(alert, animated: true, completion: nil)
    
    }
    
    
    @IBAction func overBalanceMargin(sender: UITextField) {
        let overbalancemargin : String = overBalanceText.text!
        if overbalancemargin.characters.count <= 4 && overbalancemargin.characters.count > 0  {
            let value = Double(overbalancemargin)!
            if (value) >= 0.0 && (value) <= 9999.0 {
            }
            else{
                overBalanceText.text = ""
                self.showTopTVDAlert()
            }
            
        }
        else{
            overBalanceText.text = ""
            self.showTopTVDAlert()
        }
        
    }

    func showOverBalanceAlert(){
        
        let alert2 = UIAlertController(title: "Invalid Inputs",message: "Values must be between 0-9999",preferredStyle: .Alert)
        let defAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert2.addAction(defAction)
        presentViewController(alert2, animated: true, completion: nil)
        
    }
    
    @IBAction func differentialSL(sender: UITextField) {
        let differentialSL : String = stickingLimitText.text!
        if differentialSL.characters.count <= 4 && differentialSL.characters.count > 0  {
            let value = Double(differentialSL)!
            if (value) >= 0.0 && (value) <= 9999.0 {
            }
            else{
                stickingLimitText.text = ""
                self.showTopTVDAlert()
            }
            
        }
        else{
            stickingLimitText.text = ""
            self.showTopTVDAlert()
        }
        
    }
    
    func showdslAlert(){
        
        let alert2 = UIAlertController(title: "Invalid Inputs",message: "Values must be between 0-9999",preferredStyle: .Alert)
        let defAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert2.addAction(defAction)
        presentViewController(alert2, animated: true, completion: nil)
        
    }
    
    
    @IBAction func stabilitymin(sender: UITextField) {
        
            let stabilitymin: String = stabilityText.text!
            if stabilitymin.characters.count <= 4 && stabilitymin.characters.count > 0  {
                let value = Double(stabilitymin)!
                if (value) >= 0.0 && (value) <= 9999.0 {
                }
                else{
                    stabilityText.text = ""
                    self.showTopTVDAlert()
                }
                
            }
            else{
                stabilityText.text = ""
                self.showTopTVDAlert()
            }
            
        }
        func showstabilityAlert(){
            
            let alert2 = UIAlertController(title: "Invalid Inputs",message: "Values must be between 0-9999",preferredStyle: .Alert)
            let defAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert2.addAction(defAction)
            presentViewController(alert2, animated: true, completion: nil)
            
        }

    
    
    @IBAction func porepressure(sender: UITextField) {

            let porepressure : String = pressureText.text!
            if porepressure.characters.count <= 4 && porepressure.characters.count > 0  {
                let value = Double(porepressure)!
                if (value) >= 0.0 && (value) <= 9999.0 {
                }
                else{
                    pressureText.text = ""
                    self.showTopTVDAlert()
                }
                
            }
            else{
                pressureText.text = ""
                self.showTopTVDAlert()
            }
    }
    
        func showporepressureAlert(){
            
            let alert2 = UIAlertController(title: "Invalid Inputs",message: "Values must be between 0-9999",preferredStyle: .Alert)
            let defAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert2.addAction(defAction)
            presentViewController(alert2, animated: true, completion: nil)
            
        }
    
    @IBAction func fracturegradient(sender: UITextField) {

            let fracturegradient : String = gradientText.text!
            if fracturegradient.characters.count <= 4 && fracturegradient.characters.count > 0  {
                let value = Double(fracturegradient)!
                if (value) >= 0.0 && (value) <= 9999.0 {
                }
                else{
                    pressureText.text = ""
                    self.showTopTVDAlert()
                }
                
            }
            else{
                pressureText.text = ""
                self.showTopTVDAlert()
            }
            
        }
        func showfracturegradientAlert(){
            
            let alert2 = UIAlertController(title: "Invalid Inputs",message: "Values must be between 0-9999",preferredStyle: .Alert)
            let defAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert2.addAction(defAction)
            presentViewController(alert2, animated: true, completion: nil)
            
        }


    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == layerName
        {
            layerTypeText.becomeFirstResponder()
        }
        else if textField == layerTypeText
        {
            topTVDText.becomeFirstResponder()
        }
        else if textField == topTVDText
        {
            overBalanceText.becomeFirstResponder()
        }
        else if textField == overBalanceText
        {
            stickingLimitText.becomeFirstResponder()
        }
        else if textField == stickingLimitText
        {
            stabilityText.becomeFirstResponder()
        }
        else if textField == stabilityText
        {
            pressureText.becomeFirstResponder()
        }
        else if textField == pressureText
        {
            gradientText.becomeFirstResponder()
        }
        return true
    }
    
    var  allrecords = [String]()
    
    var record_layer_type: String = ""
    var record_competent_layer: String = ""
    var record_layer_top_tvd: String = ""
    var record_over_balance_margin: String = ""
    var record_differential_sticking_limit: String = ""
    var record_stability: String = ""
    var record_pore_pressure: String = ""
    var record_fracture_gradient: String = ""
    var record_layer_name = ""
    let detailSegueIdentifier = "ShowDetailSegue"
    var fetch_index:Int?
    
    override func viewWillAppear(animated: Bool) {
        if(!allrecords.isEmpty){
            fetch_index = index
            print(index)
            layerName.text = allrecords[0]
            layerTypeText.text = allrecords[1]
            print(allrecords[2])
            if(allrecords[2] == "Yes"){
                competentLayerText.setOn(true, animated:true)
            }else{
                competentLayerText.setOn(false, animated:true)
            }
            //competentLayerText.text = allrecords[2]
            topTVDText.text = allrecords[3]
            gradientText.text = allrecords[8]
            pressureText.text = allrecords[7]
            stabilityText.text = allrecords[6]
            stickingLimitText.text = allrecords[5]
            overBalanceText.text = allrecords[4]
        }
    }
    
    @IBOutlet weak var layerName: UITextField!
    @IBOutlet weak var layerTypeText: UITextField!
    @IBOutlet weak var competentLayerText: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layerTypeText.delegate = self
        self.topTVDText.delegate = self
        self.overBalanceText.delegate = self
        self.stickingLimitText.delegate = self
        self.stabilityText.delegate = self
        self.pressureText.delegate = self
        self.gradientText.delegate = self
        self.layerName.delegate = self
        pressureText.keyboardType = .DecimalPad
        topTVDText.keyboardType = .DecimalPad
        overBalanceText.keyboardType = .DecimalPad
        stickingLimitText.keyboardType = .DecimalPad
        stabilityText.keyboardType = .DecimalPad
        gradientText.keyboardType = .DecimalPad
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var topTVDText: UITextField!
    
    @IBOutlet weak var gradientText: UITextField!
    @IBOutlet weak var pressureText: UITextField!
    @IBOutlet weak var stabilityText: UITextField!
    @IBOutlet weak var stickingLimitText: UITextField!
    @IBOutlet weak var overBalanceText: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "saveSegue" {
            record_layer_type = layerTypeText.text!
            if competentLayerText.on{
                record_competent_layer = "Yes"
            }else
            {
                record_competent_layer = "No"
            }
            record_layer_top_tvd = topTVDText.text!
            record_over_balance_margin = overBalanceText.text!
            record_differential_sticking_limit = stickingLimitText.text!
            record_stability = stabilityText.text!
            record_pore_pressure = pressureText.text!
            record_fracture_gradient = gradientText.text!
            record_layer_name = layerName.text!
            fetch_index = index
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
