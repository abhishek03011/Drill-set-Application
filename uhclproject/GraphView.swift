//
//  GraphView.swift
//  uhclproject
//
//  Created by Abhishek Kumar on 4/1/16.
//  Copyright © 2016 Abhishek Kumar. All rights reserved.
//

import UIKit

protocol change: class
{
    func updateit(sender: GraphView) -> String?
}
protocol change1: class
{
    func updateit1(sender: GraphView) -> String?
}
protocol change2: class
{
    func updateit2(sender: GraphView) -> String?
}
protocol change3: class
{
    func updateit3(sender: GraphView) -> String?
}
protocol change4: class
{
    func updateit4(sender: GraphView) -> String?
}


@IBDesignable class GraphView: UIView
{
    
     var del = UIApplication.sharedApplication().delegate as! AppDelegate
    
    /* */
    
    var graphPoints:[Int] = [0, 2, 6, 5, 4 , 1, 2, 3, 4 , 5, 6, 7,8,9,10,11,12,13,14,15,16,17,19,2000]
    
    var graphPoints1:[Int] = [0, 2, 6, 5, 4 , 1, 2, 3, 4 , 5, 6, 7,8,9,10,11,12,13,14,15,16,17,19,2000]
    
    var graphPoints2:[Int] = [0, 2, 6, 5, 4 , 1, 2, 3, 4 , 5, 6, 7,8,9]
    
    var graphPoints3:[Int] = [0, 2, 6, 5, 4 , 1, 2, 3, 4 , 5, 6, 7,8,9]
    
    weak var datasource: change?
    weak var datasource1: change1?
    weak var datasource2: change2?
    weak var datasource3: change3?
    weak var datasource4: change4?

