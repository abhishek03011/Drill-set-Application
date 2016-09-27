//
//  GeneralPage.swift
//  uhclproject
//
//  Created by Abhishek Kumar on 3/28/16.
//  Copyright © 2016 Abhishek Kumar. All rights reserved.
//

import UIKit


class GeneralPage: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate
{
    let wellconfig=WellConfigViewController()
    
    var welldepthvalues:Double = 0.0  //for depth(TVD)
 /////////////////General part////////////////
    
    @IBOutlet weak var generallabel: UILabel!
    
    
    @IBOutlet weak var welldepthlabel: UILabel!
    
    
    @IBOutlet weak var WellDepthBox: UITextField!
    
    
    @IBOutlet weak var WellIsOffshoreSwitch: UISwitch!
    
    
    @IBOutlet weak var PlatformWellSwitch: UISwitch!
    
    
    @IBOutlet weak var SubwellSwitch: UISwitch!
    
    
    @IBAction func wellisoffshore(sender: UISwitch)
    {
    if sender.on
    {
        PlatformWellSwitch.enabled = true
        SubwellSwitch.enabled = true
        WellDepthBox.enabled = false
        WellDepthBox.text = nil
        welldepthlabel.textColor = UIColor.blackColor()
        welldepthlabel.text = "Water Depth"
        generallabel.textColor = UIColor.blackColor()
        generallabel.text = "GENERAL"
    }
        else
    {
        
        WellDepthBox.enabled = true
        PlatformWellSwitch.enabled = false
        SubwellSwitch.enabled = false
        SubwellSwitch.setOn(false, animated: true)
        PlatformWellSwitch.setOn(false, animated: true)
        welldepthlabel.textColor = UIColor.blackColor()
        welldepthlabel.text = "Water Depth"
        generallabel.textColor = UIColor.blackColor()
        generallabel.text = "GENERAL"
    }
    }
    
    
    
    @IBAction func platformwell(sender: UISwitch)
    {
    if sender.on
    {
    SubwellSwitch.setOn(false, animated: true)
    }
        else
    {
        SubwellSwitch.setOn(false, animated: true)
        }
    }
    
    @IBAction func subsea(sender: UISwitch)
    {
    if sender.on
    {
        PlatformWellSwitch.setOn(false, animated: true)
        }
        else
    {
        PlatformWellSwitch.setOn(true, animated: true)
        }
    }
    
    
    @IBAction func welldepthaction(sender: UITextField) //Water depth
    {
        
        let parse = 0.00
        let parse2 = 99999.99
        let message = "Error!! Enter Numbers"
        let message1 = "Error!! Enter in range"
        let message2 = "Water Depth"
    
       if let text = sender.text where !text.isEmpty
        {
            if Double(sender.text!) != nil
            {
                let value1 = Double(sender.text!)
            
                if (value1 >= parse) && (value1 <= parse2)
                    {
                       
                        generallabel.text = "GENERAL"
                        generallabel.textColor = UIColor.blackColor()
                        welldepthlabel.text = message2
                        welldepthlabel.textColor = UIColor.blackColor()
                    }
                
                else
                    {
                   
                    generallabel.text = message1
                    generallabel.textColor = UIColor.redColor()
                    welldepthlabel.text = message2
                    welldepthlabel.textColor = UIColor.redColor()
                    WellDepthBox.text = nil
                    
                    }
                
            }
                
            else
                {
                
                generallabel.textColor = UIColor.redColor()
                generallabel.text = message
                welldepthlabel.textColor = UIColor.redColor()
                WellDepthBox.text = nil
            
                }
            
        }
        else
        {
            generallabel.textColor = UIColor.blackColor()
            generallabel.text = "GENERAL"
            welldepthlabel.textColor = UIColor.blackColor()
        }
    }
    
    
  /////////////////////////////////////////////

/////////////////////////Kick///////////////////
    
    @IBOutlet weak var kickintensityLabel: UILabel!
    
    @IBOutlet weak var influxvolumelabel: UILabel!
    
