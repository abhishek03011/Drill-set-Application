//
//  ResultViewController.swift
//  uhclproject
//
//  Created by Abhishek Kumar on 4/23/16.
//  Copyright © 2016 Abhishek Kumar. All rights reserved.
//

import UIKit



class ResultViewController: UIViewController,change,change1,change2,change3,change4 {
    
     var del = UIApplication.sharedApplication().delegate as! AppDelegate
    
    func updateit(sender: GraphView) -> String? {
     return sent
    }
    func updateit1(sender: GraphView) -> String? {
        return sent1
    }
    func updateit2(sender: GraphView) -> String? {
        return sent2
    }
    func updateit3(sender: GraphView) -> String? {
        return sent3
    }
    func updateit4(sender: GraphView) -> String? {
        return sent4
    }

    @IBAction func seting(sender: UIButton)
    {
   
    
    }
    
    @IBOutlet weak var graphdisplay: GraphView!
    {
        didSet{
        
            graphdisplay.datasource = self
            graphdisplay.datasource1 = self
            graphdisplay.datasource2 = self
            graphdisplay.datasource3 = self
            graphdisplay.datasource4 = self
        
        }
    }
    func update()
    {
        graphdisplay.setNeedsDisplay()
    }
    
       
    @IBAction func unwind(segue: UIStoryboardSegue)
    {
        let data:GraphPopController = segue.sourceViewController as! GraphPopController
        sent = data.donedata
        sent1 = data.tripdata
        sent2 = data.fracdata
        sent3 = data.kickdata
        sent4 = data.casdata
        del.checked = sent
        del.checked1 = sent1
        del.checked2 = sent2
        del.checked3 = sent3
        del.checked4 = sent4
    }
    
    var sent:String = "0"
        {
        didSet
        {
        update()
   
        }
        
    }
    
    
    var sent1:String = "0"
        {
        didSet
        {
            update()
            
        }
    }
    
    var sent2:String = "0"
        {
        didSet
        {
            update()
           
        }
    }
    
    
    var sent3:String = "0"
        {
        didSet
        {
            update()
           
        }
    }
    
    
    var sent4:String = "0"
        {
        didSet
        {
            update()
           
        }
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
               // Do any additional setup after loading the view.
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
