//
//  ContentView.swift
//  exercise9
//
//  Created by Davison on 2021/11/22.
//

import SwiftUI
import UIKit

struct DrawView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        let lineWidth: CGFloat = 10
        let radius: CGFloat = 50
        
        let circlePath = UIBezierPath(ovalIn: CGRect(x: lineWidth, y: lineWidth, width: radius*2, height: radius*2))
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.gray.cgColor
        circleLayer.lineWidth = lineWidth
        circleLayer.fillColor = UIColor.clear.cgColor
        
        let oneDegree = CGFloat.pi / 180
        let startDegree: CGFloat = 270
        let percentage: CGFloat = 60
        
        let percentagePath = UIBezierPath(arcCenter: CGPoint(x: lineWidth + radius, y: lineWidth + radius), radius: radius, startAngle: oneDegree * startDegree, endAngle: oneDegree * (startDegree + 360 * percentage / 100), clockwise: true)
        
        let percentageLayer = CAShapeLayer()
        percentageLayer.path = percentagePath.cgPath
        percentageLayer.strokeColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1).cgColor
        percentageLayer.lineWidth = lineWidth
        percentageLayer.fillColor = UIColor.clear.cgColor
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: (radius + lineWidth) * 2, height: (radius + lineWidth) * 2))
        label.textAlignment = .center
        label.text = "\(percentage)%"
        
        
        view.layer.addSublayer(circleLayer)
        view.layer.addSublayer(percentageLayer)
        view.addSubview(label)
        
        
        
        /*
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 100, y: 0))
        path.addLine(to: CGPoint(x: 100, y: 100))
        path.close()
        
        let picLayer = CAShapeLayer()
        picLayer.path = path.cgPath
        picLayer.fillColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        view.layer.addSublayer(picLayer)
        */
        
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
}
struct ContentView: View {
    var body: some View {
        DrawView()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