    @IBOutlet weak var kickmarginlabel: UILabel!
    
    @IBOutlet weak var kickbox: UILabel!
    
    @IBOutlet weak var kickintensity: UISwitch!
    
    @IBOutlet weak var influxvolume: UISwitch!
    
    @IBOutlet weak var kickmargin: UISwitch!
    
    @IBOutlet weak var kickintensitybox: UITextField!
    
    @IBOutlet weak var influxvolumebox: UITextField!
    
    @IBOutlet weak var kickmarginbox: UITextField!
    
    @IBAction func kickIntensitySwitch(sender: UISwitch)
    {
        if sender.on
        {
            kickintensitybox.enabled = true
        }
    else
        {
            kickintensitybox.enabled = false
            kickintensitybox.text = nil
            kickbox.textColor = UIColor.blackColor()
           kickintensityLabel.textColor = UIColor.blackColor()
            kickbox.text = "KICK"
        }
    }
    
    
    @IBAction func InfluxVolumeswitch(sender: UISwitch)
    {
    
        if sender.on
        {
            influxvolumebox.enabled = true
            
        }
        else
        {
        
            influxvolumebox.enabled = false
            influxvolumebox.text = nil
            kickbox.textColor = UIColor.blackColor()
            influxvolumelabel.textColor = UIColor.blackColor()
            kickbox.text = "KICK"
        }
    }
    
    
    @IBAction func KickMarginSwitch(sender: UISwitch)
    {
    
        if sender.on
        {
            kickmarginbox.enabled = true
        }
        
        else
        {
            kickmarginbox.enabled = false
            kickmarginbox.text = nil
            kickbox.textColor = UIColor.blackColor()
            kickmarginlabel.textColor = UIColor.blackColor()
            kickbox.text = "KICK"
        }
    }
    
    
    @IBAction func kickintensitytextbox(sender: UITextField)
    {
        let message3 = "Error!! enter greater > 0 "
        if let text1 = sender.text where !text1.isEmpty
        {
            if (Double(sender.text!)) != nil
            {
                
                let value1 =  Double(sender.text!)
                
                if(value1>0.0)
                {
                   kickintensityLabel.textColor = UIColor.blackColor()
                    kickbox.textColor = UIColor.blackColor()
                    kickbox.text = "KICK"
                    
                }
                else
                {
                    kickbox.text = message3
                    kickintensityLabel.textColor = UIColor.redColor()
                    kickbox.textColor = UIColor.redColor()
                    kickintensitybox.text = nil
                    
                }
            }
            else
            {
                kickbox.text = "Error enter numbers"
                kickbox.textColor = UIColor.redColor()
                kickintensityLabel.textColor = UIColor.redColor()
                kickintensitybox.text = nil
            }
            
        }
        else
        {
            
            kickbox.text = "KICK"
            kickbox.textColor = UIColor.blackColor()
            kickintensityLabel.textColor = UIColor.blackColor()
        }
        

    }
    
    @IBAction func InfluxvolumeTextbox(sender: UITextField)
    {
        
        let message3 = "Error!! enter greater > 0 "
        if let text1 = sender.text where !text1.isEmpty
        {
            if (Double(sender.text!)) != nil
            {
                
                let value1 =  Double(sender.text!)
                
                if(value1>0.0)
                {
                    influxvolumelabel.textColor = UIColor.blackColor()
                    kickbox.textColor = UIColor.blackColor()
                    kickbox.text = "KICK"
                    
                }
                else
                {
                    kickbox.text = message3
                    influxvolumelabel.textColor = UIColor.redColor()
                    kickbox.textColor = UIColor.redColor()
                    influxvolumebox.text = nil
                    
                }
            }
            else
            {
                kickbox.text = "Error enter numbers"
                kickbox.textColor = UIColor.redColor()
                influxvolumelabel.textColor = UIColor.redColor()
                influxvolumebox.text = nil
            }
            
        }
        else
        {
            
            kickbox.text = "KICK"
            kickbox.textColor = UIColor.blackColor()
            influxvolumelabel.textColor = UIColor.blackColor()
        }

        
    }

