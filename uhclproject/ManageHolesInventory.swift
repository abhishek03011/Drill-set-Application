//
//  ManageHolesInventory.swift
//  WellConfiguration
//
//  Created by Ravi, Prathyusha on 3/24/16.
//  Copyright © 2016 Ravi, Prathyusha. All rights reserved.
//

import Foundation
import EventKitUI



class ManageInventories
{
    
    /*Resets the dimensions*/
    func ResetDimensions()->(Double,Double)
    {
        let i:Double = 5
        let j:Double = 60
        return (i,j)
    }
       
    func createButtonNoAction(buttonText: String, i: Double,j:Double)->UIButton
    {
        let btn = UIButton(type: UIButtonType.Custom) as UIButton
        btn.backgroundColor = UIColor.blueColor()
        btn.setTitle(buttonText, forState: UIControlState.Normal)
        btn.frame = CGRect(x: i, y: j, width: 45, height: 45)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 2
        btn.titleLabel?.text = buttonText
        btn.titleLabel?.textColor = UIColor.blackColor()
        btn.titleLabel?.font = UIFont(name: "Arial", size: 13.5)
        return btn
    }
    
    func createCircles(buttonText: String, i: CGFloat,j:CGFloat)->UIButton
    {
        let btn = UIButton(type: UIButtonType.Custom) as UIButton
        btn.backgroundColor = UIColor.grayColor()
        btn.setTitle(buttonText, forState: UIControlState.Normal)
        btn.frame = CGRect(x: i, y: j, width: 45, height: 45)
        btn.layer.cornerRadius = 30
        btn.layer.borderWidth = 2
        btn.titleLabel?.text = buttonText
        btn.titleLabel?.textColor = UIColor.blackColor()
        btn.titleLabel?.font = UIFont(name: "Arial", size: 10)
        return btn
    }
    
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
    
    /*Find the index for the new element to be inserted*/
    func GetIndex(arrname:[Double], val: Double)->Int
    {
        var index: Int = 0
        //print(arrname.count)
        for k in 0 ..< arrname.count
        {
            //if the number to insert is >first and <last
            if(arrname[arrname.count - 1] < val)
            {
                index = arrname.count
            }
                //if the number to insert is >first
            else if(val < arrname[0])
            {
                index = 0
            }
                //if the number is in between the first element and last element
            else if (arrname.count > 1 && k+1 < arrname.count)
            {
                if arrname[k] <= val && val <= arrname[k+1]
                {
                    index = k+1
                }
            }
        }
        return index
    }
    
    /*Find the index for the new element to be inserted*/
    func GetIndexIfSizeNConfigEqual(arrname:[Double], val: Double)->Int
    {
        var index: Int = 0
        print("arr\(arrname)")
        print(val)
        for k in 0 ..< arrname.count
        {
            if(arrname[k] == val)
            {
                index = k
            }
            
        }
        return index
    }
    
