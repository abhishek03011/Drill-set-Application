//
//  ViewController.swift
//  WellConfiguration
//
//  Created by Ravi, Prathyusha on 2/23/16.
//  Copyright © 2016 Ravi, Prathyusha. All rights reserved.
//

import UIKit


class WellConfigViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    let ManagingHoles = ManageInventories()
    
    /*Case Inventory Variables and collections*/
    var arrCasingsText: [String] = ["2 3/8", "2 7/8", "3 1/2", "4", "4 1/2", "5", "5 1/2", "6 5/8", "7", "7 5/8", "7 3/4",  "8 5/8", "9 5/8", "10 3/4", "11 3/4", "11 7/8", "13 3/8", "13 5/8", "14", "16", "18 5/8", "20", "22", "24", "26", "30", "32", "36"]
    var arrCasingsValue: [Double] = [2.375, 2.875, 3.5, 4, 4.5, 5, 5.5, 6.625, 7, 7.625, 7.75, 8.625, 9.625, 10.75, 11.75, 11.875, 13.375, 13.625, 14, 16, 18.625, 20, 22, 24, 26, 30, 32, 36 ]
    var arrAllCasingsText: [String] = ["2 3/8", "2 7/8", "3 1/2", "4", "4 1/2", "5", "5 1/2", "6 5/8", "7", "7 5/8", "7 3/4",  "8 5/8", "9 5/8", "10 3/4", "11 3/4", "11 7/8", "13 3/8", "13 5/8", "14", "16", "18 5/8", "20", "22", "24", "26", "30", "32", "36"]/*Arrays have all casings (Default casings + user added casings)*/
    var arrAllCasingsValue: [Double] = [2.375, 2.875, 3.5, 4, 4.5, 5, 5.5, 6.625, 7, 7.625, 7.75, 8.625, 9.625, 10.75, 11.75, 11.875, 13.375, 13.625, 14, 16, 18.625, 20, 22, 24, 26, 30, 32, 36 ]/*Arrays have all casings (Default casings + user added casings)*/
    var arrnewCasingsText: [String] = []/*Arrays used for insertion of new casings*/
    var arrnewCasingsValue: [Double] = []/*Arrays used for insertion of new casings*/
    
    var selectedCasingText: [String]=[]/*Array used for user selection of casings*/
    var selectedCasingValue: [Double]=[]/*Array used for user selection of casings*/
    
    /*Hole Inventory Variables and collections*/
    var arrHolesText: [String] = ["3 3/4", "3 7/8", "4 1/8", "4 1/2", "4 3/4", "5 5/8", "6", "6 1/8", "6 1/4", "6 3/8", "6 1/2", "6 3/4", "7 1/2", "7 7/8", "8 3/8", "8 1/2",  "8 5/8", "8 3/4", "9 1/2", "10 3/8", "10 5/8", "11", "11 5/8", "12", "12 1/4", "13 1/2", "13 3/4", "14 1/2", "14 3/4", "15", "15 1/2", "16", "17", "17 1/2", "18 1/2", "18 5/8", "20", "22", "23", "24", "26","28", "36", "48"]
    var arrHolesValue: [Double] = [3.75,3.875,4.125,4.5,4.75,5.625,6,6.125,6.25,6.375,6.5,6.75,7.5,7.875,8.375,8.5,8.625,8.75,9.5,10.375,10.625,11,11.625,12,12.25,13.5,13.75,14.5,14.75,15,15.5,16,17,17.5,18.5,18.625,20,22,23,24,26,28,36,48]
    
    var arrAllHolesText: [String] = ["3 3/4", "3 7/8", "4 1/8", "4 1/2", "4 3/4", "5 5/8", "6", "6 1/8", "6 1/4", "6 3/8", "6 1/2", "6 3/4", "7 1/2", "7 7/8", "8 3/8", "8 1/2",  "8 5/8", "8 3/4", "9 1/2", "10 3/8", "10 5/8", "11", "11 5/8", "12", "12 1/4", "13 1/2", "13 3/4", "14 1/2", "14 3/4", "15", "15 1/2", "16", "17", "17 1/2", "18 1/2", "18 5/8", "20", "22", "23", "24", "26","28", "36", "48"]/*Arrays have all holes (Default holes + user added holes)*/
    var arrAllHolesValue: [Double] = [3.75,3.875,4.125,4.5,4.75,5.625,6,6.125,6.25,6.375,6.5,6.75,7.5,7.875,8.375,8.5,8.625,8.75,9.5,10.375,10.625,11,11.625,12,12.25,13.5,13.75,14.5,14.75,15,15.5,16,17,17.5,18.5,18.625,20,22,23,24,26,28,36,48]/*Arrays have all holes (Default holes + user added holes)*/
    var arrnewHolesText: [String] = []/*Arrays used for insertion of new holes*/
    var arrnewHolesValue: [Double] = []/*Arrays used for insertion of new holes*/
    
    var selectedHolesText: [String]=[]/*Array used for user selection of holes*/
    var selectedHolesValue: [Double]=[]/*Array used for user selection of holes*/
    
    /*Drilling parameters list*/
    var arrdrillpipeOD: [String] = ["2 3/8","2 7/8","3 1/2", "4", "4 1/2", "5", "5 1/2", "6 5/8" ]
    var arrdrillBHAOD: [String] = ["2 7/8","3","3 1/4", "3 1/2","3 3/4","4","4 1/4", "4 1/2","4 3/4","5","5 1/4", "5 1/2","5 3/4","6","6 1/4", "6 1/2","6 3/4","7","7 1/4", "7 1/2","7 3/4","8","8 1/4", "8 1/2","8 3/4","9","9 1/4", "9 1/2","9 3/4","10","10 1/4", "10 1/2","10 3/4","11","11 1/4"]
    
    
    //IBOutlets - FILTERS VIEW - START
    @IBOutlet weak var pkrFirstCasing: UIPickerView!
    @IBOutlet weak var pkrLastCasing: UIPickerView!
    @IBOutlet weak var pkrFirstHole: UIPickerView!
    @IBOutlet weak var pkrLastHole: UIPickerView!
    @IBOutlet weak var pkrtype: UIPickerView!
    @IBOutlet weak var lblerrorselection: UILabel!
    @IBOutlet weak var txtNumCasings: UITextField!
    @IBOutlet weak var btnDrawCircle: UIButton!
    @IBOutlet weak var WellConfigView: UIView!
    //IBOutlets - FILTERS VIEW - END
    
    
    //IBOutlets - CONFIG VIEW - START
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var lblnumcasingsstat: UILabel!
    //IBOutlets - CONFIG VIEW - END
    
    
    //IBOutlets - CASING VIEW - START
    @IBOutlet weak var CasingView: UIView!
    @IBOutlet weak var viewToggleAddDelete: UIView!
    @IBOutlet weak var viewAdd: UIView!
    @IBOutlet weak var viewDelete: UIView!
    @IBOutlet weak var btnSelectedCasings: UIButton!
    @IBOutlet weak var txtcasefracj: UITextField!
    @IBOutlet weak var txtcasefraci: UITextField!
    @IBOutlet weak var txtcasei: UITextField!
    @IBOutlet weak var txtcasej: UITextField!
    @IBOutlet weak var btnDeleteCasings: UIButton!
    @IBOutlet weak var lblNumberError: UILabel!
    //IBOutlets - CASING VIEW - END
    
    
    //IBOUTLETS - HOLES VIEW - START
    @IBOutlet weak var HolesView: UIView!
    @IBOutlet weak var ViewAddDeteleToggleHoles: UIView!
    @IBOutlet weak var viewDeleteHoles: UIView!
    @IBOutlet weak var viewAddHoles: UIView!
    @IBOutlet weak var txtHolei: UITextField!
    @IBOutlet weak var txtHolej: UITextField!
    @IBOutlet weak var txtHoleFraci: UITextField!
    @IBOutlet weak var txtHoleFracj: UITextField!
    @IBOutlet weak var btnDeleteHoles: UIButton!
    @IBOutlet weak var lblNumberErr: UILabel!
    //IBOUTLETS - HOLES VIEW - END
    
    
    var i:Double=5
    var j:Double=60
    var width:Double = 0
    var height:Double = 1
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadData()
        self.pkrtype.delegate=self
        self.pkrtype.dataSource=self
        pkrtype.tag = 1
        
        self.pkrFirstCasing.delegate=self
        self.pkrFirstCasing.dataSource=self
        pkrFirstCasing.tag = 2
        
        self.pkrLastCasing.delegate=self
        self.pkrLastCasing.dataSource=self
        pkrLastCasing.tag = 3
        
        self.pkrFirstHole.delegate=self
        self.pkrFirstHole.dataSource=self
        pkrFirstHole.tag = 4
        
        self.pkrLastHole.delegate=self
        self.pkrLastHole.dataSource=self
        pkrLastHole.tag = 5
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        LoadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        LoadData()
        
    }
    
    
    /*-------------------------------  CASING VIEW ----------------------------- START*/
    @IBAction func SelectedCasingsList(sender: AnyObject)
    {
        GetDimensionsvalue("CASINGS")
        DeleteButton()
        ToggleViewsTrue(true)
        width = GetDimensionsvalue("CASINGS").0
        height = GetDimensionsvalue("CASINGS").1
        //for var k=0; k<selectedCasingText.count; k++
        if selectedCasingText.count>0 {
            for k in 0..<selectedCasingText.count
            {
                SelectedCasingButton(selectedCasingText[k], i: i, j: j)
                GetNewLayout(i+45, heightCovered: j)
                
            }
        }
        
    }
    @IBAction func CasingInventoryList(sender: AnyObject)
    {
        GetDimensionsvalue("CASINGS")
        DeleteButton()
        viewToggleAddDelete.hidden=true
        viewDelete.hidden=true
        viewAdd.hidden=true
        width = GetDimensionsvalue("CASINGS").0
        height = GetDimensionsvalue("CASINGS").1
        //for var k=0; k<arrAllCasingsText.count; k++
        for k in 0..<arrAllCasingsText.count
        {
            CreateButton("CASINGS",buttonText: arrAllCasingsText[k], i: i, j: j)
            GetNewLayout(i+45, heightCovered: j)
        }
        
        //Persistence of selected buttons
        SelectionPersistence("CASINGS")
        
    }
    
    
    @IBAction func AllowableHoles(sender: AnyObject)
    {
        GetDimensionsvalue("CASINGS")
        DeleteButton()
        viewToggleAddDelete.hidden=true
        viewDelete.hidden=true
        viewAdd.hidden=true
        width = GetDimensionsvalue("CASINGS").0
        height = GetDimensionsvalue("CASINGS").1
        //for var k=0; k<selectedCasingText.count; k++
        if selectedCasingText.count > 0 {
            for k in 0..<selectedCasingText.count
            {
                CreateAllowableHoles(selectedCasingText[k], i: i, j: j)
                GetNewLayout(i+45, heightCovered: j)
            }
        }
        
        
    }
    
    @IBAction func AddDeleteCasings(sender: AnyObject)
    {
        if(viewToggleAddDelete.hidden == true)
        {
            viewToggleAddDelete.hidden=false
            viewDelete.hidden=true
            viewAdd.hidden=false
        }
        else
        {
            viewToggleAddDelete.hidden=true
        }
    }
    
    
    @IBAction func AddCasing(sender: AnyObject)
    {
        viewAdd.hidden=false
        viewDelete.hidden=true
        btnDeleteCasings.hidden = true
        if (viewAdd.hidden==false)
        {
            if(ValidateCasings())
            {
                InsertNewButtons("CASINGS")
                //print(arrnewCasingsText)
                //print(arrnewCasingsValue)
                //print(arrAllCasingsText)
                //print(arrAllCasingsValue)
                GetDimensionsvalue("CASINGS")
                LoadData()
            }
            
        }
        txtcasei.text = ""
        txtcasej.text = ""
        txtcasefraci.text = ""
        txtcasefracj.text = ""
    }
    
    @IBAction func DeleteCasing(sender: AnyObject)
    {
        if(viewDelete.hidden == true)
        {
            
            viewAdd.hidden=true
            /*Delete Case*/
            viewDelete.hidden=false
            btnDeleteCasings.hidden = false
            DeleteButton()
            //for var m=0;m < arrnewCasingsValue.count;m++
            if arrnewCasingsValue.count>0 {
                for m in 0..<arrnewCasingsValue.count
                {
                    let btn = ManagingHoles.createButtonNoAction(arrnewCasingsText[m], i: i, j: j)
                    btn.addTarget(self, action: #selector(WellConfigViewController.DeleteCaseButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                    self.CasingView.addSubview(btn)
                    GetNewLayout(i+45, heightCovered: j)
                }
            }
            
        }
        else
        {
            viewDelete.hidden=true
            btnDeleteCasings.hidden = true
            viewAdd.hidden=false
            
        }
    }
    
    @IBAction func DeleteSelectedCasings(sender: AnyObject) {
        
        let subviews = self.CasingView.subviews as [UIView]
        for v in subviews {
            if let button = v as? UIButton {
                if button.backgroundColor == UIColor.blueColor() || button.backgroundColor == UIColor.grayColor()
                {
                    button.removeFromSuperview()
                    i = ManagingHoles.ResetDimensions().0
                    j = ManagingHoles.ResetDimensions().1
                }
                
                if button.backgroundColor == UIColor.grayColor()
                {
                    //Delete the button value from the ALL,NEW,SELECTED,ALLOWABLE
                    
                    let indexALL:Int = ManagingHoles.GetIndexIfSizeNConfigEqual(arrAllCasingsValue, val: ManagingHoles.CalculateButtonVal((button.titleLabel?.text!)!))
                    arrAllCasingsText.removeAtIndex(indexALL)
                    arrAllCasingsValue.removeAtIndex(indexALL)
                    
                    if arrnewCasingsText.count > 0
                    {
                        let indexNEW:Int = ManagingHoles.GetIndexIfSizeNConfigEqual(arrnewCasingsValue, val: ManagingHoles.CalculateButtonVal((button.titleLabel?.text!)!))
                        arrnewCasingsText.removeAtIndex(indexNEW)
                        arrnewCasingsValue.removeAtIndex(indexNEW)
                    }
                    if selectedCasingText.count > 0
                    {
                        let indexselected:Int = ManagingHoles.GetIndexIfSizeNConfigEqual(selectedCasingValue, val: ManagingHoles.CalculateButtonVal((button.titleLabel?.text!)!))
                        selectedCasingText.removeAtIndex(indexselected)
                        selectedCasingValue.removeAtIndex(indexselected)
                    }
                    if allowableCasingsText.count > 0
                    {
                        let indexallowable:Int = ManagingHoles.GetIndexIfSizeNConfigEqual(allowableCasingsValue, val: ManagingHoles.CalculateButtonVal((button.titleLabel?.text!)!))
                        allowableCasingsText.removeAtIndex(indexallowable)
                        allowableCasingsValue.removeAtIndex(indexallowable)
                    }
                    
                }
            }
        }
        viewAdd.hidden=true
        /*Delete Case*/
        viewDelete.hidden=false
        btnDeleteCasings.hidden = false
        /*let subviewsDel = self.CasingView.subviews as [UIView]
         for v in subviewsDel {
         //print(v)
         if let btn = v as? UIButton {
         //print((button.titleLabel?.text)!)
         if button.titleLabel?.text == btn.titleLabel?.text {
         button.removeFromSuperview()
         }
         }
         }
         i = ManagingHoles.ResetDimensions().0
         j = ManagingHoles.ResetDimensions().1*/
        //print(arrnewCasingsValue.count)
        //for var m=0;m < arrnewCasingsValue.count;m++
        if(arrnewCasingsValue.count>0)
        {
            for m in 0..<arrnewCasingsValue.count
            {
                let btn = ManagingHoles.createButtonNoAction(arrnewCasingsText[m], i: i, j: j)
                btn.addTarget(self, action: #selector(WellConfigViewController.DeleteCaseButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                self.CasingView.addSubview(btn)
                GetNewLayout(i+45, heightCovered: j)
            }
        }
        
    }
    
    
    
    @IBAction func ShowError(sender: AnyObject) {
        let textfield:UITextField = sender as! UITextField
        textField(textfield.text!,type: "CASINGS")
        
    }
   
    /*-------------------------------  CASING VIEW ----------------------------- END*/
    
    
    
    
    
    
    /*-------------------------------  HOLES VIEW ----------------------------- START*/
    
    @IBAction func SelectedHolesList(sender: AnyObject)
    {
        GetDimensionsvalue("HOLES")
        DeleteHolesButton()
        /*viewToggleAddDelete.hidden=true
         viewDelete.hidden=true
         viewAdd.hidden=true*/
        width = GetDimensionsvalue("HOLES").0
        height = GetDimensionsvalue("HOLES").1
        //for var k=0; k<selectedHolesText.count; k++
        if selectedHolesText.count>0
        {
            for k in 0..<selectedHolesText.count
            {
                SelectedHolesButton(selectedHolesText[k], i: i, j: j)
                GetNewLayout(i+45, heightCovered: j)
            }
        }
    }
    @IBAction func HoleInventoryList(sender: AnyObject)
    {
        GetDimensionsvalue("HOLES")
        DeleteHolesButton()
        /*viewToggleAddDelete.hidden=true
         viewDelete.hidden=true
         viewAdd.hidden=true*/
        width = GetDimensionsvalue("HOLES").0
        height = GetDimensionsvalue("HOLES").1
        //for var k=0; k<arrAllHolesText.count; k++
        for k in 0..<arrAllHolesText.count
        {
            CreateButton("HOLES",buttonText: arrAllHolesText[k], i: i, j: j)
            GetNewLayout(i+45, heightCovered: j)
        }
        
        //Persistence of selected buttons
        SelectionPersistence("HOLES")
    }
    @IBAction func AllowableCasings(sender: AnyObject)
    {
        GetDimensionsvalue("HOLES")
        DeleteHolesButton()
        /*viewToggleAddDelete.hidden=true
         viewDelete.hidden=true
         viewAdd.hidden=true*/
        width = GetDimensionsvalue("HOLES").0
        height = GetDimensionsvalue("HOLES").1
        //for var k=0; k<selectedHolesText.count; k++
        if selectedHolesText.count>0 {
            for k in 0..<selectedHolesText.count
            {
                CreateAllowableCasings(selectedHolesText[k], i: i, j: j)
                GetNewLayout(i+45, heightCovered: j)
            }
        }
        
    }
    
    
    
    @IBAction func AddDeleteHoles(sender: AnyObject)
    {
        if(ViewAddDeteleToggleHoles.hidden == true)
        {
            ViewAddDeteleToggleHoles.hidden=false
            viewDeleteHoles.hidden=true
            viewAddHoles.hidden=false
        }
        else
        {
            ViewAddDeteleToggleHoles.hidden=true
        }
    }
    
    
    @IBAction func AddHoles(sender: AnyObject)
    {
        viewAddHoles.hidden=false
        viewDeleteHoles.hidden=true
        btnDeleteHoles.hidden = true
        if (viewAddHoles.hidden==false)
        {
            if(ValidateHoles())
            {
                InsertNewButtons("HOLES")
                //print(arrnewCasingsText)
                //print(arrnewCasingsValue)
                //print(arrAllCasingsText)
                //print(arrAllCasingsValue)
                GetDimensionsvalue("HOLES")
                LoadData()
            }
            
        }
        txtHolei.text = ""
        txtHolej.text = ""
        txtHoleFraci.text = ""
        txtHoleFracj.text = ""
    }
    
    @IBAction func DeleteHoles(sender: AnyObject)
    {
        if(viewDelete.hidden == true)
        {
            viewAddHoles.hidden=true
            /*Delete Hole*/
            viewDeleteHoles.hidden=false
            btnDeleteHoles.hidden = false
            DeleteHolesButton()
            //for var m=0;m < arrnewHolesValue.count;m++
            if(arrnewHolesValue.count>0)
            {
                for m in 0..<arrnewHolesValue.count
                {
                    let btn = ManagingHoles.createButtonNoAction(arrnewHolesText[m], i: i, j: j)
                    btn.addTarget(self, action: #selector(WellConfigViewController.DeleteHoleButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                    self.HolesView.addSubview(btn)
                    GetNewLayout(i+45, heightCovered: j)
                }
            }
            
        }
        else
        {
            viewDeleteHoles.hidden=true
            btnDeleteHoles.hidden = true
            viewAddHoles.hidden=false
            
        }
    }
    
    @IBAction func DeleteSelectedHoles(sender: AnyObject) {
        
        let subviews = self.HolesView.subviews as [UIView]
        for v in subviews {
            if let button = v as? UIButton {
                if button.backgroundColor == UIColor.blueColor() || button.backgroundColor == UIColor.grayColor()
                {
                    button.removeFromSuperview()
                    i = ManagingHoles.ResetDimensions().0
                    j = ManagingHoles.ResetDimensions().1
                }
                
                if button.backgroundColor == UIColor.grayColor()
                {
                    //Delete the button value from the ALL,NEW,SELECTED,ALLOWABLE
                    
                    let indexALL:Int = ManagingHoles.GetIndexIfSizeNConfigEqual(arrAllHolesValue, val: ManagingHoles.CalculateButtonVal((button.titleLabel?.text!)!))
                    arrAllHolesText.removeAtIndex(indexALL)
                    arrAllHolesValue.removeAtIndex(indexALL)
                    
                    if arrnewHolesText.count > 0
                    {
                        let indexNEW:Int = ManagingHoles.GetIndexIfSizeNConfigEqual(arrnewHolesValue, val: ManagingHoles.CalculateButtonVal((button.titleLabel?.text!)!))
                        arrnewHolesText.removeAtIndex(indexNEW)
                        arrnewHolesValue.removeAtIndex(indexNEW)
                    }
                    if selectedHolesText.count > 0
                    {
                        let indexselected:Int = ManagingHoles.GetIndexIfSizeNConfigEqual(selectedHolesValue, val: ManagingHoles.CalculateButtonVal((button.titleLabel?.text!)!))
                        selectedHolesText.removeAtIndex(indexselected)
                        selectedHolesValue.removeAtIndex(indexselected)
                    }
                    if allowableHolesText.count > 0
                    {
                        let indexallowable:Int = ManagingHoles.GetIndexIfSizeNConfigEqual(allowableHolesValue, val: ManagingHoles.CalculateButtonVal((button.titleLabel?.text!)!))
                        allowableHolesText.removeAtIndex(indexallowable)
                        allowableHolesValue.removeAtIndex(indexallowable)
                    }
                    
                }
            }
        }
        viewAddHoles.hidden=true
        /*Delete Case*/
        viewDeleteHoles.hidden=false
        btnDeleteHoles.hidden = false
        //print(arrnewHolesValue.count)
        //for var m=0;m < arrnewHolesValue.count;m++
        if(arrnewHolesValue.count>0)
        {
            for m in 0..<arrnewHolesValue.count
            {
                let btn = ManagingHoles.createButtonNoAction(arrnewHolesText[m], i: i, j: j)
                btn.addTarget(self, action: #selector(WellConfigViewController.DeleteHoleButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                self.HolesView.addSubview(btn)
                GetNewLayout(i+45, heightCovered: j)
            }
        }
        
    }
    
    @IBAction func ShowErrorHOLES(sender: AnyObject) {
        let textfield:UITextField = sender as! UITextField
        textField(textfield.text!,type: "HOLES")
        
    }
    
    /*-------------------------------  HOLES VIEW ----------------------------- END*/
   
    
    
    
    
    
    /*------------------------------- FILTERS VIEW ------------------------------- START*/
    @IBAction func DrawCircle(sender: AnyObject) {
        //let wellconfigWidth:CGFloat = self.WellConfigView.bounds.width
        //let wellconfigHeight = self.WellConfigView.bounds.height
        
        //print("Width \(self.WellConfigView.bounds.width)")
        //print("Height \(self.WellConfigView.bounds.height)")
        //Newly added on 04/19/2016
        
        var firstcasing:String=""
        var lastcasing:String=""
        var firsthole:String=""
        var lasthole:String=""
        if pkrFirstHole.selectedRowInComponent(0) != 0 {
            firsthole = selectedHolesText[pkrFirstHole.selectedRowInComponent(0)-1]
        }
        else
        {
            firsthole = "--Select--"
        }
        if pkrLastHole.selectedRowInComponent(0) != 0 {
            lasthole = selectedHolesText[pkrLastHole.selectedRowInComponent(0)-1]
        }
        else
        {
            lasthole = "--Select--"
        }
        if pkrFirstCasing.selectedRowInComponent(0) != 0 {
            firstcasing = selectedCasingText[pkrFirstCasing.selectedRowInComponent(0)-1]
        }
        else
        {
            firstcasing = "--Select--"
        }
        if pkrLastCasing.selectedRowInComponent(0) != 0 {
            lastcasing = selectedCasingText[pkrLastCasing.selectedRowInComponent(0)-1]
        }
        else
        {
            lastcasing = "--Select--"
        }
        var final:[String] = []
        
        //Initial Validations
        if pkrtype.selectedRowInComponent(0) == 0
        {
            lblerrorselection.text = "Please select Hole type"
        }
        else if selectedHolesText.count == 0 {
            lblerrorselection.text = "Please select Holes from Hole Inventory"
        }
        else if selectedCasingText.count == 0
        {
            lblerrorselection.text = "Please select Casings from Case Inventory"
        }
        else if arrCaseHolesConfig.count == 0
        {
            lblerrorselection.text = "Please select configurations from Allowable holes"
        }
        else if arrHolesCaseConfig.count == 0
        {
            lblerrorselection.text = "Please select configurations from Allowable casings"
        }
        else if (firsthole == "--Select--" && firstcasing == "--Select--") && (lasthole == "--Select--" && lastcasing == "--Select--") {
            lblerrorselection.text = "Please select either hole size or casing size"
            //Please select either first hole size or first casing size
        }
        else if firsthole != "--Select--" && firstcasing != "--Select--" {
            lblerrorselection.text = "Please select either first hole size or first casing size"
            //Please select a last hole size or last casing size
        }
        else if lasthole != "--Select--" && lastcasing != "--Select--" {
            lblerrorselection.text = "Please select either last hole size or last casing size"
            //Please select a last hole size or last casing size
        }
        else
        {
            lblerrorselection.text = ""
            var data:String=""
            //Get the final well configuration
            if txtNumCasings.text == ""{
                data = "10"
            }
            else
            {
                data = txtNumCasings.text!
                lblerrorselection.text = ""
            }
            final = ManagingHoles.CreateFinalConfig(arrCaseHolesConfig, arrHoleAllowableCase: arrHolesCaseConfig, type: pkrtype.selectedRowInComponent(0), fcs: firstcasing, lcs: lastcasing, fhs: firsthole, lhs: lasthole, numcasings: data)
            print("final configuration is : \(final)")
            //FILTERS OF DATA
            var newconfigNumcasings:[String]=[String]()
            var newconfigFirstcase:[String]=[String]()
            var newconfigLastcase:[String]=[String]()
            var newconfigFirstHole:[String]=[String]()
            var newconfigLastHole:[String]=[String]()
            filteredconfig = final
            if firsthole != "--Select--" {
                //filter according to first hole size
                newconfigFirstHole = []
                newconfigFirstHole  = ManagingHoles.validateFirstHole(filteredconfig, firsthole: firsthole)
                if newconfigFirstHole.count>0 {
                    filteredconfig=[]
                    filteredconfig = newconfigFirstHole
                    lblerrorselection.text=""
                }
                else
                {
                    lblerrorselection.text = "No configurations available for selected first hole size"
                }
                print("first hole size filter : \(filteredconfig)")
            }
            else if(firstcasing != "--Select--")
            {
                //filter according to first case size
                newconfigFirstcase = []
                newconfigFirstcase = ManagingHoles.validateFirstcasings(filteredconfig, firstcase: firstcasing)
                if newconfigFirstcase.count>0 {
                    filteredconfig = newconfigFirstcase
                    lblerrorselection.text=""
                }
                else
                {
                    lblerrorselection.text = "No configurations available for selected first case size"
                }
                print("first case size filter : \(filteredconfig)")
            }
            if pkrtype.selectedRowInComponent(0) == 1 && lasthole != "--Select--" {
                //filter according to last hole size
                newconfigLastHole=[]
                newconfigLastHole = ManagingHoles.validateLastHolesOpen(filteredconfig, lasthole: lasthole)
                if newconfigLastHole.count>0 {
                    filteredconfig = newconfigLastHole
                    lblerrorselection.text=""
                }
                else
                {
                    lblerrorselection.text = "No configurations available for selected last hole size with Open hole type"
                }
                print("last hole size filter : \(filteredconfig)")
            }
            else if pkrtype.selectedRowInComponent(0) == 1 && lastcasing != "--Select--"
            {
                //filter according to last case size
                newconfigLastcase = ManagingHoles.validateLastCasingsOpen(filteredconfig, lastcase: lastcasing)
                newconfigLastcase = []
                if newconfigLastcase.count>0 {
                    filteredconfig = newconfigLastcase
                    lblerrorselection.text=""
                }
                else
                {
                    lblerrorselection.text = "No configurations available for selected Last case size with Open hole type"
                }
                print("last case size filter : \(filteredconfig)")
            }
            
            if pkrtype.selectedRowInComponent(0) == 2 && lasthole != "--Select--" {
                //filter according to last hole size
                newconfigLastHole = []
                newconfigLastHole = ManagingHoles.validateLastHoleCased(filteredconfig, lasthole: lasthole)
                if newconfigLastHole.count>0 {
                    filteredconfig = newconfigLastHole
                    lblerrorselection.text=""
                }
                else
                {
                    lblerrorselection.text = "No configurations available for selected Last hole size with Cased hole type"
                }
                print("last hole size filter : \(filteredconfig)")
            }
            else if pkrtype.selectedRowInComponent(0) == 2 && lastcasing != "--Select--"
            {
                //filter according to last case size
                newconfigLastcase = []
                newconfigLastcase = ManagingHoles.validateLastCasingCased(filteredconfig, lastcase: lastcasing)
                if newconfigLastcase.count>0 {
                    filteredconfig = newconfigLastcase
                    lblerrorselection.text=""
                }
                else
                {
                    lblerrorselection.text = "No configurations available for selected Last case size with Cased hole type"
                }
                print("last case size filter : \(filteredconfig)")
            }
            
            if txtNumCasings.text != "" {
                //filter according to number of casings
                newconfigNumcasings = ManagingHoles.validateNumCasings(filteredconfig, numcasings: txtNumCasings.text!)
                if newconfigNumcasings.count > 0
                {
                    filteredconfig = newconfigNumcasings
                    lblerrorselection.text=""
                    //no configurations to show
                }
                else
                {
                    lblerrorselection.text = "No configurations available for selected number of casings"
                }
                
                print("Number of casings filter : \(filteredconfig)")
            }
            
            
            if filteredconfig.count>0 && lblerrorselection.text == ""
            {
                ResetWellConfigDimensions()
                DrawPicture()
                lblnumcasingsstat.text = "\(filteredconfig.count)"
            }
            else
            {
                ResetWellConfigDimensions()
                lblnumcasingsstat.text=""
                ClearPicture()
            }
        }
        let schematicController = SchematicViewController()
        schematicController.final = final
    }
    
    
    @IBAction func ShowErrorNumCasings(sender: AnyObject) {
        let textfield:UITextField = sender as! UITextField
        textField(textfield.text!,type: "NUMCASINGS")
        
    }
    /*------------------------------- FILTERS VIEW ------------------------------- END*/
    
    
    
    
   /*------------------------------- WELLCONFIG VIEW ------------------------------- START*/
    @IBAction func PreviousConfigToggle(sender: AnyObject) {
        m=m-1
        ResetWellConfigDimensions()
        DrawPicture()
    }
    @IBAction func NextConfigToggle(sender: AnyObject) {
        m=m+1
        ResetWellConfigDimensions()
        DrawPicture()
        
    }
    
    /*------------------------------- WELLCONFIG VIEW ------------------------------- END*/

    
    
    
    
    
    
    
    
    func ValidateCasings()->Bool
    {
        var validated:Bool = false
        if textField(txtcasei.text!,type: "CASINGS") && textField(txtcasej.text!,type: "CASINGS") && textField(txtcasefraci.text!,type: "CASINGS") && textField(txtcasefracj.text!,type: "CASINGS")
        {
            validated = true
        }
        return validated
    }
    
    func ValidateHoles()->Bool
    {
        var validated:Bool = false
        if textField(txtHolei.text!,type: "HOLES") && textField(txtHolej.text!,type: "HOLES") && textField(txtHoleFraci.text!,type: "HOLES") && textField(txtHoleFracj.text!,type: "HOLES")
        {
            validated = true
        }
        return validated
    }
    
    
    
    
    
    
    /*--------------------------Functions used-------------------------------------*/
    func LoadData()
    {
        /*CASINGS VIEW - START*/
        GetDimensionsvalue("CASINGS")
        DeleteButton()
        viewToggleAddDelete.hidden=true
        viewDelete.hidden=true
        btnDeleteCasings.hidden = true
        viewAdd.hidden=true
        
        ViewAddDeteleToggleHoles.hidden=true
        viewDeleteHoles.hidden=true
        btnDeleteHoles.hidden = true
        viewAddHoles.hidden=true
        
        width = GetDimensionsvalue("CASINGS").0
        height = GetDimensionsvalue("CASINGS").1
        //for var k=0; k<arrAllCasingsText.count; k++
        for k in 0..<arrAllCasingsText.count
        {
            CreateButton("CASINGS",buttonText: arrAllCasingsText[k], i: i, j: j)
            GetNewLayout(i+45, heightCovered: j)
        }
        
        //Persistence of selected buttons
        SelectionPersistence("CASINGS")
        /*CASINGS VIEW - END*/
        
        /*HOLES VIEW - START*/
        GetDimensionsvalue("HOLES")
        DeleteHolesButton()
        /*viewToggleAddDelete.hidden=true
        viewDelete.hidden=true
        viewAdd.hidden=true*/
        width = GetDimensionsvalue("HOLES").0
        height = GetDimensionsvalue("HOLES").1
        //for var k=0; k<arrAllHolesText.count; k++
        for k in 0..<arrAllHolesText.count
        {
            CreateButton("HOLES",buttonText: arrAllHolesText[k], i: i, j: j)
            GetNewLayout(i+45, heightCovered: j)
        }
        
        //Persistence of selected buttons
        SelectionPersistence("HOLES")
        /*HOLES VIEW - END*/
        lblNumberError.hidden = true
        lblNumberErr.hidden = true
        
        /*Load Data in picker view*/
        LoadPicker()
    }
    
    
    func LoadPicker()
    {
        
        
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var rows = 0;
        switch pickerView.tag {
            
            case 3: if selectedCasingText.count > 0{
            rows = selectedCasingText.count+1
            }
            else
            {
            rows = 1
            }
            case 5: if selectedHolesText.count > 0{
            rows = selectedHolesText.count+1
            }
            else
            {
            rows = 1
            }
            case 4: if selectedHolesText.count > 0{
            rows = selectedHolesText.count+1
            }
            else
            {
            rows = 1
            }
            case 2: if selectedCasingText.count > 0{
            rows = selectedCasingText.count+1
            }
            else
            {
            rows = 1
            }
            default: rows = 3
            
            }
        return rows
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var pickerData:[String] = ["--Select--"]
        switch pickerView.tag {
            
        case 3: if selectedCasingText.count > 0{
            pickerData = selectedCasingText
            pickerData.insert("--Select--", atIndex: 0)
            }
            
        case 5: if selectedHolesText.count > 0{
            pickerData = selectedHolesText
            pickerData.insert("--Select--", atIndex: 0)
            }
        case 4: if selectedHolesText.count > 0{
            pickerData = selectedHolesText
            pickerData.insert("--Select--", atIndex: 0)
            }
        case 2: if selectedCasingText.count > 0{
            pickerData = selectedCasingText
            pickerData.insert("--Select--", atIndex: 0)
            }
        default: pickerData = ["Open hole","Cased hole"]
        pickerData.insert("--Select--", atIndex: 0)
            
        }
        
        
        return pickerData[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        var pickerData:[String] = ["--Select--"]
        
        switch pickerView.tag {
            
        case 3: if selectedCasingText.count > 0{
            pickerData = selectedCasingText
            pickerData.insert("--Select--", atIndex: 0)
        }
        
        case 5: if selectedHolesText.count > 0{
            pickerData = selectedHolesText
            pickerData.insert("--Select--", atIndex: 0)
        }
        case 4: if selectedHolesText.count > 0{
            pickerData = selectedHolesText
            pickerData.insert("--Select--", atIndex: 0)
        }
        case 2: if selectedCasingText.count > 0{
            pickerData = selectedCasingText
            pickerData.insert("--Select--", atIndex: 0)
        }
        default: pickerData = ["Open hole","Cased hole"]
            pickerData.insert("--Select--", atIndex: 0)
            
        }
        
        pickerLabel.text = pickerData[row]
        pickerLabel.font = UIFont(name: "Arial", size: 15)
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
    }
    
    
    
    
    func textField(textField: String, type:String)->Bool  {
        var validated:Bool = true
        if let _ = Int(textField) {
            // Text field converted to an Int
            if type == "CASINGS"
            {
                lblNumberError.hidden = true
            }
            else if(type == "HOLES")
            {
                lblNumberErr.hidden = true
            }
            else if(type == "NUMCASINGS")
            {
                lblerrorselection.text = ""
            }
            
            validated = true
        } else {
            // Text field is not an Int
            lblNumberError.hidden = false
            lblNumberErr.hidden = false
            validated = false
            if type == "NUMCASINGS" {
                lblerrorselection.text = "Please enter numbers only"
            }
            else{
            lblerrorselection.text=""
            }
        }
        return validated
       
    }
    
    /*Get Initial dimensions - CASING/HOLES views*/
    func GetDimensionsvalue(viewname: String)->(Double,Double)
    {
        var width:Double = 0
        var height:Double = 0
        if(viewname == "CASINGS")
        {
            width = Double(self.CasingView.bounds.width)
            //print(width)
            height = Double(self.CasingView.bounds.height)
            //print(height)
        }
        else if(viewname == "HOLES")
        {
            width = Double(self.HolesView.bounds.width)
            //print(width)
            height = Double(self.HolesView.bounds.height)
            //print(height)
        }
        return (width,height)
    }
    
    /*Get the position of the next button*/
    func GetNewLayout(widthCovered: Double, heightCovered: Double)//->(Double,Double)
    {
        
        let balanceWidth = width - widthCovered
        let balanceHeight = height - heightCovered
        if (balanceWidth - 55 >= 0)
        {
            i = widthCovered + 5
        }
        else
        {
            i = 5
            if(balanceHeight > 0)
            {
                j = heightCovered + 5 + 45
            }
        }
    }
    
    
    
    
    /*******************************    CREATING BUTTON    ************************************* ------- START*/
    
    /*Create buttons when Casing Inventory is clicked*/
    func CreateButton(viewname:String,buttonText: String, i: Double,j:Double)
    {
        if(viewname == "CASINGS")
        {
            let btn = ManagingHoles.createButtonNoAction(buttonText, i: i, j: j)
            btn.addTarget(self, action: #selector(WellConfigViewController.SelectCaseButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            self.CasingView.addSubview(btn)
            
        }
        else if(viewname == "HOLES")
        {
            let btn = ManagingHoles.createButtonNoAction(buttonText, i: i, j: j)
            btn.addTarget(self, action: #selector(WellConfigViewController.SelectHolesButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            self.HolesView.addSubview(btn)
        }
    }
    
    /*Create buttons when allowable holes is clicked*/
    func CreateAllowableHoles(buttonText: String, i: Double,j:Double)
    {
        let btn = ManagingHoles.createButtonNoAction(buttonText, i: i, j: j)
        btn.addTarget(self, action: #selector(WellConfigViewController.AllowableHoleButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.CasingView.addSubview(btn)
    }
    /*Create buttons when allowable casings is clicked*/
    func CreateAllowableCasings(buttonText: String, i: Double,j:Double)
    {
        let btn = ManagingHoles.createButtonNoAction(buttonText, i: i, j: j)
        btn.addTarget(self, action: #selector(WellConfigViewController.AllowableCaseButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.HolesView.addSubview(btn)
    }
    
    /*Create buttons when selected casing is clicked*/
    func SelectedCasingButton(buttonText: String, i: Double,j:Double)
    {
        let btn = ManagingHoles.createButtonNoAction(buttonText, i: i, j: j)
        self.CasingView.addSubview(btn)
    }
    
    /*Create buttons when selected holes is clicked*/
    func SelectedHolesButton(buttonText: String, i: Double,j:Double)
    {
        let btn = ManagingHoles.createButtonNoAction(buttonText, i: i, j: j)
        self.HolesView.addSubview(btn)
    }
    /*******************************    CREATING BUTTON    ************************************* ------- END*/
    
    func CreateFittedHoles()
    {
        GetDimensionsvalue("HOLES")
        DeleteHolesButton()
        width = GetDimensionsvalue("HOLES").0
        height = GetDimensionsvalue("HOLES").1
        //for var k=0; k<allowableHolesValue.count; k++
        if allowableHolesValue.count>0 {
            for k in 0..<allowableHolesValue.count
            {
                let btn = ManagingHoles.createButtonNoAction(allowableHolesText[k], i: i, j: j)
                btn.addTarget(self, action: #selector(WellConfigViewController.CaseAllowableHoles(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                self.HolesView.addSubview(btn)
                GetNewLayout(i+45, heightCovered: j)
            }
        }
        
    }
    
    
    func ToggleViewsTrue(hide:Bool)
    {
        viewToggleAddDelete.hidden=hide
        viewDelete.hidden=hide
        viewAdd.hidden=hide
        ViewAddDeteleToggleHoles.hidden = hide
        viewAddHoles.hidden=hide
        viewDeleteHoles.hidden = hide
    }
    func CreateFittedCasings()
    {
        GetDimensionsvalue("CASINGS")
        DeleteButton()
        width = GetDimensionsvalue("CASINGS").0
        height = GetDimensionsvalue("CASINGS").1
        if allowableCasingsText.count>0 {
            for k in 0..<allowableCasingsText.count
            {
                let btn = ManagingHoles.createButtonNoAction(allowableCasingsText[k], i: i, j: j)
                btn.addTarget(self, action: #selector(WellConfigViewController.HoleAllowableCasings(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                self.CasingView.addSubview(btn)
                GetNewLayout(i+45, heightCovered: j)
            }
        }
        
    }
    
    var arrCaseHolesConfig:[String]=[]//Configuration of selected case size
    var arrHolesCaseConfig:[String]=[]//Configuration of selected hole size
    
    func CaseAllowableHoles(sender: UIButton)
    {
        let btn:UIButton = sender
        if btn.backgroundColor == UIColor.grayColor()
        {
            btn.backgroundColor = UIColor.blueColor()
            
        }
        else if btn.backgroundColor == UIColor.blueColor()
        {
            btn.backgroundColor = UIColor.grayColor()
        }
        
        let selectedCasingSize:String = AppendSelectedConfig("CASINGS",selectionType: "SINGLE")
        let config:String = AppendSelectedConfig("HOLES", selectionType: "MULTIPLE")
        let finalconfig:String = selectedCasingSize + "&" + config
        arrCaseHolesConfig = ManagingHoles.AddConfig(arrCaseHolesConfig, selectedConfig: finalconfig).0
        //print("CASEHOLECONFIG : \(arrCaseHolesConfig)")
        del.arrCaseHoleconfig = arrCaseHolesConfig
    }
    
    func HoleAllowableCasings(sender: UIButton)
    {
        let btn:UIButton = sender
        if btn.backgroundColor == UIColor.grayColor()
        {
            btn.backgroundColor = UIColor.blueColor()
            
        }
        else if btn.backgroundColor == UIColor.blueColor()
        {
            btn.backgroundColor = UIColor.grayColor()
        }
        
        let selectedHolesSize:String = AppendSelectedConfig("HOLES",selectionType: "SINGLE")
        let config:String = AppendSelectedConfig("CASINGS", selectionType: "MULTIPLE")
        let finalconfig:String = selectedHolesSize + "&" + config
        arrHolesCaseConfig = ManagingHoles.AddConfig(arrHolesCaseConfig, selectedConfig: finalconfig).0
        del.arrHoleCaseconfig = arrHolesCaseConfig
        //print("HOLECASECONFIG : \(arrHolesCaseConfig)")
    }
    
    func ConfigPersistence(type:String,arrname:[String])
    {
        if(type == "CASINGS")
        {
            let arrnew = ManagingHoles.GetSelection(AppendSelectedConfig("CASINGS", selectionType: "SINGLE"), arrconfig: arrname)
            //for var i=0;i<arrnew.count;i++
            if arrnew.count>0 {
                for i in 0..<arrnew.count
                {
                    let subviews = self.HolesView.subviews as [UIView]
                    for v in subviews {
                        if let button = v as? UIButton {
                            if button.titleLabel?.text! == arrnew[i]
                            {
                                button.backgroundColor = UIColor.grayColor()
                            }
                        }
                    }
                }
            }
            
        }
        if(type == "HOLES")
        {
            let arrnew = ManagingHoles.GetSelection(AppendSelectedConfig("HOLES", selectionType: "SINGLE"), arrconfig: arrname)
            //for var i=0;i<arrnew.count;i++
            if arrnew.count>0 {
            for i in 0..<arrnew.count
            {
                let subviews = self.CasingView.subviews as [UIView]
                for v in subviews {
                    if let button = v as? UIButton {
                        if button.titleLabel?.text! == arrnew[i]
                        {
                            button.backgroundColor = UIColor.grayColor()
                        }
                    }
                }
            }
            }
        }
    }
    
    func AppendSelectedConfig(type:String,selectionType:String)->String
    {
        var btntext:String = ""
        if (type == "CASINGS" && selectionType == "SINGLE")
        {
            let subviews = self.CasingView.subviews as [UIView]
            for v in subviews {
                if let button = v as? UIButton {
                    if button.backgroundColor == UIColor.grayColor()
                    {
                        btntext = (button.titleLabel?.text!)!
                    }
                }
            }

        }
        else if (type == "HOLES" && selectionType == "SINGLE")
        {
            let subviews = self.HolesView.subviews as [UIView]
            for v in subviews {
                if let button = v as? UIButton {
                    if button.backgroundColor == UIColor.grayColor()
                    {
                        btntext = (button.titleLabel?.text!)!
                    }
                }
            }
        }
        else if (type == "CASINGS" && selectionType == "MULTIPLE")
        {
            let subviews = self.CasingView.subviews as [UIView]
            for v in subviews {
                if let button = v as? UIButton {
                    if button.backgroundColor == UIColor.grayColor()
                    {
                        if btntext == ""
                        {
                            btntext = (button.titleLabel?.text!)!
                        }
                        else
                        {
                            btntext = btntext + "&" + (button.titleLabel?.text!)!
                        }
                    }
                }
            }
            
        }
        else if (type == "HOLES" && selectionType == "MULTIPLE")
        {
            let subviews = self.HolesView.subviews as [UIView]
            for v in subviews {
                if let button = v as? UIButton {
                    if button.backgroundColor == UIColor.grayColor()
                    {
                        if btntext == ""
                        {
                            btntext = (button.titleLabel?.text!)!
                        }
                        else
                        {
                            btntext = btntext + "&" + (button.titleLabel?.text!)!
                        }
                    }
                }
            }
        }
        return btntext
    }
    
    
    
    
    
    
    func DeleteCaseButton(sender: UIButton)
    {
        let button:UIButton = sender
        if button.backgroundColor == UIColor.blueColor()
        {
            button.backgroundColor = UIColor.grayColor()
        }
        else
        {
            button.backgroundColor = UIColor.blueColor()
        }
    
    }
    
    func DeleteHoleButton(sender: UIButton)
    {
        let button:UIButton = sender
        if button.backgroundColor == UIColor.blueColor()
        {
            button.backgroundColor = UIColor.grayColor()
        }
        else
        {
            button.backgroundColor = UIColor.blueColor()
        }
        
    }
    

    var allowableHolesText: [String]=[]
    var allowableHolesValue: [Double]=[]
    
    var allowableCasingsText: [String]=[]
    var allowableCasingsValue: [Double]=[]
    
    /*Function triggers when the user selects buttons in ALLOWABLE HOLES*/
    func AllowableHoleButton(sender: UIButton)
    {
        
        let btntext:UIButton = sender
        let subviews = self.CasingView.subviews as [UIView]
        for v in subviews {
            if let button = v as? UIButton {
                if ManagingHoles.FindButton("SELECTED CASINGS", btnText: (button.titleLabel?.text)!, arrname: selectedCasingText)
                {
                    button.backgroundColor = UIColor.blueColor()
                }
                
            }
        }
        allowableHolesText = []
        allowableHolesValue = []
        
        if(btntext.backgroundColor == UIColor.blueColor())
        {
            btntext.backgroundColor = UIColor.grayColor()
            if selectedHolesValue.count > 0
            {
                var index:Int=0
                if ManagingHoles.FindButton("SELECTED HOLES", btnText: (btntext.titleLabel?.text)!, arrname: selectedHolesText)
                {
                    index = ManagingHoles.GetIndexIfSizeNConfigEqual(selectedHolesValue, val: CalculateButtonVal((btntext.titleLabel?.text)!))
                }
                else
                {
                    index = ManagingHoles.GetIndex(selectedHolesValue, val: CalculateButtonVal((btntext.titleLabel?.text)!))
                }
                
                //for var m=0;m<index;m++
                for m in 0..<index
                {
                    if allowableHolesText.count>0
                    {
                        //print(selectedHolesText)
                        //print(btntext.titleLabel?.text)
                        
                        allowableHolesText.insert(selectedHolesText[m], atIndex: m)
                        allowableHolesValue.insert(CalculateButtonVal(selectedHolesText[m]), atIndex: m)
                    }
                    else
                    {
                        //print((btntext.titleLabel?.text)!)
                        allowableHolesText.append(selectedHolesText[m])
                        allowableHolesValue.append(CalculateButtonVal(selectedHolesText[m]))
                    }
                }
                
            }
            //print(allowableHolesText)
        }
        else if(btntext.backgroundColor == UIColor.grayColor())
        {
            btntext.backgroundColor = UIColor.blueColor()
            allowableHolesText = []
            allowableHolesValue = []
        }
        CreateFittedHoles()
        ConfigPersistence("CASINGS", arrname: arrCaseHolesConfig)
    }
    
    
    
    /*Function triggers when the user selects buttons in ALLOWABLE CASINGS*/
    func AllowableCaseButton(sender: UIButton)
    {
        let btntext:UIButton = sender
        let subviews = self.HolesView.subviews as [UIView]
        for v in subviews {
            if let button = v as? UIButton {
                if ManagingHoles.FindButton("SELECTED HOLES", btnText: (button.titleLabel?.text)!,arrname: selectedHolesText)
                {
                    button.backgroundColor = UIColor.blueColor()
                }
                
            }
        }
        allowableCasingsText = []
        allowableCasingsValue = []
        
        if(btntext.backgroundColor == UIColor.blueColor())
        {
            btntext.backgroundColor = UIColor.grayColor()
            if selectedCasingValue.count > 0
            {
                var index:Int=0
                if ManagingHoles.FindButton("SELECTED CASINGS", btnText: (btntext.titleLabel?.text)!, arrname: selectedCasingText)
                {
                    index = ManagingHoles.GetIndexIfSizeNConfigEqual(selectedCasingValue, val: CalculateButtonVal((btntext.titleLabel?.text)!))
                }
                else
                {
                    index = ManagingHoles.GetIndex(selectedCasingValue, val: CalculateButtonVal((btntext.titleLabel?.text)!))
                }
                
                //for var m=0;m<index;m++
                for m in 0..<index
                {
                    if allowableCasingsText.count>0
                    {
                        allowableCasingsText.insert(selectedCasingText[m], atIndex: m)
                        allowableCasingsValue.insert(CalculateButtonVal(selectedCasingText[m]), atIndex: m)
                        //print(allowableCasingsText)
                    }
                    else
                    {
                        allowableCasingsText.append(selectedCasingText[m])
                        allowableCasingsValue.append(CalculateButtonVal(selectedCasingText[m]))
                    }
                }
                
            }
            //print(allowableCasingsText)
        }
        else if(btntext.backgroundColor == UIColor.grayColor())
        {
            btntext.backgroundColor = UIColor.blueColor()
            allowableCasingsText = []
            allowableCasingsValue = []
        }
        CreateFittedCasings()
        ConfigPersistence("HOLES", arrname: arrHolesCaseConfig)
    }
    
    
    
    
    
    /*Delete a button in casing view*/
    func DeleteButton()
    {
        let subviews = self.CasingView.subviews as [UIView]
        for v in subviews {
            //print(v)
            if let button = v as? UIButton {
                //print((button.titleLabel?.text)!)
                if ManagingHoles.FindButton("CASINGS",btnText: (button.titleLabel?.text)!,arrname: arrAllCasingsText) {
                    button.removeFromSuperview()
                }
            }
        }
        i = ManagingHoles.ResetDimensions().0
        j = ManagingHoles.ResetDimensions().1
    }
    
    /*Delete a button in holes view*/
    func DeleteHolesButton()
    {
        let subviews = self.HolesView.subviews as [UIView]
        for v in subviews {
            //print(v)
            if let button = v as? UIButton {
                //print((button.titleLabel?.text)!)
                
                if ManagingHoles.FindButton("HOLES",btnText: (button.titleLabel?.text)!,arrname: arrAllHolesText)
                {
                    button.removeFromSuperview()
                }
            }
        }
        i = ManagingHoles.ResetDimensions().0
        j = ManagingHoles.ResetDimensions().1
    }
    
    
    /*Find a button in selected collection of casings*/
    func FindSelectedCaseButton(btnText:String)->Bool
    {
        var found:Bool = false
        if selectedCasingText.count > 0
        {
            //for var i=0;i<selectedCasingText.count;i++
            for i in 0..<selectedCasingText.count
            {
                if (btnText == selectedCasingText[i])
                {
                    found = true
                }
            }
        }
        return found
    }
    
    /*Find a button in selected collection of Hoels*/
    func FindSelectedHoleButton(btnText:String)->Bool
    {
        var found:Bool = false
        if selectedHolesText.count > 0
        {
            //for var i=0;i<selectedHolesText.count;i++
            for i in 0..<selectedHolesText.count
            {
                if (btnText == selectedHolesText[i])
                {
                    found = true
                }
            }
        }
        return found
    }
    
    
    /*Function triggers when the user selects some buttons in hole inventory*/
    func SelectHolesButton(sender: UIButton)
    {
        let btntext:UIButton = sender
        var found:Bool = true
        if(btntext.backgroundColor == UIColor.blueColor())
        {
            btntext.backgroundColor = UIColor.grayColor()
            if selectedHolesValue.count > 0
            {
                //for var i=0;i<selectedHolesValue.count;i++
                for i in 0..<selectedHolesValue.count
                {
                    if (btntext.titleLabel?.text != selectedHolesText[i])
                    {
                        found = false
                    }
                    else
                    {
                        if found == false
                        {
                            
                        }
                        else
                        {
                            found = true
                        }
                    }
                }
                if found == false
                {
                    let index:Int = ManagingHoles.GetIndex(selectedHolesValue, val: CalculateButtonVal((btntext.titleLabel?.text)!))
                    selectedHolesText.insert((btntext.titleLabel?.text)!, atIndex: index)
                    selectedHolesValue.insert(CalculateButtonVal((btntext.titleLabel?.text)!), atIndex: index)
                }
            }
            else
            {
                //print((btntext.titleLabel?.text)!)
                selectedHolesText.append((btntext.titleLabel?.text)!)
                selectedHolesValue.append(CalculateButtonVal((btntext.titleLabel?.text)!))
            }
        }
        else
        {
            btntext.backgroundColor = UIColor.blueColor()
            if selectedHolesText.count > 0
            {
                for var i=0;i<selectedHolesText.count;i+=1
                //for i in 0..<selectedHolesText.count
                {
                    if (btntext.titleLabel?.text == selectedHolesText[i])
                    {
                        var index:Int = ManagingHoles.GetIndex(selectedHolesValue, val: CalculateButtonVal((btntext.titleLabel?.text)!))
                        if index == selectedHolesValue.count-1
                        {
                            
                        }
                        else
                        {
                            index = index - 1
                        }
                        selectedHolesText.removeAtIndex(index)
                        selectedHolesValue.removeAtIndex(index)
                    }
                    else
                    {
                        //found = false
                    }
                }
            }
        }
        print(selectedHolesText)
        del.lastholepicker = selectedHolesText
        pkrFirstHole.reloadAllComponents()
        pkrLastHole.reloadAllComponents()
    }
    
    /*Function triggers when the user selects some buttons in casing inventory*/
    func SelectCaseButton(sender: UIButton)
    {
        let btntext:UIButton = sender
        var found:Bool = true
        if(btntext.backgroundColor == UIColor.blueColor())
        {
            btntext.backgroundColor = UIColor.grayColor()
            if selectedCasingValue.count > 0
            {
                //for var i=0;i<selectedCasingValue.count;i++
                for i in 0..<selectedCasingValue.count
                {
                    if (btntext.titleLabel?.text != selectedCasingText[i])
                    {
                        found = false
                    }
                    else
                    {
                        if found == false
                        {
                            
                        }
                        else
                        {
                            found = true
                        }
                    }
                }
                if found == false
                {
                    let index:Int = ManagingHoles.GetIndex(selectedCasingValue, val: CalculateButtonVal((btntext.titleLabel?.text)!))
                    selectedCasingText.insert((btntext.titleLabel?.text)!, atIndex: index)
                    selectedCasingValue.insert(CalculateButtonVal((btntext.titleLabel?.text)!), atIndex: index)
                }
            }
            else
            {
                //print((btntext.titleLabel?.text)!)
                selectedCasingText.append((btntext.titleLabel?.text)!)
                selectedCasingValue.append(CalculateButtonVal((btntext.titleLabel?.text)!))
            }
        }
        else
        {
            btntext.backgroundColor = UIColor.blueColor()
            if selectedCasingText.count > 0
            {
                for var i=0;i<selectedCasingText.count;i += 1
                //for i in 0..<selectedCasingText.count
                {
                    if (btntext.titleLabel?.text == selectedCasingText[i])
                    {
                        var index:Int = ManagingHoles.GetIndex(selectedCasingValue, val: CalculateButtonVal((btntext.titleLabel?.text)!))
                        if index == selectedCasingValue.count-1
                        {
                            
                        }
                        else
                        {
                            index = index - 1
                        }
                        selectedCasingText.removeAtIndex(index)
                        selectedCasingValue.removeAtIndex(index)
                    }
                    else
                    {
                        //found = false
                    }
                }
            }
        }
        print(del.cased)
        del.cased = selectedCasingText
        pkrFirstCasing.reloadAllComponents()
        pkrLastCasing.reloadAllComponents()
        
    }
    var casingdata:[String] = [String]()
    
    var del = UIApplication.sharedApplication().delegate as! AppDelegate
    func CalculateButtonVal(btnText:String)->Double
    {
        let intpart:Double = Double(btnText.componentsSeparatedByString(" ")[0])!
        //print(btnText.componentsSeparatedByString(" ").count)
        var decipart:Double = 0
        if(btnText.componentsSeparatedByString(" ").count>1)
        {
            decipart = Double(btnText.componentsSeparatedByString(" ")[1].componentsSeparatedByString("/")[0])!/Double(btnText.componentsSeparatedByString(" ")[1].componentsSeparatedByString("/")[1])!
        }
        let finalval:Double = intpart + decipart
        return finalval
    }
    
    /*Selection persistence in the casing inventory*/
    func SelectionPersistence(viewname:String)
    {
        if(viewname == "CASINGS")
        {
            let subviews = self.CasingView.subviews as [UIView]
            for v in subviews {
                //print(v)
                if let button = v as? UIButton {
                    //print((button.titleLabel?.text)!)
                    if FindSelectedCaseButton((button.titleLabel?.text)!) {
                        button.backgroundColor = UIColor.grayColor()
                    }
                }
            }
        }
        else if(viewname == "HOLES")
        {
            let subviews = self.HolesView.subviews as [UIView]
            for v in subviews {
                //print(v)
                if let button = v as? UIButton {
                    //print((button.titleLabel?.text)!)
                    if FindSelectedHoleButton((button.titleLabel?.text)!) {
                        button.backgroundColor = UIColor.grayColor()
                    }
                }
            }
        }
        
    }
    
    
    
    
    /*Insert a NEW BUTTONS in Casing/Holes views*/
    func InsertNewButtons(type: String)
    {
        var text = ""
        
        if(type == "CASINGS")
        {
            if Int(txtcasei.text!) == 0
            {
                text = txtcasej.text!
            }
            else
            {
                text = txtcasei.text! + txtcasej.text!
            }
            let buttontext = text + " " + txtcasefraci.text! + "/" + txtcasefracj.text!
            
            let NewarrVals = ManagingHoles.InsertNewCasingHole(type, arrnameText: arrAllCasingsText, arrnameValue: arrAllCasingsValue, arrNewnameText: arrnewCasingsText, arrNewnameValue: arrnewCasingsValue, arrSelectedValue: selectedCasingValue, buttontext: buttontext)
            arrAllCasingsText = NewarrVals.0
            arrAllCasingsValue = NewarrVals.1
            arrnewCasingsText = NewarrVals.2
            arrnewCasingsValue = NewarrVals.3
        }
        else if(type == "HOLES")
        {
            if Int(txtHolei.text!) == 0
            {
                text = txtHolej.text!
            }
            else
            {
                text = txtHolei.text! + txtHolej.text!
            }
            let buttontext = text + " " + txtHoleFraci.text! + "/" + txtHoleFracj.text!
            
            let NewarrVals = ManagingHoles.InsertNewCasingHole(type, arrnameText: arrAllHolesText, arrnameValue: arrAllHolesValue, arrNewnameText: arrnewHolesText, arrNewnameValue: arrnewHolesValue, arrSelectedValue: selectedHolesValue, buttontext: buttontext)
            arrAllHolesText = NewarrVals.0
            arrAllHolesValue = NewarrVals.1
            arrnewHolesText = NewarrVals.2
            arrnewHolesValue = NewarrVals.3
        }
        
    }
    
    
    
    
    var m:Int=0
    
    //Initial dimensions of well configuration picture
    let xcoordEven:CGFloat = 140
    let xcoordOdd:CGFloat =  185
    var ycoordEven:CGFloat = 140
    var ycoordOdd:CGFloat = 185
    
    func ResetWellConfigDimensions() {
         ycoordEven = 140
         ycoordOdd = 185
    }
    
    var filteredconfig:[String] = []
    
    
    
    
    func DrawPicture() {
        
        if filteredconfig.count > 0 && m>=0 && m<filteredconfig.count {
            btnPrevious.enabled=true
            btnNext.enabled=true
            let arr = filteredconfig[m].componentsSeparatedByString("&")
            for var i=0;i<arr.count;i+=1 {
                if i%2==0 {
                    //Draw a circle to left
                    let btn = ManagingHoles.createCircles(arr[i], i: xcoordEven-45, j: ycoordEven-35)
                    self.WellConfigView.addSubview(btn)
                    
                    //Draw line to right
                    let leftpoint:CGPoint = CGPointMake(xcoordEven, ycoordEven) // (100,100)
                    let rightpoint:CGPoint = CGPointMake(xcoordOdd, ycoordOdd)  // (175,175)
                    if i<arr.count-1 {
                        drawLineFromPoint(leftpoint, toPoint: rightpoint,ofColor: UIColor.redColor(), inView: WellConfigView)
                        ycoordEven += 90
                        ycoordOdd += 20
                    }
                    
                }
                else
                {
                    //Draw a circle to left
                    let btn = ManagingHoles.createCircles(arr[i], i: xcoordOdd, j: ycoordOdd-30)
                    self.WellConfigView.addSubview(btn)
                    
                    let leftpoint:CGPoint = CGPointMake(xcoordEven, ycoordEven) // (100,100)
                    let rightpoint:CGPoint = CGPointMake(xcoordOdd, ycoordOdd)  // (175,175)
                    if i<arr.count-1 {
                    drawLineFromPoint(leftpoint, toPoint: rightpoint,ofColor: UIColor.redColor(), inView: WellConfigView)
                    ycoordOdd += 90
                    ycoordEven += 20
                    }
                }
            }
        }
        else
        {
            if m<=0 {
                btnPrevious.enabled=false
                btnNext.enabled=true
            }
            else if m>filteredconfig.count
            {
                btnNext.enabled = false
                btnPrevious.enabled = true
            }
            
        }
        
    }
    
    
    func ClearPicture(){
        let subviews = self.WellConfigView.subviews as [UIView]
        for v in subviews {
            //print(v)
            if let button = v as? UIButton {
                //print((button.titleLabel?.text)!)
                if button.backgroundColor == UIColor.grayColor() {
                    button.removeFromSuperview()
                }
            }
            
        }
        let sublayers = self.WellConfigView.layer.sublayers
        for x in sublayers!{
            if let line = x as? CAShapeLayer
            {
                line.removeFromSuperlayer()
            }
        }
    }
    
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        //design the path
        let path = UIBezierPath()
        path.moveToPoint(start)
        path.addLineToPoint(end)
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = lineColor.CGColor
        shapeLayer.lineWidth = 1.0
        
        view.layer.addSublayer(shapeLayer)
    }
    
  
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "pushconfigsegue"
        {
            if let destinationVC = segue.destinationViewController as? SchematicViewController {
                destinationVC.filteredconfig = filteredconfig
            }
        }
    }*/
    
    
    
    
    
    
    
}