    @IBAction func kickmarginTextbox(sender: UITextField)
    {
        let message3 = "Error!! enter between 0 - 5"
    if let text1 = sender.text where !text1.isEmpty
    {
        if (Double(sender.text!)) != nil
        {
        
            let value1 =  Double(sender.text!)
            
            if(value1 >= 0.0) && (value1 <= 5.0)
            {
                kickmarginlabel.textColor = UIColor.blackColor()
                kickbox.textColor = UIColor.blackColor()
                kickbox.text = "KICK"
            
            }
            else
            {
                kickbox.text = message3
                kickmarginlabel.textColor = UIColor.redColor()
                kickbox.textColor = UIColor.redColor()
                kickmarginbox.text = nil

            }
        }
        else
        {
            kickbox.text = "Error enter numbers"
            kickbox.textColor = UIColor.redColor()
            kickmarginlabel.textColor = UIColor.redColor()
            kickmarginbox.text = nil
        }
        
    }
    else
    {
            
            kickbox.text = "KICK"
            kickbox.textColor = UIColor.blackColor()
            kickmarginlabel.textColor = UIColor.blackColor()
    }
        
    }
   /////////////////////////////////////////
    
    
    /////////////////////depth/////////////
    
    @IBOutlet weak var elevationlabel: UILabel!
    
    @IBOutlet weak var DepthLabeler: UILabel!
    
    @IBOutlet weak var wellDepthlabeler: UILabel!
    
    @IBOutlet weak var Elevationbox: UITextField!
    
    @IBOutlet weak var MeasuredDepthLabel: UITextField!
    
    @IBOutlet weak var wellDepthlabel: UITextField!
    
    @IBOutlet weak var WellFromDeviation: UISwitch!
    
    @IBOutlet weak var WellisDeviatedSwitch: UISwitch!
    
    @IBOutlet weak var referencepointpicker: UIPickerView!
    
    @IBAction func Wellisdeviated(sender: UISwitch)
    {
    if sender.on
    {
        MeasuredDepthLabel.enabled = true
        WellFromDeviation.enabled = true
        }
        else
    {
        MeasuredDepthLabel.enabled = false
        MeasuredDepthLabel.text = nil
        WellFromDeviation.enabled = false
        WellFromDeviation.setOn(false, animated: true)
        }
    }
    
    @IBAction func WellFromDeviationSwitch(sender: UISwitch)
    {
    if sender.on
    {
        wellDepthlabel.enabled = false
        wellDepthlabel.text = nil
        }
    else{
        wellDepthlabel.enabled = true
        }
    
    }
    
    var depthpicker:[String] = ["Choose","RKB","MGL"]
    