    //1 - the properties for the gradient
    @IBInspectable var startColor: UIColor = UIColor.redColor()
    @IBInspectable var endColor: UIColor = UIColor.greenColor()
    

    
    override func drawRect(rect: CGRect)
    {
        
        let checker = datasource?.updateit(self) ?? "0"
        let checker1 = datasource1?.updateit1(self) ?? "0"
        let checker2 = datasource2?.updateit2(self) ?? "0"
        let checker3 = datasource3?.updateit3(self) ?? "0"
        let checker4 = datasource4?.updateit4(self) ?? "0"
        
        
        let width = rect.width
        let height = rect.height
        
        
        
        //2 - get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor, endColor.CGColor]
        
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        //5 - create the gradient
        let gradient = CGGradientCreateWithColors(colorSpace,colors,colorLocations)
        
        //6 - draw the gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        CGContextDrawLinearGradient(context,gradient,startPoint,endPoint,CGGradientDrawingOptions(rawValue: 0))
        
        
/////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        let margin:CGFloat = 5.0
        
        let columnXPoint =
            
        { (column:Int) -> CGFloat in
            //Calculate gap between points
            let spacer = (width - margin*2 - 4) / CGFloat((self.graphPoints.count - 1)) //graph plot sections
            var x:CGFloat = CGFloat(column) * spacer
            x = x + margin + 2
            return x
        }
        
        
        let topBorder:CGFloat = 60
        let bottomBorder:CGFloat = 50
        let graphHeight = height - topBorder - bottomBorder
        let graphWidth = width - 2 * ( margin)
        let maxValue = graphPoints.maxElement()
        
        let columnYPoint =
        
            { (graphPoint:Int) -> CGFloat in
            var y:CGFloat = CGFloat(graphPoint) / CGFloat(maxValue!) * graphHeight 
            y = topBorder + y // Flip the graph
            return y
        }
        
        let graphPath = UIBezierPath()
        
        
        // draw the line graph
        
        UIColor.whiteColor().setFill()
        UIColor.greenColor().setStroke()
        
        //set up the points line
        
        //go to start of line
        
        graphPath.moveToPoint(CGPoint(x:columnXPoint(0),y:columnYPoint(graphPoints[0])))
        //add points for each item in the graphPoints array
        //at the correct (x, y) for the point
        for i in 1..<graphPoints.count
        {
            let nextPoint = CGPoint(x:columnXPoint(i),y:columnYPoint(graphPoints[i]))
            graphPath.addLineToPoint(nextPoint)
        }
        
        if checker == "0"
        {
       //graphPath.lineWidth = 1.0
      
      // graphPath.stroke()
            
        }
        
       
        //Draw horizontal graph lines on the top of everything
        let linePath = UIBezierPath()
        
        //Draw narrow line between a sector
        
        let linePath1 = UIBezierPath()
        
        
        
        print("The graph height is",graphHeight)
        print("The graph width is", graphWidth)
        
        
        //top line
        linePath.moveToPoint(CGPoint(x:margin, y: topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin,y:topBorder))
        
        
        
        ///////////////////////////////////////////////////////////////////////////////////
        
        // This is between first sector from the bottom
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.90625)  +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.90625) ))
        
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.9375)  +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.9375) ))

        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.96875)  +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.96875) ))

        
        
        linePath.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.875)  +  topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.875) ))
        
        
        ///////////////////////////////////////////////////////////////////////

       

        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.843750) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.84375) ))
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.81250) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.8125) ))
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.78125) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.78125) ))

        
        linePath.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.750) +  topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.75) ))

        
        ///////////////////////////////////////////////////////////////////////
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.725) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.725) ))
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.69375) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.69375) ))
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.65625) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.65625) ))
        
        linePath.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.625) +  topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.625) ))
        ////////////////////////////////////////////////////////////////////////////////////////////
       
        
       
        
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.59375) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.59375) ))
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.5625) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.5625) ))
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.53125) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.53125) ))
        
        linePath.moveToPoint(CGPoint(x:margin,y: graphHeight/2 + topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin,y:graphHeight/2 + topBorder))               //center line
        ///////////////////////////////////////////////////////////////////////////////////////////
        
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.46875) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.46875) ))
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.4375) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.4375) ))
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.40625) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.40625) ))
        
        linePath.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.375) +  topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.375) ))
        /////////////////////////////////////////////////////////////////////////////////////////
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.343750) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.343750) ))
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.31250) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.31250) ))
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.281250) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.281250) ))
        
        linePath.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.250) +  topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.250) ))
        //////////////////////////////////////////////////////////////////////////////////////////////
       
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.21875) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.21875) ))
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.1875) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.1875) ))
        

        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.15625) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.15625) ))
        
        
    
        linePath.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.125) +  topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.125) ))
        ////////////////////////////////////////////////////////////////////////////////////////////////
        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.09375) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.09375) ))

        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.0625) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.0625) ))
        

        
        linePath1.moveToPoint(CGPoint(x:margin, y: graphHeight * (0.03125) +  topBorder))
        linePath1.addLineToPoint(CGPoint(x: width - margin,y:topBorder + graphHeight * (0.03125) ))

        

        //bottom line
        linePath.moveToPoint(CGPoint(x:margin,y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin,y:height - bottomBorder))
        
        
        /////////////////////////////////////////////////////////////////////////
        
        linePath.moveToPoint(CGPoint(x: margin ,y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin ),y: topBorder))
      
        
        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.0833 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.0833 )),y: topBorder))
        
        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.16666 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.1666)),y: topBorder))
        
        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.24999 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.24999 )),y: topBorder))
        
        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.33329 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.33329 )),y: topBorder))
        
        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.41659 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.41659 )),y: topBorder))

        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.4999 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.4999 )),y: topBorder))
        
        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.58322 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.58322 )),y: topBorder))

        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.6665 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.6665 )),y: topBorder))
        
        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.7498 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.7498 )),y: topBorder))

        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.8331 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.8331 )),y: topBorder))
        
        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.0833 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.0833 )),y: topBorder))

        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth * 0.9163 ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth * 0.9163 )),y: topBorder))
        
        linePath.moveToPoint(CGPoint(x: margin + ( graphWidth ),y:(height - bottomBorder)))
        linePath.addLineToPoint(CGPoint(x:(margin  + ( graphWidth )),y: topBorder))
        
        
        
        
        
        let color = UIColor(white: 1.0, alpha: 0.4)
        color.setStroke()
        
        linePath.lineWidth = 2.5
        linePath.stroke()
        
        linePath1.lineWidth = 1.0
        linePath1.stroke()
       ///////////////////////////////////////////////////////////////////////////////////////////////////////
        for i in 0..<graphPoints.count
        {
            var point = CGPoint(x:columnXPoint(i), y:columnYPoint(graphPoints[i]))
            point.x -= 5.0/2
            point.y -= 5.0/2                                                                                     //for first green graph
            
            let circle = UIBezierPath(ovalInRect:CGRect(origin: point,size: CGSize(width: 5.0, height: 5.0)))
            
            if checker == "0"
            {
               // circle.fill()
            }
            
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        
            
    ////////////////////for second graph
           
            
            let margin1:CGFloat = 50.0
            
            
            let columnXPoint1 =
                { (column1:Int) -> CGFloat in
                //Calculate gap between points
                let spacer1 = (width - margin1*2 - 4) / CGFloat((self.graphPoints1.count - 1)) //graph plot sections
                var x1:CGFloat = CGFloat(column1) * spacer1
                x1 = x1 + margin1 + 2
                return x1
            }
            
            
            let maxValue1 = graphPoints1.maxElement()
            
            let columnYPoint1 =
                
                { (graphPoint1:Int) -> CGFloat in
                var y1:CGFloat = CGFloat(graphPoint1) / CGFloat(maxValue1!) * graphHeight
                y1 = (topBorder + y1 )// Flip the graph
                return y1
            }
            
            
            //UIColor.blueColor().setFill()
            //UIColor.blueColor().setStroke()

            
            let color1 = UIColor.blueColor()
            color1.setStroke()
            
            let graphPath1 = UIBezierPath()
            //go to start of line
            graphPath1.moveToPoint(CGPoint(x:columnXPoint1(0),y:columnYPoint1(graphPoints1[0])))
            

            for i in 1..<graphPoints1.count
            {
                let nextPoint1 = CGPoint(x:columnXPoint1(i),y:columnYPoint1(graphPoints1[i]))
                graphPath1.addLineToPoint(nextPoint1)
            }
           // graphPath1.lineWidth = 1.0
             // graphPath1.stroke()
            
            
            
            let color2 = UIColor(white: 1.0, alpha: 0.4)
            color2.setStroke()

            
            for j in 0..<graphPoints1.count
            {
                var point1 = CGPoint(x:columnXPoint1(j), y:columnYPoint1(graphPoints1[j]))
                point1.x -= 5.0/2
                point1.y -= 5.0/2                                                                                     //for 2nd graph
                let circle1 = UIBezierPath(ovalInRect:CGRect(origin: point1,size: CGSize(width: 5.0, height: 5.0)))
              //  circle1.fill()

            }
            
            
            
            /////////////////////////////////////////////////////////////////////////////////// 3rd graph///////////////
            
            let margin2:CGFloat = graphWidth/2 - 300
            
            
            let columnXPoint2 =
                
                { (column2:Int) -> CGFloat in
                //Calculate gap between points
                let spacer2 = (width - margin2*2 - 4) / CGFloat((self.graphPoints2.count - 1)) //graph plot sections
                var x2:CGFloat = CGFloat(column2) * spacer2
                x2 = x2 + margin2 + 2
                return x2
            }
            
            
            let maxValue2 = graphPoints2.maxElement()
            
            let columnYPoint2 =
                { (graphPoint2:Int) -> CGFloat in
                var y2:CGFloat = CGFloat(graphPoint2) / CGFloat(maxValue2!) * (graphHeight - 200)
                y2 = topBorder + y2 // Flip the graph
                return y2
            }
            
            
            //UIColor.blueColor().setFill()
            //UIColor.blueColor().setStroke()
            
            
            let color3 = UIColor.darkGrayColor()
            color3.setStroke()
            
            let graphPath2 = UIBezierPath()
            //go to start of line
            graphPath2.moveToPoint(CGPoint(x:columnXPoint2(0),y:columnYPoint2(graphPoints2[0])))
            
            for i in 1..<graphPoints2.count
            {
                let nextPoint2 = CGPoint(x:columnXPoint2(i),y:columnYPoint2(graphPoints1[i]))
                graphPath2.addLineToPoint(nextPoint2)
            }
            //graphPath2.lineWidth = 1.0
            //graphPath2.stroke()
            
            
            
            let color4 = UIColor(white: 1.0, alpha: 0.4)
            color4.setStroke()
            
            
            for k in 0..<graphPoints2.count
            {
                var point2 = CGPoint(x:columnXPoint2(k), y:columnYPoint2(graphPoints2[k]))
                point2.x -= 5.0/2
                point2.y -= 5.0/2                                                                                     //for 2nd graph
                let circle2 = UIBezierPath(ovalInRect:CGRect(origin: point2,size: CGSize(width: 5.0, height: 5.0)))
              //  circle2.fill()
                
            }

            
            //////////////////////////////////////////////////////////////4th graph////////////////////////////
            
            
            
            let margin3:CGFloat = graphWidth/2 - 250
            
            
            let columnXPoint3 =
                { (column3:Int) -> CGFloat in
                //Calculate gap between points
                let spacer3 = (width - margin3*2 - 4) / CGFloat((self.graphPoints3.count - 1)) //graph plot sections
                var x3:CGFloat = CGFloat(column3) * spacer3
                x3 = x3 + margin3 + 2
                return x3
            }
            
            
            let maxValue3 = graphPoints3.maxElement()
        
        
            let columnYPoint3 =
                { (graphPoint3:Int) -> CGFloat in
                var y3:CGFloat = CGFloat(graphPoint3) / CGFloat(maxValue3!) * graphHeight
                y3 =  topBorder + y3 // Flip the graph
                return y3
            }
            
            
            //UIColor.blueColor().setFill()
            //UIColor.blueColor().setStroke()
            
            
            let color5 = UIColor.yellowColor()
            color5.setStroke()
            
            let graphPath3 = UIBezierPath()
            //go to start of line
            graphPath3.moveToPoint(CGPoint(x:columnXPoint3(0),y:columnYPoint3(graphPoints3[0])))
        
            for i in 1..<graphPoints3.count
            {
                let nextPoint3 = CGPoint(x:columnXPoint3(i),y:columnYPoint3(graphPoints3[i]))
                graphPath3.addLineToPoint(nextPoint3)
            }
            //graphPath3.lineWidth = 1.0
            //graphPath3.stroke()
            
            
            
            let color6 = UIColor(white: 1.0, alpha: 0.4)
            color6.setStroke()
            
            
            for k in 0..<graphPoints3.count
            {
                var point3 = CGPoint(x:columnXPoint3(k), y:columnYPoint3(graphPoints3[k]))
                point3.x -= 5.0/2
                point3.y -= 5.0/2                                                                                     //for 2nd graph
                let circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
               // circle3.fill()
                
            }
        
        /////////////////////////////////////////////////
        let linePather = UIBezierPath()
        
        
        let color7 = UIColor(white: 1.0, alpha: 0.4)
        color7.setStroke()
        
        var point3 = CGPoint(x:margin , y:topBorder)
        var circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
        
        if checker == "0"
        {
            
            linePather.moveToPoint(CGPoint(x: margin + 60, y: topBorder))
            linePather.addLineToPoint(CGPoint(x:margin + 60,y:topBorder + 37 ))
            point3 = CGPoint(x:margin + 60 , y:topBorder)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            point3 = CGPoint(x:margin + 60,y:topBorder + 37 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            
            circle3.fill()
            
            
            
            linePather.moveToPoint(CGPoint(x: margin + 60, y: topBorder + 37))
            linePather.addLineToPoint(CGPoint(x:margin + 61,y:topBorder + 75 ))
            
            point3 = CGPoint(x:margin + 61,y:topBorder + 75 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            
            linePather.moveToPoint(CGPoint(x: margin + 61, y: topBorder + 75))
            linePather.addLineToPoint(CGPoint(x:margin + 62,y:topBorder + 114 ))
            
            point3 = CGPoint(x:margin + 62,y:topBorder + 114)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            
            linePather.moveToPoint(CGPoint(x: margin + 62, y: topBorder + 114))
            linePather.addLineToPoint(CGPoint(x:margin + 63,y:topBorder + 150))
            
            point3 = CGPoint(x:margin + 63,y:topBorder + 150)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            linePather.moveToPoint(CGPoint(x: margin + 63, y: topBorder + 150))
            linePather.addLineToPoint(CGPoint(x:margin + 68,y:topBorder + 188 ))
            
            point3 = CGPoint(x:margin + 68,y:topBorder + 188)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 68, y: topBorder + 188))
            linePather.addLineToPoint(CGPoint(x:margin + 78,y:topBorder + 226 ))
            point3 = CGPoint(x:margin + 78,y:topBorder + 226)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            
            linePather.moveToPoint(CGPoint(x: margin + 78, y: topBorder + 226))
            linePather.addLineToPoint(CGPoint(x:margin + 90,y:topBorder + 264))
            point3 = CGPoint(x:margin + 90,y:topBorder + 264)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 90, y: topBorder + 264))
            linePather.addLineToPoint(CGPoint(x:margin + 104,y:topBorder + 302))
            point3 = CGPoint(x:margin + 104,y:topBorder + 302)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            linePather.moveToPoint(CGPoint(x: margin + 104, y: topBorder + 302))
            linePather.addLineToPoint(CGPoint(x:margin + 120,y:topBorder + 340))
            point3 = CGPoint(x:margin + 120,y:topBorder + 340)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 120, y: topBorder + 340))
            linePather.addLineToPoint(CGPoint(x:margin + 135,y:topBorder + 378))
            point3 = CGPoint(x:margin + 135,y:topBorder + 378)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            
            
            linePather.moveToPoint(CGPoint(x: margin + 135, y: topBorder + 378))
            linePather.addLineToPoint(CGPoint(x:margin + 155,y:topBorder + 416))
            point3 = CGPoint(x:margin + 155,y:topBorder + 416)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            linePather.moveToPoint(CGPoint(x: margin + 155, y: topBorder + 416))
            linePather.addLineToPoint(CGPoint(x:margin + 180,y:topBorder + 454))
            point3 = CGPoint(x:margin + 180,y:topBorder + 454)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            linePather.moveToPoint(CGPoint(x: margin + 180, y: topBorder + 454))
            linePather.addLineToPoint(CGPoint(x:margin + 235,y:topBorder + 492))
            point3 = CGPoint(x:margin + 235,y:topBorder + 492)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            linePather.moveToPoint(CGPoint(x: margin + 235, y: topBorder + 492))
            linePather.addLineToPoint(CGPoint(x:margin + 360,y:topBorder + 530))
            point3 = CGPoint(x:margin + 360,y:topBorder + 530)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 360, y: topBorder + 530))
            linePather.addLineToPoint(CGPoint(x:margin + 550,y:topBorder + 566))
            point3 = CGPoint(x:margin + 550,y:topBorder + 566)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 550, y: topBorder + 566))
            linePather.addLineToPoint(CGPoint(x:margin + 590,y:topBorder + 604))
            point3 = CGPoint(x:margin + 590,y:topBorder + 604)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 590, y: topBorder + 604))
            linePather.addLineToPoint(CGPoint(x:margin + 605,y:topBorder + 642))
            point3 = CGPoint(x:margin + 605,y:topBorder + 642)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 605, y: topBorder + 642))
            linePather.addLineToPoint(CGPoint(x:margin + 623,y:topBorder + 680))
            point3 = CGPoint(x:margin + 623,y:topBorder + 680)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 623, y: topBorder + 680))
            linePather.addLineToPoint(CGPoint(x:margin + 639,y:topBorder + 716))
            point3 = CGPoint(x:margin + 639,y:topBorder + 716)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 639, y: topBorder + 716))
            linePather.addLineToPoint(CGPoint(x:margin + 655,y:topBorder + 752))
            point3 = CGPoint(x:margin + 655,y:topBorder + 752)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 655, y: topBorder + 752))
            linePather.addLineToPoint(CGPoint(x:margin + 670,y:topBorder + 794))
            point3 = CGPoint(x:margin + 670,y:topBorder + 794)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 670, y: topBorder + 794))
            linePather.addLineToPoint(CGPoint(x:margin + 694,y:topBorder + 838))
            point3 = CGPoint(x:margin + 694,y:topBorder + 838)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 694, y: topBorder + 838))
            linePather.addLineToPoint(CGPoint(x:margin + 706,y:topBorder + 875))
            point3 = CGPoint(x:margin + 706,y:topBorder + 875)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            linePather.moveToPoint(CGPoint(x: margin + 706, y: topBorder + 875))
            linePather.addLineToPoint(CGPoint(x:margin + 726 ,y:topBorder + 908))
            point3 = CGPoint(x:margin + 726 ,y:topBorder + 908)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 726, y: topBorder + 908))
            linePather.addLineToPoint(CGPoint(x:margin + 736,y:topBorder + 943))
            point3 = CGPoint(x:margin + 736,y:topBorder + 943)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 736, y: topBorder + 943))
            linePather.addLineToPoint(CGPoint(x:margin + 746,y:topBorder + 980))
            point3 = CGPoint(x:margin + 746,y:topBorder + 980)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 746, y: topBorder + 980))
            linePather.addLineToPoint(CGPoint(x:margin + 754,y:topBorder + 1015))
            point3 = CGPoint(x:margin + 754,y:topBorder + 1015)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather.moveToPoint(CGPoint(x: margin + 754, y: topBorder + 1015))
            linePather.addLineToPoint(CGPoint(x:margin + 758,y:topBorder + 1053))
            point3 = CGPoint(x:margin + 758,y:topBorder + 1053)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            UIColor.whiteColor().setFill()
            UIColor.greenColor().setStroke()
            
            linePather.lineWidth = 2.0
            linePather.stroke()
            
            
        }
        
        ////////////////////////////////////////////////////////////////
        let linePather1 = UIBezierPath()
        
        let marginer:CGFloat = 40.0 + margin
        
        if checker1 == "0"
        {
            linePather1.moveToPoint(CGPoint(x: marginer + 60, y: topBorder))
            linePather1.addLineToPoint(CGPoint(x:marginer + 60,y:topBorder + 37 ))
            point3 = CGPoint(x:marginer + 60,y:topBorder + 37 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 60, y: topBorder + 37))
            linePather1.addLineToPoint(CGPoint(x:marginer + 61,y:topBorder + 75 ))
            point3 = CGPoint(x:marginer + 61,y:topBorder + 75 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 61, y: topBorder + 75))
            linePather1.addLineToPoint(CGPoint(x:marginer + 62,y:topBorder + 114 ))
            point3 = CGPoint(x:marginer + 62,y:topBorder + 114 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 62, y: topBorder + 114))
            linePather1.addLineToPoint(CGPoint(x:marginer + 63,y:topBorder + 150))
            point3 = CGPoint(x:marginer + 63,y:topBorder + 150)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 63, y: topBorder + 150))
            linePather1.addLineToPoint(CGPoint(x:marginer + 68,y:topBorder + 188 ))
            point3 = CGPoint(x:marginer + 68,y:topBorder + 188 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 68, y: topBorder + 188))
            linePather1.addLineToPoint(CGPoint(x:marginer + 78,y:topBorder + 226 ))
            point3 = CGPoint(x:marginer + 78,y:topBorder + 226 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 78, y: topBorder + 226))
            linePather1.addLineToPoint(CGPoint(x:marginer + 90,y:topBorder + 264))
            point3 = CGPoint(x:marginer + 90,y:topBorder + 264)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 90, y: topBorder + 264))
            linePather1.addLineToPoint(CGPoint(x:marginer + 104,y:topBorder + 302))
            point3 = CGPoint(x:marginer + 104,y:topBorder + 302)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 104, y: topBorder + 302))
            linePather1.addLineToPoint(CGPoint(x:marginer + 120,y:topBorder + 340))
            point3 = CGPoint(x:marginer + 120,y:topBorder + 340)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 120, y: topBorder + 340))
            linePather1.addLineToPoint(CGPoint(x:marginer + 135,y:topBorder + 378))
            point3 = CGPoint(x:marginer + 135,y:topBorder + 378)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 135, y: topBorder + 378))
            linePather1.addLineToPoint(CGPoint(x:marginer + 155,y:topBorder + 416))
            point3 = CGPoint(x:marginer + 155,y:topBorder + 416)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 155, y: topBorder + 416))
            linePather1.addLineToPoint(CGPoint(x:marginer + 180,y:topBorder + 454))
            point3 = CGPoint(x:marginer + 180,y:topBorder + 454)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 180, y: topBorder + 454))
            linePather1.addLineToPoint(CGPoint(x:marginer + 235,y:topBorder + 500))
            point3 = CGPoint(x:marginer + 235,y:topBorder + 500)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 235, y: topBorder + 500))
            linePather1.addLineToPoint(CGPoint(x:marginer + 360,y:topBorder + 530))
            point3 = CGPoint(x:marginer + 360,y:topBorder + 530)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 360, y: topBorder + 530))
            linePather1.addLineToPoint(CGPoint(x:marginer + 520,y:topBorder + 566))
            point3 = CGPoint(x:marginer + 520,y:topBorder + 566)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 520, y: topBorder + 566))
            linePather1.addLineToPoint(CGPoint(x:marginer + 570,y:topBorder + 604))
            point3 = CGPoint(x:marginer + 570,y:topBorder + 604)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 570, y: topBorder + 604))
            linePather1.addLineToPoint(CGPoint(x:marginer + 590,y:topBorder + 642))
            point3 = CGPoint(x:marginer + 590,y:topBorder + 642)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 590, y: topBorder + 642))
            linePather1.addLineToPoint(CGPoint(x:marginer + 613,y:topBorder + 680))
            point3 = CGPoint(x:marginer + 613,y:topBorder + 680)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 613, y: topBorder + 680))
            linePather1.addLineToPoint(CGPoint(x:marginer + 625,y:topBorder + 716))
            point3 = CGPoint(x:marginer + 625,y:topBorder + 716)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 626, y: topBorder + 716))
            linePather1.addLineToPoint(CGPoint(x:marginer + 645,y:topBorder + 752))
            point3 = CGPoint(x:marginer + 645,y:topBorder + 752)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 645, y: topBorder + 752))
            linePather1.addLineToPoint(CGPoint(x:marginer + 665,y:topBorder + 794))
            point3 = CGPoint(x:marginer + 665,y:topBorder + 794)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 665, y: topBorder + 794))
            linePather1.addLineToPoint(CGPoint(x:marginer + 685,y:topBorder + 838))
            point3 = CGPoint(x:marginer + 685,y:topBorder + 838)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 685, y: topBorder + 838))
            linePather1.addLineToPoint(CGPoint(x:marginer + 696,y:topBorder + 875))
            point3 = CGPoint(x:marginer + 696,y:topBorder + 875)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 696, y: topBorder + 875))
            linePather1.addLineToPoint(CGPoint(x:marginer + 716 ,y:topBorder + 908))
            point3 = CGPoint(x:marginer + 716 ,y:topBorder + 908)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 716, y: topBorder + 908))
            linePather1.addLineToPoint(CGPoint(x:marginer + 726,y:topBorder + 943))
            point3 = CGPoint(x:marginer + 726,y:topBorder + 943)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 726, y: topBorder + 943))
            linePather1.addLineToPoint(CGPoint(x:marginer + 736,y:topBorder + 980))
            point3 = CGPoint(x:marginer + 736,y:topBorder + 980)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 736, y: topBorder + 980))
            linePather1.addLineToPoint(CGPoint(x:marginer + 744,y:topBorder + 1015))
            point3 = CGPoint(x:marginer + 744,y:topBorder + 1015)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather1.moveToPoint(CGPoint(x: marginer + 744, y: topBorder + 1015))
            linePather1.addLineToPoint(CGPoint(x:marginer + 748,y:topBorder + 1053))
            point3 = CGPoint(x:marginer + 748,y:topBorder + 1053)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            UIColor.whiteColor().setFill()
            UIColor.blueColor().setStroke()
            
            linePather1.lineWidth = 2.0
            linePather1.stroke()
            
        }
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        
        let linePather2 = UIBezierPath()
        
        let marginer2:CGFloat = 175.0 + margin
        
        if checker2 == "0"
        {
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 60, y: topBorder))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 70,y:topBorder + 37 ))
            point3 = CGPoint(x:marginer2 + 70,y:topBorder + 37 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 70, y: topBorder + 37))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 90,y:topBorder + 75 ))
            point3 = CGPoint(x:marginer2 + 90,y:topBorder + 75 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 90, y: topBorder + 75))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 120,y:topBorder + 114 ))
            point3 = CGPoint(x:marginer2 + 120,y:topBorder + 114 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 120, y: topBorder + 114))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 163,y:topBorder + 150))
            point3 = CGPoint(x:marginer2 + 163,y:topBorder + 150)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 163, y: topBorder + 150))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 215,y:topBorder + 188))
            point3 = CGPoint(x:marginer2 + 215,y:topBorder + 188)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 215, y: topBorder + 188))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 248,y:topBorder + 226))
            point3 = CGPoint(x:marginer2 + 248,y:topBorder + 226)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 248, y: topBorder + 226))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 285,y:topBorder + 264))
            point3 = CGPoint(x:marginer2 + 285,y:topBorder + 264)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 285, y: topBorder + 264))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 320,y:topBorder + 302))
            point3 = CGPoint(x:marginer2 + 320,y:topBorder + 302)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 320, y: topBorder + 302))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 355,y:topBorder + 340))
            point3 = CGPoint(x:marginer2 + 355,y:topBorder + 340)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 355, y: topBorder + 340))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 380,y:topBorder + 378))
            point3 = CGPoint(x:marginer2 + 380,y:topBorder + 378)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 380, y: topBorder + 378))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 410,y:topBorder + 418))
            point3 = CGPoint(x:marginer2 + 410,y:topBorder + 418)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 410, y: topBorder + 418))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 435,y:topBorder + 454))
            point3 = CGPoint(x:marginer2 + 435,y:topBorder + 454)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 435, y: topBorder + 454))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 470,y:topBorder + 492))
            point3 = CGPoint(x:marginer2 + 470,y:topBorder + 492)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 470, y: topBorder + 492))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 495,y:topBorder + 530))
            point3 = CGPoint(x:marginer2 + 495,y:topBorder + 530)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 495, y: topBorder + 530))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 520,y:topBorder + 566))
            point3 = CGPoint(x:marginer2 + 520,y:topBorder + 566)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 520, y: topBorder + 566))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 545,y:topBorder + 604))
            point3 = CGPoint(x:marginer2 + 545,y:topBorder + 604)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 545, y: topBorder + 604))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 570,y:topBorder + 642))
            point3 = CGPoint(x:marginer2 + 570,y:topBorder + 642)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 570, y: topBorder + 642))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 600,y:topBorder + 680))
            point3 = CGPoint(x:marginer2 + 600,y:topBorder + 680)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 600, y: topBorder + 680))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 625,y:topBorder + 716))
            point3 = CGPoint(x:marginer2 + 625,y:topBorder + 716)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 625, y: topBorder + 716))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 645,y:topBorder + 752))
            point3 = CGPoint(x:marginer2 + 645,y:topBorder + 752)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 645, y: topBorder + 752))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 670,y:topBorder + 794))
            point3 = CGPoint(x:marginer2 + 670,y:topBorder + 794)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 670, y: topBorder + 794))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 700,y:topBorder + 875))
            point3 = CGPoint(x:marginer2 + 700,y:topBorder + 875)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 700, y: topBorder + 875))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 715,y:topBorder + 908))
            point3 = CGPoint(x:marginer2 + 715,y:topBorder + 908)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 715, y: topBorder + 908))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 730,y:topBorder + 943))
            point3 = CGPoint(x:marginer2 + 730,y:topBorder + 943)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 730, y: topBorder + 943))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 742,y:topBorder + 980))
            point3 = CGPoint(x:marginer2 + 742,y:topBorder + 980)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 742, y: topBorder + 980))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 750,y:topBorder + 1015))
            point3 = CGPoint(x:marginer2 + 750,y:topBorder + 1015)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather2.moveToPoint(CGPoint(x: marginer2 + 750, y: topBorder + 1015))
            linePather2.addLineToPoint(CGPoint(x:marginer2 + 755,y:topBorder + 1053))
            point3 = CGPoint(x:marginer2 + 755,y:topBorder + 1053)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            UIColor.whiteColor().setFill()
            UIColor.redColor().setStroke()
            
            linePather2.lineWidth = 2.0
            linePather2.stroke()
        }
        
        
        /////////////////////////////////////////////////////
        
        let linePather3 = UIBezierPath()
        
        let marginer3:CGFloat = 210.0 + margin
        
        if checker3 == "0"
        {
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 60, y: topBorder))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 70,y:topBorder + 37 ))
            point3 = CGPoint(x:marginer3 + 70,y:topBorder + 37 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 70, y: topBorder + 37))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 90,y:topBorder + 75 ))
            point3 = CGPoint(x:marginer3 + 90,y:topBorder + 75 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 90, y: topBorder + 75))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 120,y:topBorder + 114 ))
            point3 = CGPoint(x:marginer3 + 120,y:topBorder + 114 )
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 120, y: topBorder + 114))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 163,y:topBorder + 150))
            point3 = CGPoint(x:marginer3 + 163,y:topBorder + 150)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 163, y: topBorder + 150))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 215,y:topBorder + 188))
            point3 = CGPoint(x:marginer3 + 215,y:topBorder + 188)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 215, y: topBorder + 188))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 248,y:topBorder + 226))
            point3 = CGPoint(x:marginer3 + 248,y:topBorder + 226)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 248, y: topBorder + 226))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 285,y:topBorder + 264))
            point3 = CGPoint(x:marginer3 + 285,y:topBorder + 264)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 285, y: topBorder + 264))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 320,y:topBorder + 302))
            point3 = CGPoint(x:marginer3 + 320,y:topBorder + 302)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 320, y: topBorder + 302))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 355,y:topBorder + 340))
            point3 = CGPoint(x:marginer3 + 355,y:topBorder + 340)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 355, y: topBorder + 340))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 380,y:topBorder + 378))
            point3 = CGPoint(x:marginer3 + 380,y:topBorder + 378)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 380, y: topBorder + 378))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 410,y:topBorder + 418))
            point3 = CGPoint(x:marginer3 + 410,y:topBorder + 418)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 410, y: topBorder + 418))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 435,y:topBorder + 454))
            point3 = CGPoint(x:marginer3 + 435,y:topBorder + 454)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 435, y: topBorder + 454))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 470,y:topBorder + 492))
            point3 = CGPoint(x:marginer3 + 470,y:topBorder + 492)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 470, y: topBorder + 492))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 495,y:topBorder + 530))
            point3 = CGPoint(x:marginer3 + 495,y:topBorder + 530)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 495, y: topBorder + 530))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 520,y:topBorder + 566))
            point3 = CGPoint(x:marginer3 + 520,y:topBorder + 566)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 520, y: topBorder + 566))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 545,y:topBorder + 604))
            point3 = CGPoint(x:marginer3 + 545,y:topBorder + 604)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 545, y: topBorder + 604))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 570,y:topBorder + 642))
            point3 = CGPoint(x:marginer3 + 570,y:topBorder + 642)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 570, y: topBorder + 642))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 600,y:topBorder + 680))
            point3 = CGPoint(x:marginer3 + 600,y:topBorder + 680)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 600, y: topBorder + 680))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 625,y:topBorder + 716))
            point3 = CGPoint(x:marginer3 + 625,y:topBorder + 716)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 625, y: topBorder + 716))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 645,y:topBorder + 752))
            point3 = CGPoint(x:marginer3 + 645,y:topBorder + 752)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 645, y: topBorder + 752))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 670,y:topBorder + 794))
            point3 = CGPoint(x:marginer3 + 670,y:topBorder + 794)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 670, y: topBorder + 794))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 700,y:topBorder + 875))
            point3 = CGPoint(x:marginer3 + 700,y:topBorder + 875)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 700, y: topBorder + 875))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 715,y:topBorder + 908))
            point3 = CGPoint(x:marginer3 + 715,y:topBorder + 908)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 715, y: topBorder + 908))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 730,y:topBorder + 943))
            point3 = CGPoint(x:marginer3 + 730,y:topBorder + 943)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 730, y: topBorder + 943))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 742,y:topBorder + 980))
            point3 = CGPoint(x:marginer3 + 742,y:topBorder + 980)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 742, y: topBorder + 980))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 750,y:topBorder + 1015))
            point3 = CGPoint(x:marginer3 + 750,y:topBorder + 1015)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            linePather3.moveToPoint(CGPoint(x: marginer3 + 750, y: topBorder + 1015))
            linePather3.addLineToPoint(CGPoint(x:marginer3 + 755,y:topBorder + 1053))
            point3 = CGPoint(x:marginer3 + 755,y:topBorder + 1053)
            circle3 = UIBezierPath(ovalInRect:CGRect(origin: point3,size: CGSize(width: 5.0, height: 5.0)))
            circle3.fill()
            
            
            UIColor.whiteColor().setFill()
            UIColor.yellowColor().setStroke()
            
            linePather3.lineWidth = 2.0
            linePather3.stroke()
        }
    
        //////////////////////////////////////
        let linePather4 = UIBezierPath()
        
        if checker4 == "1"
        {
        linePather4.moveToPoint(CGPoint(x:marginer + 750,y:topBorder + 1053))
        linePather4.addLineToPoint(CGPoint (x:marginer2 + 620,y:topBorder + 712))
        
        linePather4.moveToPoint(CGPoint(x:marginer2 + 620,y:topBorder + 712))
        linePather4.addLineToPoint(CGPoint (x:marginer + 625,y:topBorder + 712))
        
        
        linePather4.moveToPoint(CGPoint(x:marginer + 625,y:topBorder + 712))
        linePather4.addLineToPoint(CGPoint (x:marginer2 + 491,y:topBorder + 525))
        
        linePather4.moveToPoint(CGPoint(x:marginer2 + 491,y:topBorder + 525))
        linePather4.addLineToPoint(CGPoint (x:marginer + 347,y:topBorder + 525))
        
        
        linePather4.moveToPoint(CGPoint(x:marginer + 347,y:topBorder + 525))
        linePather4.addLineToPoint(CGPoint (x:marginer2 + 215,y:topBorder + 188))
        
        linePather4.moveToPoint(CGPoint(x:marginer2 + 215,y:topBorder + 188))
        linePather4.addLineToPoint(CGPoint ( x:marginer + 68,y:topBorder + 188))

        
        
        linePather4.moveToPoint(CGPoint(x:marginer + 68,y:topBorder + 188))
        linePather4.addLineToPoint(CGPoint ( x: marginer + 70, y: topBorder))


        
        
        UIColor.whiteColor().setFill()
        UIColor.blackColor().setStroke()
        linePather4.lineWidth = 2.0
        linePather4.stroke()
        }
        
        
    //////////////////////////////////////////////////
    }
        
    

}

    