    func ToggleSelectHolesButton(sender:UIButton,var selectedHolesValue:[Double],var selectedHolesText:[String])
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
                    let index:Int=GetIndex(selectedHolesValue, val: CalculateButtonVal((btntext.titleLabel?.text)!))
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
                //for var i=0;i<selectedHolesText.count;i++
                for i in 0..<selectedHolesText.count
                {
                    if (btntext.titleLabel?.text == selectedHolesText[i])
                    {
                        var index:Int=GetIndex(selectedHolesValue, val: CalculateButtonVal((btntext.titleLabel?.text)!))
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
    }
    
    /*Find a button in All collection of casings*/
    func FindButton(viewname: String, btnText: String, arrname: [String])->Bool
    {
        var found:Bool = false
        if(viewname == "CASINGS") /*arrAllCasingsText*/
        {
            if arrname.count > 0
            {
                //for var i=0;i<arrname.count;i++
                for i in 0..<arrname.count
                {
                    if (btnText == arrname[i])
                    {
                        found = true
                    }
                }
            }
        }
        else if(viewname == "HOLES")/*arrAllHolesText*/
        {
            if arrname.count > 0
            {
                //for var i=0;i<arrname.count;i++
                for i in 0..<arrname.count
                {
                    if (btnText == arrname[i])
                    {
                        found = true
                    }
                }
            }
        }
        else if(viewname == "SELECTED CASINGS")/*selectedCasingText*/
        {
            if arrname.count > 0
            {
                //for var i=0;i<arrname.count;i++
                for i in 0..<arrname.count
                {
                    if (btnText == arrname[i])
                    {
                        found = true
                    }
                }
            }
        }
        else if(viewname == "SELECTED HOLES")/*selectedHolesText*/
        {
            if arrname.count > 0
            {
                for i in 0..<arrname.count
                {
                    if (btnText == arrname[i])
                    {
                        found = true
                    }
                }
            }
        }
        return found
    }
    
    
    func InsertNewCasingHole(newitemType:String,var arrnameText:[String],var arrnameValue:[Double],var arrNewnameText:[String],var arrNewnameValue:[Double],arrSelectedValue:[Double],buttontext:String)->([String],[Double],[String],[Double])
    {
        let butonval = CalculateButtonVal(buttontext)
        let allindex: Int = GetIndex(arrnameValue,val: butonval)
        arrnameValue.insert(Double(butonval), atIndex: allindex)
        arrnameText.insert(buttontext, atIndex: allindex)
        let newindex: Int = GetIndex(arrSelectedValue,val: butonval)
        if arrNewnameValue.count>0
        {
            arrNewnameValue.insert(Double(butonval), atIndex: newindex)
            arrNewnameText.insert(buttontext, atIndex: newindex)
        }
        else
        {
            arrNewnameValue.append(Double(butonval))
            arrNewnameText.append(buttontext)
        }
        print(arrNewnameText)
        print(arrNewnameValue)
        print(arrnameText)
        print(arrnameValue)
        return (arrnameText,arrnameValue,arrNewnameText,arrNewnameValue)
        
    }
    
    
    func AddConfig(var arrname:[String], selectedConfig:String)->([String],Bool)
    {
        //find if config already exists or not and send bool values to "CaseAllowableHoles" method
        let selectedsize = selectedConfig.componentsSeparatedByString("&")[0]
        var found:Bool = false
        var index = 0
        //for var i=0;i<arrname.count;i++
        if arrname.count>0 {
            for i in 0..<arrname.count
            {
                //print("\(i):ArraySelection\(arrname)")
                let availablesize = arrname[i].componentsSeparatedByString("&")[0]
                if(availablesize == selectedsize)
                {
                    index = i
                    found = true
                }
            }
            if found == true {
                arrname.removeAtIndex(index)
            }
            
        }
        arrname.append(selectedConfig)
        return (arrname,found)
    }
    
    
    func GetSelection(btnText:String, arrconfig:[String])->[String]
    {
        var arrselection:[String]=[]
        //for var i=0;i<arrconfig.count;i++
        if arrconfig.count>0
        {
            for i in 0..<arrconfig.count
            {
                let size = arrconfig[i].componentsSeparatedByString("&")[0]
                if(btnText == size)
                {
                    let arr = arrconfig[i].componentsSeparatedByString("&")
                    //for var i=0;i<arr.count;i++
                    if arr.count>0 {
                        for i in 0..<arr.count
                        {
                            arrselection.append(arr[i])
                        }
                    }
                }
            }
        }
        
        return arrselection
    }
 /******************NEW****************************/
    func RemoveConfigMain(arrconfig:[String],btnText:String) -> [String]
    {
        var arrname = arrconfig
        //find if config already exists or not and send bool values to "CaseAllowableHoles" method
        var found:Bool = false
        var index = 0
        //for var i=0;i<arrname.count;i++
        if arrname.count>0 {
            for i in 0..<arrname.count
            {
                //print("\(i):ArraySelection\(arrname)")
                let availablesize = arrname[i].componentsSeparatedByString("&")[0]
                if(availablesize == btnText)
                {
                    index = i
                    found = true
                }
            }
            if found == true {
                arrname.removeAtIndex(index)
            }
            
        }
        return arrname
        
    }
    
    
    func RemoveConfigSelection(arrconfig:[String],btnText:String) -> [String]
    {
        var arrname = arrconfig
        //find if config already exists or not and send bool values to "CaseAllowableHoles" method
        var found:Bool = false
        var index = 0
        //for var i=0;i<arrname.count;i++
        if arrname.count>0 {
            for i in 0..<arrname.count
            {
                
                let availablesize = arrname[i].componentsSeparatedByString("&")[i+1]
                print("availableconfig : \(availablesize)")
                if(availablesize == btnText)
                {
                    index = i
                    found = true
                }
            }
            if found == true {
                arrname.removeAtIndex(index)
            }
            
        }
        return arrname
        
    }
    
    func CreateFinalConfig(arrCaseAllowableHoles:[String],arrHoleAllowableCase:[String],type:Int, fcs:String, lcs:String, fhs:String, lhs:String, numcasings:String ) -> [String] {
        var finalconfig:[String]=[]
        var numcase:Int = 10
        if numcasings != ""
        {
            numcase = Int(numcasings)!
        }
        
        
        //Create the initial hole for the specified first casing size
        if fcs != "--Select--" && fcs != "" {
            let arrinitial:[String] = ConfigurationInitialHole(arrHoleAllowableCase, fcs: fcs, lcs: lcs)
            if numcase > 0 {
                var arrconfigchangehole:[String] = []
                var arrconfigchangecase:[String] = arrinitial
                for n in 0...numcase-2 {
                    let arrhole = CreateWellConfigHoles(arrHoleAllowableCase, arrCasesAllowableHoleConfig: arrCaseAllowableHoles, arrwellConfig: arrconfigchangecase)
                    if arrhole != [] {
                        arrconfigchangehole = arrhole
                        finalconfig = arrconfigchangehole
                    }
                    print("\(n) hole added to config: \(arrconfigchangehole)")
                    
                    
                    
                    let arrcase:[String] = CreateWellConfigCases(arrHoleAllowableCase, arrCasesAllowableHoleConfig: arrCaseAllowableHoles, arrwellConfig: arrconfigchangehole)
                    if(arrcase != [])
                    {
                        arrconfigchangecase = arrcase
                        finalconfig = arrconfigchangecase
                    }
                    print("\(n) case added to config: \(arrconfigchangecase)")
                }
               
                print("final config \(finalconfig)")
            }
        }
        else if fhs != "--Select--" && fhs != "" {
            let arrinitial:[String] = ConfigurationFHSInitial(arrHoleAllowableCase, fhs: fhs, lhs: lhs)
            if numcase > 0 {
                var arrconfigchangehole:[String] = arrinitial
                var arrconfigchangecase:[String] = []
                for n in 0...numcase-2 {
                    
                    let arrcase:[String] = CreateWellConfigCases(arrHoleAllowableCase, arrCasesAllowableHoleConfig: arrCaseAllowableHoles, arrwellConfig: arrconfigchangehole)
                    if(arrcase.count>0)
                    {
                        arrconfigchangecase = arrcase
                        finalconfig = arrconfigchangecase
                    }
                    print("\(n) case added to config: \(arrconfigchangecase)")
                    
                    let arrhole = CreateWellConfigHoles(arrHoleAllowableCase, arrCasesAllowableHoleConfig: arrCaseAllowableHoles, arrwellConfig: arrconfigchangecase)
                    if arrhole.count>0 {
                        arrconfigchangehole = arrhole
                        finalconfig = arrconfigchangehole
                    }
                    print("\(n) hole added to config: \(arrconfigchangehole)")
                }
                
                print("final config \(finalconfig)")
            }
        }
        else
        {
            let arrinitial:[String] = GetMaxHoleSize(arrHoleAllowableCase)
            if numcase > 0 {
                var arrconfigchangehole:[String] = arrinitial
                var arrconfigchangecase:[String] = []
                for n in 0...numcase-2 {
                    
                    let arrcase:[String] = CreateWellConfigCases(arrHoleAllowableCase, arrCasesAllowableHoleConfig: arrCaseAllowableHoles, arrwellConfig: arrconfigchangehole)
                    if(arrcase.count>0)
                    {
                        arrconfigchangecase = arrcase
                        finalconfig = arrconfigchangecase
                    }
                    print("\(n) case added to config: \(arrconfigchangecase)")
                    
                    let arrhole = CreateWellConfigHoles(arrHoleAllowableCase, arrCasesAllowableHoleConfig: arrCaseAllowableHoles, arrwellConfig: arrconfigchangecase)
                    if arrhole.count>0 {
                        arrconfigchangehole = arrhole
                        finalconfig = arrconfigchangehole
                    }
                    print("\(n) hole added to config: \(arrconfigchangehole)")
                }
                
                print("final config \(finalconfig)")
            }
        }
        
        
        if type == 1
        {
            //Open hole count is odd
            var tempconfig = finalconfig
            finalconfig = []
            for var i=0;i<tempconfig.count;i+=1
            {
                let config = tempconfig[i].componentsSeparatedByString("&")
                if config.count % 2 == 1
                {
                    finalconfig.append(tempconfig[i])
                }
                
            }
        }
        else if type == 2
        {
            //cased hole count is even
            var tempconfig = finalconfig
            finalconfig = []
            for var i=0;i<tempconfig.count;i+=1
            {
                let config = tempconfig[i].componentsSeparatedByString("&")
                if config.count % 2 == 0
                {
                    finalconfig.append(tempconfig[i])
                }
                
            }
        }
        
        
        return finalconfig
    }
    
    
    
    
    
    func  GetMaxHoleSize(arrconfig:[String]) -> [String] {
        var newconfig:[String] = [String]()
        var val:Double = 0
        var config:String=""
        for var i=0;i<arrconfig.count;i+=1
        {
            let configval = arrconfig[i].componentsSeparatedByString("&")[0]
            if i==0 {
                val = CalculateButtonVal(configval)
                config = configval
            }
            else
            {
                if CalculateButtonVal(configval)>val {
                    val=CalculateButtonVal(configval)
                    config = configval
                }
            }
        }
        newconfig.append(config)
        return newconfig
    }
    
    func ConfigurationInitialHole(arrconfig:[String],fcs:String,lcs:String)->[String]
    {
        var config:[String]=[]
        for i in 0..<arrconfig.count
        {
            if CalculateButtonVal(arrconfig[i].componentsSeparatedByString("&")[0]) > Double(fcs)
            {
                config.append(arrconfig[i].componentsSeparatedByString("&")[0] + "&" + fcs)
            }
        }
        print("Initial HOLECASE \(config)")
        return config
    }
    
    
    func ConfigurationFHSInitial(arrconfig:[String],fhs:String,lhs:String)->[String]
    {
        var config:[String]=[]
        for var i=0;i<arrconfig.count;i++
        {
            let val = arrconfig[i].componentsSeparatedByString("&")[0]
            if fhs == val {
                config.append(val)
            }
        }
        print("Initial HOLECASE \(config)")
        return config
    }
    
    
    
    func CreateWellConfigHoles(arrHolesAllowableCaseConfig:[String],arrCasesAllowableHoleConfig:[String],arrwellConfig:[String]) -> [String] {
        var arrwellConfigHole:[String]=[]
        
        if arrwellConfig.count > 0{
            for i in 0...arrwellConfig.count-1
            {
                if arrwellConfig.count>0 {
                    let x:String = arrwellConfig[i].componentsSeparatedByString("&")[arrwellConfig[i].componentsSeparatedByString("&").count - 1]
                    for m in 0...arrCasesAllowableHoleConfig.count-1
                    {
                        if x == arrCasesAllowableHoleConfig[m].componentsSeparatedByString("&")[0] {
                            
                            for j in 1...arrCasesAllowableHoleConfig[m].componentsSeparatedByString("&").count - 1
                            {
                                arrwellConfigHole.append(arrwellConfig[i] + "&" + arrCasesAllowableHoleConfig[m].componentsSeparatedByString("&")[j])
                            }
                        }
                        else
                        {
                            //No configs to append
                        }
                    }
                }
            }
        }
        
        return arrwellConfigHole
    }
    
    func CreateWellConfigCases(arrHolesAllowableCaseConfig:[String],arrCasesAllowableHoleConfig:[String],arrwellConfig:[String]) -> [String] {
        var arrwellConfigCase:[String]=[]
        if arrwellConfig.count > 0 {
            for var i=0;i<arrwellConfig.count;i+=1
            {
                if arrwellConfig.count>0 {
                    let x:String = arrwellConfig[i].componentsSeparatedByString("&")[arrwellConfig[i].componentsSeparatedByString("&").count - 1]
                    for var m=0;m<arrHolesAllowableCaseConfig.count;m++
                    {
                        if x == arrHolesAllowableCaseConfig[m].componentsSeparatedByString("&")[0] {
                            
                            for var j=1;j<arrHolesAllowableCaseConfig[m].componentsSeparatedByString("&").count;j+=1
                            {
                                arrwellConfigCase.append(arrwellConfig[i] + "&" + arrHolesAllowableCaseConfig[m].componentsSeparatedByString("&")[j])
                            }
                        }
                        else
                        {
                            //No configs to append
                        }
                    }
                }
            }
        }
        return arrwellConfigCase
    }
    
    func validateFirstHole(final:[String],firsthole:String)->[String]
    {
        var newconfig:[String] = [String]()
        for var i=0;i<final.count;i+=1
        {
            let config = final[i].componentsSeparatedByString("&")
            if firsthole == config[0] {
                newconfig.append(final[i])
            }
        }
        return newconfig
    }
    
    func validateFirstcasings(final:[String],firstcase:String)->[String]
    {
        var newconfig:[String] = [String]()
        for var i=0;i<final.count;i+=1
        {
            let config = final[i].componentsSeparatedByString("&")
            if firstcase == config[1] {
                newconfig.append(final[i])
            }
        }
        return newconfig
    }
    
    func validateLastHolesOpen(final:[String],lasthole:String)->[String]
    {
        var newconfig:[String] = [String]()
        
        for var i=0;i<final.count;i+=1
        {
            let config = final[i].componentsSeparatedByString("&")
            /*if config.count%2==0 {
                if lasthole == config[config.count - 2] {
                    newconfig.append(final[i])
                }
            }*/
            /*else */if config.count%2==1 {
                if lasthole == config[config.count - 1] {
                    newconfig.append(final[i])
                }
            }
        }
        return newconfig
    }
    
    
    func validateLastCasingsOpen(final:[String],lastcase:String)->[String]
    {
        var newconfig:[String] = [String]()
        
            for var i=0;i<final.count;i+=1
            {
                let config = final[i].componentsSeparatedByString("&")
                /*if config.count%2==0 {
                    if lastcase == config[config.count - 1] {
                        newconfig.append(final[i])
                    }
                }*/
                /*else*/ if config.count%2==1 {
                    if lastcase == config[config.count - 2] {
                        newconfig.append(final[i])
                    }
                }
            }
        
        
        return newconfig
    }
    
    func validateLastCasingCased(final:[String],lastcase:String)->[String]
    {
        var newconfig:[String] = [String]()
        for var i=0;i<final.count;i+=1
        {
            let config = final[i].componentsSeparatedByString("&")
            if config.count%2==0 {
                if lastcase == config[config.count - 1] {
                    newconfig.append(final[i])
                }
            }
            /*else if config.count%2==1 {
                if lastcase == config[config.count - 2] {
                    newconfig.append(final[i])
                }
            }*/
        }
        return newconfig
    }
    
    func validateLastHoleCased(final:[String],lasthole:String)->[String]
    {
        var newconfig:[String] = [String]()
        for var i=0;i<final.count;i+=1
        {
            let config = final[i].componentsSeparatedByString("&")
            if config.count%2==0 {
                if lasthole == config[config.count - 2] {
                    newconfig.append(final[i])
                }
            }
            /*else if config.count%2==1 {
                if lasthole == config[config.count - 1] {
                    newconfig.append(final[i])
                }
            }*/
        }
        return newconfig
    }
    
    func validateNumCasings(final:[String],numcasings:String)->[String]
    {
        var newconfig:[String] = [String]()
        for var i=0;i<final.count;i+=1
        {
            let config = final[i].componentsSeparatedByString("&")
            let val:Int =  Int(config.count/2)
            let numcase = Int(numcasings)!
            var data:String=""
            var newval:Int=0
            
            if val == numcase
            {
                if config.count%2==0 {
                    newval = val * 2
                }
                else
                {
                    newval = (val * 2) + 1
                }
                for var j=0;j<newval;j+=1
                {
                    if j==0 {
                        data = config[0]
                    }
                    else
                    {
                        data = data + "&" + config[j]
                    }
                    
                    
                }
                newconfig.append(data)
            }
            else
            {
                
            }
            
            
        }
        print("PPPPPPPPPPPPPPPPPPPPPP\(newconfig)")
        return newconfig
    }
    
    
    func validateNumCaseSchematic(final:[String])->[String]
    {
        var newconfig:[String] = [String]()
        for var i=0;i<final.count;i+=1
        {
            let config = final[i].componentsSeparatedByString("&")
            let val:Int =  Int(config.count/2)
            var data:String=""
            var newval:Int=0
            if config.count%2==0 {
                newval = val * 2
            }
            else
            {
                newval = (val * 2) + 1
            }
            for var j=0;j<newval;j+=1
            {
                if j==0 {
                    data = config[0]
                }
                else
                {
                    data = data + "&" + config[j]
                }
                
                
            }
            newconfig.append(data)
        }
        return newconfig
    }
    
}