     var counter:Int = 0
    @IBAction func WellDepthBox(sender: UITextField)
    {
       
        let message3 = "Error!! enter in range"
        if let text1 = sender.text where !text1.isEmpty
        {
            if (Double(sender.text!)) != nil
            {
                
                
                let value1 =  Double(sender.text!)
                
                if(value1 >= 0.0) && (value1 <= 99999.0) && (counter >= 0)
                {
                    if (casingvalue < value1)// add for here >>>>>>>>>>>>>>>>
                    {
                    wellDepthlabeler.textColor = UIColor.blackColor()
                    DepthLabeler.textColor = UIColor.blackColor()
                    welldepthvalues = value1!
                    DepthLabeler.text = "DEPTH"
                    counter += 1
                    
                    welllabel.text = "WELL"
                    welllabel.textColor = UIColor.blackColor()
                    firstcasinglabel.textColor = UIColor.blackColor()
                    }
                    else
                    {
                      DepthLabeler.text = "Value must be > Casing depth"
                      wellDepthlabeler.textColor = UIColor.redColor()
                      DepthLabeler.textColor = UIColor.redColor()

                    }
                        
                }
                    /// Redundant checking ////
                 /*
                    else if (value1 >= 0.0) && (value1 <= 99999.0) && (counter > 0)
                {
                        
                    wellDepthlabeler.textColor = UIColor.blackColor()
                    DepthLabeler.textColor = UIColor.blackColor()
                    welldepthvalues = 0
                    DepthLabeler.text = "DEPTH"
                    counter += 1
                print("hieee")
                }*/
                    
                else
                {
                    DepthLabeler.text = message3
                    wellDepthlabeler.textColor = UIColor.redColor()
                    DepthLabeler.textColor = UIColor.redColor()
                    counter = 0
                }
            }
            else
            {
                DepthLabeler.text = "Error enter numbers"
               DepthLabeler.textColor = UIColor.redColor()
                wellDepthlabeler.textColor = UIColor.redColor()
            }
            
        }
        else
        {
            
            DepthLabeler.text = "DEPTH"
            DepthLabeler.textColor = UIColor.blackColor()
            wellDepthlabeler.textColor = UIColor.blackColor()
            counter += 1
            welldepthvalues = 0
            if casingcheck > 0
            {
                welllabel.text = "No value in Well Depth"
                welllabel.textColor = UIColor.redColor()
                firstcasinglabel.textColor = UIColor.redColor()
            }
            
            
        }

    
    
    
    }
    
    
    @IBAction func elevationbox(sender: UITextField)
    {
        let message3 = "Error!! enter between 0 & < well Depth "
        
        if let text1 = sender.text where !text1.isEmpty
        {
            if ((Double(sender.text!)) != nil)
            {
                if (welldepthvalues > 0.0) && (welldepthvalues < 99999.99)
                {
                    
                    let value1 =  Double(sender.text!)
                    
                    if (value1 > 0.000) && (value1 <= welldepthvalues)                 {
                        elevationlabel.textColor = UIColor.blackColor()
                        DepthLabeler.textColor = UIColor.blackColor()
                        DepthLabeler.text = "DEPTH"
                        
                        
                    }
                    else
                    {
                       DepthLabeler.text = message3
                       DepthLabeler.textColor = UIColor.redColor()
                       elevationlabel.textColor = UIColor.redColor()
                        
                    }
                }
                else
                    
                {
                    
                   DepthLabeler.text = "Value must be less than Well Depth"
                    DepthLabeler.textColor = UIColor.redColor()
                    elevationlabel.textColor = UIColor.redColor()
                    
                }
            }
            else
            {
                DepthLabeler.text = "Error enter numbers"
                elevationlabel.textColor = UIColor.redColor()
               DepthLabeler.textColor = UIColor.redColor()
            }
            
        }
        else
        {
            
            DepthLabeler.text = "DEPTH"
            elevationlabel.textColor = UIColor.blackColor()
            DepthLabeler.textColor = UIColor.blackColor()
        }

    
    
    }
    ///////////////////////////////////////
    
    /////////////Constraints///////////////
    
    
    @IBOutlet weak var OverbalancedMarginSwitch: UISwitch!
    
    @IBOutlet weak var StabilityMarginSwitch: UISwitch!
    
    @IBOutlet weak var DifferentialStickingSwitch: UISwitch!
    
    @IBOutlet weak var RiserMarginSwitch: UISwitch!
    
    
    @IBAction func Overbalancemargin(sender: UISwitch)
    {
    
    }
    
    @IBAction func StabilityMargin(sender: UISwitch)
    {
    
    }
    
    @IBAction func DifferentialSticking(sender: UISwitch)
    {
    
    }
    
    @IBAction func RiserMargin(sender: UISwitch)
    {
    
    }
    
    ////////////////////////////////////////
    
    //////////////////Temperature/////////////////////////
    
    @IBOutlet weak var TeperatureLabel: UILabel!
    
    @IBOutlet weak var SurfaceTemperatureLabel: UILabel!
    
    @IBOutlet weak var Mudlinelabel: UILabel!
    
    @IBOutlet weak var tempatwelllabel: UILabel!
    
