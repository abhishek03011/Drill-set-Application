//
//  ViewController.swift
//  wellSchematic
//
//  Created by Ravi, Prathyusha on 4/10/16.
//  Copyright © 2016 Ravi, Prathyusha. All rights reserved.
//

import UIKit

class SchematicViewController: UIViewController {
 let ManageInventory = ManageInventories()
  let generalpage = GeneralPage()
    let wellconfig = WellConfigViewController()
    //OUTLETS
    @IBOutlet weak var viewWellConfig: UIView!
    @IBOutlet weak var viewSchematic: UIView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var lblError: UILabel!
    var del = UIApplication.sharedApplication().delegate as! AppDelegate
    var m:Int = 0
    var filteredconfig:[String] = []
    /*["48&36&24&22&20&18 5/8&8 3/4&8 5/8&8 1/2&2 7/8","48&36&26&22&20&18 5/8&8 3/4&8 5/8&8 1/2&2 3/8","48&36&26&22&20&18 5/8&8 3/4&8 5/8&8 1/2&2 7/8"]*/
    var depths:[String] = [String]()
    var final:[String] = [String]()
    override func viewDidAppear(animated: Bool) {
        
        //fetch the data from other views
        let firstcasing:String = del.firstvalueonpage //first casing size
        let firsthole:String = "" //first hole size
        let lastcasing:String =  del.firstlastcasing  //last casing size
        let lasthole:String = del.firstlasthole //last hole size
        let numcasings:String = "10" //number of casings
        depths = ["500&2000&4500&7000"]
        print(firstcasing)
        let arrCaseHolesConfig:[String]=del.arrCaseHoleconfig
        let arrHolesCaseConfig:[String]=del.arrHoleCaseconfig
        var type:Int = 0 //Complation type
        
        if del.valuestorage2 == "Open Hole"
        {
            type = 1
            lblError.text = ""
        }
        else if del.valuestorage3 == "Cased Hole"
        {
            type = 2
            lblError.text = ""
        }
        else
        {
            type = 0
            lblError.text = "No configurations"
        }
        
        //Validations to configurations available
        
        print("arrCaseHolesConfig: \(arrCaseHolesConfig)")
        print("arrHolesCaseConfig: \(arrHolesCaseConfig)")
        print("type: \(type)")
        print("firstcasing: \(firstcasing)")
        print("lastcasing: \(lastcasing)")
        print("firsthole: \(firsthole)")
        print("lasthole: \(lasthole)")
        print("numcasings: \(numcasings)")
        final = ManageInventory.CreateFinalConfig(arrCaseHolesConfig, arrHoleAllowableCase: arrHolesCaseConfig, type: type, fcs: firstcasing, lcs: lastcasing, fhs: firsthole, lhs: lasthole, numcasings: numcasings)
        print("final configuration is : \(final)")
        //FILTERS OF DATA
        var newconfigNumcasings:[String]=[String]()
        var newconfigFirstcase:[String]=[String]()
        var newconfigLastcase:[String]=[String]()
        var newconfigFirstHole:[String]=[String]()
        var newconfigLastHole:[String]=[String]()
        
        filteredconfig = final
        if firsthole != "" {
            //filter according to first hole size
            newconfigFirstHole = []
            newconfigFirstHole  = ManageInventory.validateFirstHole(filteredconfig, firsthole: firsthole)
            if newconfigFirstHole.count>0 {
                filteredconfig=[]
                filteredconfig = newconfigFirstHole
                lblError.text=""
            }
            else
            {
                lblError.text = "No configurations available for selected first hole size"
            }
            print("first hole size filter : \(filteredconfig)")
        }
        
        if firstcasing != "--Select--" && firstcasing != ""
        {
            //filter according to first case size
            newconfigFirstcase = []
            newconfigFirstcase = ManageInventory.validateFirstcasings(filteredconfig, firstcase: firstcasing)
            if newconfigFirstcase.count>0 {
                filteredconfig = newconfigFirstcase
                lblError.text=""
            }
            else
            {
                lblError.text = "No configurations available for selected first case size"
            }
            print("first case size filter : \(filteredconfig)")
        }
        
        if lasthole != "--Select--"  && lasthole != "" && type == 1
        {
            //filter according to last hole size for open hole - add if condition complation type
            newconfigLastHole=[]
            newconfigLastHole = ManageInventory.validateLastHolesOpen(filteredconfig, lasthole: lasthole)
            if newconfigLastHole.count>0 {
                filteredconfig = newconfigLastHole
                lblError.text=""
            }
            else
            {
                lblError.text = "No configurations available for selected last hole size with Open hole type"
            }
            print("last hole size filter : \(filteredconfig)")
        }
        if lastcasing != "--Select--"  && lastcasing != "" && type == 1
        {
            //filter according to last case size for open hole - add if condition complation type
            newconfigLastcase = ManageInventory.validateLastCasingsOpen(filteredconfig, lastcase: lastcasing)
            newconfigLastcase = []
            if newconfigLastcase.count>0 {
                filteredconfig = newconfigLastcase
                lblError.text=""
            }
            else
            {
                lblError.text = "No configurations available for selected Last case size with Open hole type"
            }
            print("last case size filter : \(filteredconfig)")
        }
        if lasthole != "--Select--"  && lasthole != ""  && type == 2
        {
            //filter according to last hole size for cased hole - add if condition complation type
            newconfigLastHole = []
            newconfigLastHole = ManageInventory.validateLastHoleCased(filteredconfig, lasthole: lasthole)
            if newconfigLastHole.count>0 {
                filteredconfig = newconfigLastHole
                lblError.text=""
            }
            else
            {
                lblError.text = "No configurations available for selected Last hole size with Cased hole type"
            }
            print("last hole size filter : \(filteredconfig)")
        }
        
        if lastcasing != "--Select--"  && lastcasing != "" && type == 2
        {
            //filter according to last case size for cased hole - add if condition complation type
            newconfigLastcase = []
            newconfigLastcase = ManageInventory.validateLastCasingCased(filteredconfig, lastcase: lastcasing)
            if newconfigLastcase.count>0 {
                filteredconfig = newconfigLastcase
                lblError.text=""
            }
            else
            {
                lblError.text = "No configurations available for selected Last case size with Cased hole type"
            }
            print("last case size filter : \(filteredconfig)")
        }
        
        //filter according to number of casings
        print("verification: \(filteredconfig)")
        newconfigNumcasings = ManageInventory.validateNumCaseSchematic(filteredconfig)
        if newconfigNumcasings.count > 0
        {
            filteredconfig = newconfigNumcasings
            lblError.text=""
            //no configurations to show
        }
        else
        {
            lblError.text = "No configurations available for selected number of casings"
        }
        
        print("Number of casings filter : \(filteredconfig)")
        
        
        if filteredconfig.count>0
        {
            //ManageInventory.validateNumCasings(filteredconfig, numcasings: "5")
            /*DRAW INITIAL SCHEMATIC - START*/
            CreateSchematic()
            btnPrevious.enabled=false
            /*DRAW INITIAL SCHEMATIC - END*/
            
            
            /*WELLCONFIGURATION - START*/
            if filteredconfig.count>0
            {
                ClearPicture()
                ResetWellConfigDimensions()
                m=0
                DrawPicture()
            }
            else
            {
                m=0
                ResetWellConfigDimensions()
                ClearPicture()
            }
            /*WELL CONFIGURATION - END*/
            
        }
        
        
        
    }
    
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        ClearPictureSchematic()
        /*DRAW INITIAL SCHEMATIC - START*/
        CreateSchematic()
        btnPrevious.enabled=false
        /*DRAW INITIAL SCHEMATIC - END*/
        
        
        /*WELLCONFIGURATION - START*/
        if filteredconfig.count>0
        {
            ResetWellConfigDimensions()
            m=0
            DrawPicture()
        }
        else
        {
            m=0
            ResetWellConfigDimensions()
            ClearPicture()
        }
        /*WELL CONFIGURATION - END*/
    }
    
    func CreateSchematic(){
        var point:CGPoint = CGPointMake(100,102)
        var topoint:CGPoint = CGPointMake(100,200)
        var pointleft:CGPoint = CGPointMake(100,102)
        var topointleft:CGPoint = CGPointMake(100,200)
        let midpointview:CGFloat = self.viewSchematic.bounds.width/2
        /*-------------DRAW INITIAL LINES STATIC PART ------------------- START*/
        let endpoint:CGFloat=DrawStaticPicture()[0]
        let startpoint:CGFloat=DrawStaticPicture()[1]
        /*-------------DRAW INITIAL LINES STATIC PART ------------------- END*/
        var arr:[String]=[String]()
        if m<filteredconfig.count && m >= 0
        {
            arr = filteredconfig[m].componentsSeparatedByString("&")
        }
        let maxlength:CGFloat = self.viewSchematic.bounds.height - 200
        var x:Int=0
        var y:Int=0
        for var i=0;i<arr.count;i+=1{
            if i%2 != 0 {
                switch i {
                case i where i == 1:
                    /*right side*/
                    point = CGPointMake(endpoint, 100)
                    topoint.x = point.x
                    topoint.y = maxlength * 0.5
                    /*Left side*/
                    pointleft = CGPointMake(startpoint, 100)
                    topointleft.x = pointleft.x
                    topointleft.y = maxlength * 0.5
                case i where i == arr.count-1:
                    /*right side*/
                    point = CGPointMake(midpointview + (18), 100)
                    topoint.x = point.x
                    topoint.y = maxlength
                    /*Left side*/
                    pointleft = CGPointMake(midpointview - (18), 100)
                    topointleft.x = pointleft.x
                    topointleft.y = maxlength
                default:
                    var lengthpercent:CGFloat=0
                    /*right side*/
                    let distpercent:CGFloat = GetDistancePercent(ManageInventory.CalculateButtonVal(arr[i])-ManageInventory.CalculateButtonVal(arr[i+1]))
                    if x < arr.count / 2 {
                        let depthval:[String] = depths[0].componentsSeparatedByString("&")
                        lengthpercent=GetDepthPercent((Double(depthval[x+1])!-Double(depthval[x])!)/100)
                        print("LengthPercentage: \(lengthpercent)")
                        x += 1
                    }
                    
                    var midval : CGFloat = 0
                    if (point.x - (distpercent * 150)) < midpointview + 18
                    {
                        midval = (point.x + midpointview + 18) / 2
                    }
                    else
                    {
                        midval = point.x - (distpercent * 150)
                    }
                    
                    point = CGPointMake( midval, 100)
                    topoint.x = point.x
                    
                    if topoint.y + (lengthpercent * 100) < maxlength - 100 {
                        topoint.y = topoint.y + (lengthpercent * 100)
                    }
                    else
                    {
                        topoint.y = (topoint.y + (maxlength - 100))/2
                    }
                    print("frompoint : \(point)")
                    print("topoint: \(topoint)")
                    print(arr[i])
                    
                    /*Left side*/
                    var midvalleft : CGFloat = 0
                    if (pointleft.x + (lengthpercent * 150)) > midpointview - 18
                    {
                        midvalleft = (pointleft.x + midpointview - 18) / 2
                    }
                    else
                    {
                        midvalleft = pointleft.x + (distpercent * 150)
                    }
                    
                    pointleft = CGPointMake( midvalleft, 100)
                    topointleft.x = pointleft.x
                    if topointleft.y + (lengthpercent * 100) < maxlength - 100 {
                        topointleft.y = topointleft.y + (lengthpercent * 100)
                    }
                    else
                    {
                        topointleft.y = (topointleft.y + (maxlength - 100))/2
                    }
                }
                /*print("-----Loop: \(i)------")
                 print("from point: \(point)")
                 print("to point: \(topoint)")
                 print(arr[i])*/
                drawLineFromPoint(point, toPoint: topoint, ofColor: UIColor.blackColor(), inView: viewSchematic)
                drawLineFromPoint(pointleft, toPoint: topointleft, ofColor: UIColor.blackColor(), inView: viewSchematic)
                let btn:UIButton =  createCircles(arr[i], i: CGFloat(topoint.x-15), j: topoint.y)
                viewSchematic.addSubview(btn)
                let btnHole:UIButton =  createCircles(arr[i-1], i: CGFloat(topoint.x+15), j: topoint.y+10)
                viewSchematic.addSubview(btnHole)
                
                if y < arr.count / 2 {
                    let depthval:[String] = depths[0].componentsSeparatedByString("&")
                    let btnDepth:UIButton =  createLabelDepths(depthval[x], i: CGFloat(topointleft.x-25), j: CGFloat(topointleft.y))
                    y += 1
                    viewSchematic.addSubview(btnDepth)
                    
                }
                
                
            }
            
            
        }
        
        
        
    }
    func createLabelDepths(buttonText: String, i: CGFloat,j:CGFloat)->UIButton
    {
        let btn = UIButton(type: UIButtonType.Custom) as UIButton
        btn.backgroundColor = UIColor.grayColor()
        btn.setTitle(buttonText, forState: UIControlState.Normal)
        btn.frame = CGRect(x: i, y: j, width: 45, height: 20)
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 2
        btn.titleLabel?.text = buttonText
        btn.titleLabel?.textColor = UIColor.blackColor()
        btn.titleLabel?.font = UIFont(name: "Arial", size: 10)
        return btn
    }
    
    func ClearPicture(){
        let subviews = self.viewWellConfig.subviews as [UIView]
        for v in subviews {
            //print(v)
            if let button = v as? UIButton {
                //print((button.titleLabel?.text)!)
                if button.backgroundColor == UIColor.grayColor() {
                    button.removeFromSuperview()
                }
            }
            
        }
        let sublayers = self.viewWellConfig.layer.sublayers
        for x in sublayers!{
            if let line = x as? CAShapeLayer
            {
                line.removeFromSuperlayer()
            }
        }
    }
    
    func ClearPictureSchematic(){
        let subviews = self.viewSchematic.subviews as [UIView]
        for v in subviews {
            //print(v)
            if let button = v as? UIButton {
                button.removeFromSuperview()
            }
            
        }
        let sublayers = self.viewSchematic.layer.sublayers
        
        if sublayers != nil{
            for x in sublayers!{
                if let line = x as? CAShapeLayer
                {
                    line.removeFromSuperlayer()
                }
            }
        
        }
        
    }
    
    func DrawStaticPicture()->[CGFloat] {
        /*-------------DRAW INITIAL LINES STATIC PART ------------------- START*/
        let midpointview:CGFloat = self.viewSchematic.bounds.width/2
        let midpoint:CGPoint = CGPointMake(midpointview, 100)
        //print(midpoint)
        var x1:CGFloat = midpointview + (midpointview*0.8)
        var x2:CGFloat = midpointview - (midpointview*0.8)
        if x1-x2 <= (midpointview*2) - 50 {
            
            drawLineFromPoint(CGPointMake(midpointview,100), toPoint: CGPointMake(x1, 100), ofColor: UIColor.blackColor(), inView: viewSchematic)
            drawLineFromPoint(CGPointMake(midpointview,100), toPoint: CGPointMake(x2, 100), ofColor: UIColor.blackColor(), inView: viewSchematic)
        }
        else
        {
            x1 = midpointview + (midpointview*0.7)
            x2 = midpointview - (midpointview*0.7)
            if x1-x2 <= (midpointview*2) - 50 {
                drawLineFromPoint(CGPointMake(midpointview,100), toPoint: CGPointMake(x1, 100), ofColor: UIColor.blackColor(), inView: viewSchematic)
                drawLineFromPoint(CGPointMake(midpointview,100), toPoint: CGPointMake(x2, 100), ofColor: UIColor.blackColor(), inView: viewSchematic)
            }
            
        }
        return [x1,x2]
        /*-------------DRAW INITIAL LINES STATIC PART ------------------- END*/
    }
    
    
    func GetDistancePercent(spacevalue:Double) -> CGFloat {
        var newval:CGFloat = 0
        switch spacevalue {
        case spacevalue where spacevalue>1 && spacevalue<=3:
            newval = 0.25
        case spacevalue where spacevalue>3 && spacevalue<=6:
            newval = 0.4
        case spacevalue where spacevalue>6 && spacevalue<=10:
            newval = 0.5
        case spacevalue where spacevalue>10 && spacevalue<=15:
            newval = 0.7
        case spacevalue where spacevalue>15 && spacevalue<=25:
            newval = 0.85
        case spacevalue where spacevalue>25:
            newval = 0.9
        default:
            newval = 0.95
        }
        return newval
    }
    
    
    
    func GetDepthPercent(spacevalue:Double) -> CGFloat {
        var newval:CGFloat = 0
        switch spacevalue {
        case spacevalue where spacevalue>0.01 && spacevalue<=0.03:
            newval = 0.25
        case spacevalue where spacevalue>0.03 && spacevalue<=0.06:
            newval = 0.45
        case spacevalue where spacevalue>0.06 && spacevalue<=0.15:
            newval = 0.55
        case spacevalue where spacevalue>0.1 && spacevalue<=0.3:
            newval = 0.65
        case spacevalue where spacevalue>0.3 && spacevalue<=0.6:
            newval = 0.75
        case spacevalue where spacevalue>0.6 && spacevalue<=1.5:
            newval = 0.85
        case spacevalue where spacevalue>1.5 && spacevalue<=2.5:
            newval = 0.95
        case spacevalue where spacevalue>2.5 && spacevalue<=5:
            newval = 1.15
        case spacevalue where spacevalue>5 && spacevalue<=10:
            newval = 1.35
        case spacevalue where spacevalue>10 && spacevalue<=30:
            newval = 1.55
        case spacevalue where spacevalue>30 && spacevalue<=60:
            newval = 1.75
        case spacevalue where spacevalue>60 && spacevalue<=100:
            newval = 1.95
        default:
            newval = 0.8
        }
        return newval
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnPrevious.enabled=false
        /*WELLCONFIGURATION - START*/
        if filteredconfig.count>0
        {
            ResetWellConfigDimensions()
            m=0
            DrawPicture()
        }
        else
        {
            m=0
            ResetWellConfigDimensions()
            ClearPicture()
        }
        /*WELL CONFIGURATION - END*/
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func CalculateDistance(firstpoint:CGPoint,secondpoint:CGPoint) -> CGFloat {
        let x1 = firstpoint.x
        let y1 = firstpoint.y
        let x2 = secondpoint.x
        let y2 = secondpoint.y
        let distance = sqrt(pow((x2)-(x1), 2) + pow((y2)-(y1), 2))
        print("distance: \(distance)")
        return distance
    }
    
    
    
    func createCircles(buttonText: String, i: CGFloat,j:CGFloat)->UIButton
    {
        let btn = UIButton(type: UIButtonType.Custom) as UIButton
        btn.backgroundColor = UIColor.grayColor()
        btn.setTitle(buttonText, forState: UIControlState.Normal)
        btn.frame = CGRect(x: i, y: j, width: 35, height: 40)
        btn.layer.cornerRadius = 30
        btn.layer.borderWidth = 2
        btn.titleLabel?.text = buttonText
        btn.titleLabel?.textColor = UIColor.blackColor()
        btn.titleLabel?.font = UIFont(name: "Arial", size: 10)
        return btn
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
        shapeLayer.lineWidth = 2.0
        
        view.layer.addSublayer(shapeLayer)
    }

   
    //Initial dimensions of well configuration picture
    let xcoordEven:CGFloat = 100
    let xcoordOdd:CGFloat =  185
    var ycoordEven:CGFloat = 100
    var ycoordOdd:CGFloat = 185
    
    func ResetWellConfigDimensions() {
        ycoordEven = 140
        ycoordOdd = 185
    }
    
    @IBAction func PreviousConfigToggle(sender: AnyObject) {
        
        EnableDisableButton()
        m=m-1
        if m > 0
        {
            ClearPictureSchematic()
            CreateSchematic()
            
        }        
        ResetWellConfigDimensions()
        DrawPicture()
    }
    @IBAction func NextConfigToggle(sender: AnyObject) {
        
        EnableDisableButton()
        m=m+1
        ClearPictureSchematic()
        CreateSchematic()
        ResetWellConfigDimensions()
        DrawPicture()
        
    }
    
    
    func EnableDisableButton(){
        
        if m<=0 {
            print("m: \(m)")
            print("arrcount:\(filteredconfig.count)")
            btnPrevious.enabled=false
            btnNext.enabled = true
        }
        else if filteredconfig.count == 1
        {
            print("m: \(m)")
            print("arrcount:\(filteredconfig.count)")
            btnPrevious.enabled=false
            btnNext.enabled=false
        }
        else if m>=filteredconfig.count-2
        {
            print("m: \(m)")
            print("arrcount:\(filteredconfig.count)")
            btnPrevious.enabled = true
            btnNext.enabled = false
        }
        else
        {
            print("m: \(m)")
            print("arrcount:\(filteredconfig.count)")
            btnPrevious.enabled=true
            btnNext.enabled=true
        }
    }
    
    func DrawPicture() {
        
        if filteredconfig.count > 0 && m>=0 && m<filteredconfig.count {
            
            let arr = filteredconfig[m].componentsSeparatedByString("&")
            for var i=0;i<arr.count;i+=1 {
                if i%2==0 {
                    //Draw a circle to left
                    let btn = ManageInventory.createCircles(arr[i], i: xcoordEven-45, j: ycoordEven-20)
                    self.viewWellConfig.addSubview(btn)
                    
                    //Draw line to right
                    let leftpoint:CGPoint = CGPointMake(xcoordEven, ycoordEven+10) // (100,100)
                    let rightpoint:CGPoint = CGPointMake(xcoordOdd-50, ycoordOdd)  // (175,175)
                    if i<arr.count-1 {
                        drawLineFromPoint(leftpoint, toPoint: rightpoint,ofColor: UIColor.redColor(), inView: viewWellConfig)
                        ycoordEven += 70
                        ycoordOdd += 15
                    }
                    
                }
                else
                {
                    //Draw a circle to right
                    let btn = ManageInventory.createCircles(arr[i], i: xcoordOdd-50, j: ycoordOdd-30)
                    self.viewWellConfig.addSubview(btn)
                    
                    let leftpoint:CGPoint = CGPointMake(xcoordEven, ycoordEven+10) // (100,100)
                    let rightpoint:CGPoint = CGPointMake(xcoordOdd-50, ycoordOdd)  // (175,175)
                    if i<arr.count-1 {
                        drawLineFromPoint(leftpoint, toPoint: rightpoint,ofColor: UIColor.redColor(), inView: viewWellConfig)
                        ycoordOdd += 70
                        ycoordEven += 15
                    }
                }
            }
            
        }
        else
        {
            
            
        }
        
    }

}