    @IBOutlet weak var SurfaceTemperaturebox: UITextField!
    
    
    @IBOutlet weak var MudLinebox: UITextField!
    
    
    @IBOutlet weak var TemperatureWellBox: UITextField!
    
    
    @IBAction func SurfaceTemperatureBox(sender: UITextField)
    {
    
        let message3 = "Error!! enter between 0 - 1000 "
       
        if let text1 = sender.text where !text1.isEmpty
        {
            if (Double(sender.text!)) != nil
            {
                
                let value1 =  Double(sender.text!)
                
              if (value1 > 0.000) && (value1 <= 1000.000)
                    
                {
                   SurfaceTemperatureLabel.textColor = UIColor.blackColor()
                   TeperatureLabel.textColor = UIColor.blackColor()
                   TeperatureLabel.text = "TEMPERATURE"
                   
                    
                }
                else
                {
                    TeperatureLabel.text = message3
                    SurfaceTemperatureLabel.textColor = UIColor.redColor()
                    TeperatureLabel.textColor = UIColor.redColor()
                    SurfaceTemperaturebox.text = nil
                    
                }
            }
            else
            {
                TeperatureLabel.text = "Error enter numbers"
                SurfaceTemperatureLabel.textColor = UIColor.redColor()
                TeperatureLabel.textColor = UIColor.redColor()
                SurfaceTemperaturebox.text = nil

            }
            
        }
        else
        {
            
          TeperatureLabel.text = "TEMPERATURE"
          TeperatureLabel.textColor = UIColor.blackColor()
          SurfaceTemperatureLabel.textColor = UIColor.blackColor()
        }
        

        
    }
    
    
    @IBAction func MudLineBox(sender: UITextField)
    {
        
        
        let message3 = "Error!! enter between 0 - 1000 "
        
        if let text1 = sender.text where !text1.isEmpty
        {
            if (Double(sender.text!)) != nil
            {
                
                let value1 =  Double(sender.text!)
                
                if (value1 > 0.000) && (value1 <= 1000.000)
                    
                {
                    Mudlinelabel.textColor = UIColor.blackColor()
                    TeperatureLabel.textColor = UIColor.blackColor()
                    TeperatureLabel.text = "TEMPERATURE"
                }
                else
                {
                    TeperatureLabel.text = message3
                    Mudlinelabel.textColor = UIColor.redColor()
                    TeperatureLabel.textColor = UIColor.redColor()
                    MudLinebox.text = nil
                    
                }
            }
            else
            {
                TeperatureLabel.text = "Error enter numbers"
                Mudlinelabel.textColor = UIColor.redColor()
                TeperatureLabel.textColor = UIColor.redColor()
                MudLinebox.text = nil
            }
            
        }
        else
        {
            
            TeperatureLabel.text = "TEMPERATURE"
            TeperatureLabel.textColor = UIColor.blackColor()
           Mudlinelabel.textColor = UIColor.blackColor()
        }
        

    
    }
    
    
    @IBAction func TempatwellBox(sender: UITextField)
    {
    
        
        let message3 = "Error!! enter between 0 - 1000 "
        
        if let text1 = sender.text where !text1.isEmpty
        {
            if (Double(sender.text!)) != nil
            {
                
                let value1 =  Double(sender.text!)
                
                if (value1 > 0.000) && (value1 <= 1000.000)
                    
                {
                    tempatwelllabel.textColor = UIColor.blackColor()
                    TeperatureLabel.textColor = UIColor.blackColor()
                    TeperatureLabel.text = "TEMPERATURE"
                    
                }
                else
                {
                    TeperatureLabel.text = message3
                    tempatwelllabel.textColor = UIColor.redColor()
                    TeperatureLabel.textColor = UIColor.redColor()
                    TemperatureWellBox.text = nil
                    
                }
             }
            else
             {
                TeperatureLabel.text = "Error enter numbers"
                tempatwelllabel.textColor = UIColor.redColor()
                TeperatureLabel.textColor = UIColor.redColor()
                TemperatureWellBox.text = nil
              }
            
        }
        else
        {
            
            TeperatureLabel.text = "TEMPERATURE"
            TeperatureLabel.textColor = UIColor.blackColor()
            tempatwelllabel.textColor = UIColor.blackColor()
        }

    
    }
    
    /////////////////////////////////////////////
    
    ///////////////////WELL/////////////////////
    
    var firstdata:String = ""
    var lastdata:String = ""
    var lasthole:String = ""
    var valuestorage1 = ""
    var valuestorage2 = ""
    var valuestorage3 = ""
    
    @IBOutlet weak var welllabel: UILabel!
    
    var pickerData: [String] = ["--Select--","Open Hole", "Cased Hole"]
    
    var firstcasingdata: [String] = [String]() //["22 1/4", "33 1/6", " 22 1/6" ]
    
    var lastcasingdata: [String] = [String]() //["--Select--","22 1/4", "33 1/6", " 22 1/6" ]

    var lastholedata: [String] = [String]() //["--Select--","22 1/4", "33 1/6", " 22 1/6" ]
    
    @IBOutlet weak var firstcasinglabel: UILabel!
    
    @IBOutlet weak var firstcasingdepth: UITextField!
    
    
    @IBOutlet weak var complationtype: UIPickerView! //picker tag value is 1
    
    
    @IBOutlet weak var firstcasingdiameter: UIPickerView! //picker value is 3

    
    @IBOutlet weak var lastcasingdiameter: UIPickerView!
    // picker tag is 4
    
    @IBOutlet weak var lastholediameter: UIPickerView!
    //picker tag is 5
    
    @IBOutlet weak var lastholelabel: UILabel!
    
    @IBOutlet weak var lastcasinglabel: UILabel!
    
    var casingcheck:Int = 0
    
    var casingvalue:Double = 0
    @IBAction func firstcasingbox(sender: UITextField)
    
    {
        
        let message3 = "Error!! enter between 0 & less than well Depth "
        
        if let text1 = sender.text where !text1.isEmpty
        {
            if ((Double(sender.text!)) != nil)
            {
                if (welldepthvalues > 0.0) && (welldepthvalues < 99999.99)
                {
                
                let value1 =  Double(sender.text!)
                
                    if (value1 > 0.000) && (value1 <= welldepthvalues)                 {
                            firstcasinglabel.textColor = UIColor.blackColor()
                            welllabel.textColor = UIColor.blackColor()
                            welllabel.text = "WELL"
                           casingcheck += 1
                           casingvalue = value1!
                    
                        }
                    else
                        {
                            welllabel.text = message3
                            welllabel.textColor = UIColor.redColor()
                            firstcasinglabel.textColor = UIColor.redColor()
                    
                        }
                }
                else
                
                {
                    
                    welllabel.text = "Value must be less than Well Depth"
                    welllabel.textColor = UIColor.redColor()
                    firstcasinglabel.textColor = UIColor.redColor()

                }
            }
            else
            {
                welllabel.text = "Error enter numbers"
                firstcasinglabel.textColor = UIColor.redColor()
                welllabel.textColor = UIColor.redColor()
            }
            
        }
        else
        {
            
            welllabel.text = "WELL"
            firstcasinglabel.textColor = UIColor.blackColor()
            welllabel.textColor = UIColor.blackColor()
        }

    }
    
    ///////////////////////////////////////////
    
    override func viewDidAppear(animated: Bool) {
        firstcasingdata = del.cased
        
        lastholedata =  del.lastholepicker
        lastcasingdata = del.cased  //tag 4
        firstcasingdata.insert("--Select--", atIndex: 0)
        lastcasingdata.insert("--Select--", atIndex: 0)
        lastholedata.insert("--Select--", atIndex: 0)
         firstcasingdiameter.reloadAllComponents()
        lastcasingdiameter.reloadAllComponents()
        lastholediameter.reloadAllComponents()
    }
    
    override func viewWillAppear(animated: Bool) {
       
        //print(firstcasingdata)
        firstcasingdata = del.cased
        lastholedata =  del.lastholepicker
        lastcasingdata = del.cased
        firstcasingdata.insert("--Select--", atIndex: 0)
        lastcasingdata.insert("--Select--", atIndex: 0)
        lastholedata.insert("--Select--", atIndex: 0)
        firstcasingdiameter.reloadAllComponents()
        lastcasingdiameter.reloadAllComponents()
        lastholediameter.reloadAllComponents()
    }
    
     var del = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad()
    {
        firstcasingdata = del.cased
        lastholedata =  del.lastholepicker
        lastcasingdata = del.cased
        
         firstcasingdiameter.reloadAllComponents()
        lastcasingdiameter.reloadAllComponents()
        lastholediameter.reloadAllComponents()
        firstcasingdata.insert("--Select--", atIndex: 0)
        lastcasingdata.insert("--Select--", atIndex: 0)
        lastholedata.insert("--Select--", atIndex: 0)
        super.viewDidLoad()
        //////////////////////General////////////
        
        WellIsOffshoreSwitch.setOn(false, animated: true)
        WellIsOffshoreSwitch.tintColor = UIColor.redColor()
        
        
        PlatformWellSwitch.enabled = false
        PlatformWellSwitch.setOn(false, animated: true)
        PlatformWellSwitch.tintColor = UIColor.redColor()
        
        SubwellSwitch.enabled = false
        SubwellSwitch.setOn(false, animated: true)
        SubwellSwitch.tintColor = UIColor.redColor()
        
        
        //////////////////////////////////////////
        
        /////////// kick//////////////////////////
        kickintensity.setOn(false, animated: true)
        kickintensity.tintColor = UIColor.redColor()
        
        influxvolume.setOn(false, animated: true)
        influxvolume.tintColor = UIColor.redColor()
        
        kickmargin.setOn(false, animated: true)
        kickmargin.tintColor = UIColor.redColor()
        
        kickmarginbox.enabled = false
        kickintensitybox.enabled = false
        influxvolumebox.enabled = false
        //////////////////////////////////////////
        
        //////////////////Depth//////////////////
        
        WellisDeviatedSwitch.setOn(false, animated: true)
        WellisDeviatedSwitch.tintColor = UIColor.redColor()
        
        WellFromDeviation.setOn(false, animated: true)
        WellFromDeviation.tintColor = UIColor.redColor()
        
        MeasuredDepthLabel.enabled = false
        
        WellFromDeviation.enabled = false
        
        
        referencepointpicker.delegate = self
        referencepointpicker.dataSource = self
        
        Elevationbox.enabled = false
        
        /////////////////////////////////////////
        
        ////////////Constraints////////////////
        
        OverbalancedMarginSwitch.setOn(false, animated: true)
        OverbalancedMarginSwitch.tintColor = UIColor.redColor()
        
        StabilityMarginSwitch.setOn(false, animated: true)
        StabilityMarginSwitch.tintColor = UIColor.redColor()
        
        DifferentialStickingSwitch.setOn(false, animated: true)
        DifferentialStickingSwitch.tintColor = UIColor.redColor()
        
        RiserMarginSwitch.setOn(false, animated: true)
        RiserMarginSwitch.tintColor = UIColor.redColor()
        
        
        //////////////////////////////////////
        
        //////////////////////Well///////////////////////
        complationtype.dataSource = self
        complationtype.delegate = self
        
        lastholelabel.hidden = true
        lastholediameter.hidden = true
        
        lastcasingdiameter.hidden = true
        lastcasinglabel.hidden = true
        
        firstcasingdiameter.dataSource = self
        firstcasingdiameter.delegate = self
        
        lastcasingdiameter.delegate = self
        lastcasingdiameter.dataSource = self
        
        lastholediameter.delegate = self
        lastholediameter.dataSource = self
        /////////////////////////////////////////////////
        
        
        
        ///////////////Keyboard resign/////////////////
        
        self.hideKeyboardWhenTappedAround()
        
        
        
        ///////////general///////
        
        WellDepthBox.delegate = self
       
        
        ////////////kick///////////////////
        
        kickintensitybox.delegate = self
        influxvolumebox.delegate = self
        kickmarginbox.delegate = self
        
        //////////////Temperature////////////////////
        
        SurfaceTemperaturebox.delegate = self
        MudLinebox.delegate = self
        TemperatureWellBox.delegate = self
        
        //////////////////////Well//////////////
        
        firstcasingdepth.delegate = self
        
        ////////////////////Depth///////////////
        
        Elevationbox.delegate = self
        MeasuredDepthLabel.delegate = self
        wellDepthlabel.delegate = self
        
        
    }
    /////////////////PickerView Complation Type///////////////////////
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1
        {
        return pickerData.count
        }
        else if pickerView.tag == 2
        {
            return depthpicker.count
        }
        else if pickerView.tag == 3
        {
            print(firstcasingdata)
            return firstcasingdata.count
        }
        else if pickerView.tag == 4
        {
           return lastcasingdata.count
        }
        else
        {
            return lastholedata.count
        }
        }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1
        {
        return pickerData[row]
        }
        else if pickerView.tag == 2
        {
            return depthpicker[row]
        }
        else if pickerView.tag == 3
        {
            return firstcasingdata[row]
        }
        else if pickerView.tag == 4
        {
            return lastcasingdata[row]
        }
        else
        {
            return lastholedata[row]
        }
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        if pickerView.tag == 1
        {
    
        var valuestorage = row
        
            
        if valuestorage == 0
        {
            lastholelabel.hidden = true
            lastholediameter.hidden = true
            
            lastcasingdiameter.hidden = true
            lastcasinglabel.hidden = true
            
             valuestorage1 = pickerData[row]
            del.valuestorage1 = valuestorage1
            print ("valuestorage1\(valuestorage1)")
            print ("del.valuestorage1\(del.valuestorage1)")

        }
         if valuestorage == 1
        {
            lastholediameter.hidden = false
            lastholelabel.hidden = false
            lastcasingdiameter.userInteractionEnabled = false
            
             let valuestorage2 = pickerData[row]
            del.valuestorage2 = valuestorage2
            print (valuestorage2)
        }
            else
            {
            
                lastcasingdiameter.userInteractionEnabled = true
                valuestorage2 = ""

                
            }
     if valuestorage == 2
        {
            lastcasinglabel.hidden = false
            lastcasingdiameter.hidden = false
            lastholediameter.userInteractionEnabled = false
            valuestorage3 = pickerData[row]
            del.valuestorage3 = valuestorage3
            print(valuestorage3)
        }
            else
            {
                lastholediameter.userInteractionEnabled = true
        valuestorage3 = ""
            }
        }
        
        
        
        ///////////detph///reference point/////////
        
    if pickerView.tag == 2
        {
            let pick = row
            
            var thisdata = ""
            
        
        
        if pick == 1
        {
            Elevationbox.enabled = true
            thisdata = depthpicker[pick]
            print(thisdata)
        }
            else
        {
            Elevationbox.enabled = false
            Elevationbox.text = nil
            elevationlabel.textColor = UIColor.blackColor()
            DepthLabeler.textColor = UIColor.blackColor()
            DepthLabeler.text = "DEPTH"
            thisdata = depthpicker[pick]
            print(thisdata)
        }
    
        }
        
        if pickerView.tag == 3
        {

            
            firstdata = firstcasingdata[row]
            print(firstdata)
            
            del.firstvalueonpage = firstdata
            
        }
        
        if pickerView.tag == 4
        {
            
            lastdata = lastcasingdata[row]
           del.firstlastcasing = lastdata
            print(lastdata)
        }
        
        if pickerView.tag == 5
        {
            
            lasthole = lastholedata[row]
            del.firstlasthole = lasthole
            print(lasthole)
        }
        
    }
        

    ////////////////////////////////////////////////////////////////////
    
    
    ////////////hide keyboard/////////////
  
        func hideKeyboardWhenTappedAround()
        {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GeneralPage.dismissKeyboard))
            view.addGestureRecognizer(tap)
        }
        
        func dismissKeyboard()
        {
            view.endEditing(true)
        }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
    /////////////////////////////////////
    
    
    
  
}
