//
//  BreathingViewController.swift
//  FindYourZen
//
//  Created by Allen Gu on 4/4/21.
//

import UIKit

class BreathingViewController: CustomViewController, CAAnimationDelegate {

    var path: UIBezierPath!
    
    let shapeLayer = CAShapeLayer()
    var width: Double!
    var height: Double!
    var initialRadius: Double!
    var centerX: Double!
    var centerY: Double!
    let initialRadiusRatio = 0.6
    var innerBound: Double!
    var outerBound: Double!
    var animationID: Int = 0
    var newPath: UIBezierPath!
    
    lazy var startButton: UIButton = {
        let button = CustomButton()
        button.setTitle("start", for: .normal)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "HERE"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        width = Double(view.bounds.width)
        height = Double(view.bounds.height)
        centerX = width/2
        centerY = height/2
        innerBound = 0.4 * width / 2
        outerBound = 0.8 * width / 2
        setup()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.setGradientBackground()
        super.viewWillAppear(animated)
        createInitialPath()
        startButton.isHidden = false
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        animationID = 0
        shapeLayer.removeAllAnimations()
    }
    
    func setup() {
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            self.startButton.heightAnchor.constraint(equalToConstant: 48),
            self.startButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -120),
            self.startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.startButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func startButtonTapped() {
        breatheIn()
        startButton.isHidden = true
    }

    
    // Path Drawing
    func createInitialPath() {
        let points = generatePoints(numberOfPoints: 6, beta: 0.4)
        path = createBezierPath(points: points)
        drawPath(path: path)
    }
    
    func generatePoints(numberOfPoints: Int, beta: Double) -> [Point] {
        let angleInterval = 2 * Double.pi / Double(numberOfPoints)
        let radius = beta * width / 2

        var points: [Point] = []
        for i in 0..<numberOfPoints {
            let angle: Double = angleInterval * Double(i)
            let d: Double = radius + Double.random(in: -beta * radius/6 ..< beta * radius/6)
            let point: Point = Point.fromPolar(centerX: centerX, centerY: centerY, radius: d, theta: angle)
            points.append(point)
        }
        return points
    }
    
    func drawPoints(points: [Point]) {
        for point in points {
            let circleLayer = CAShapeLayer();
            circleLayer.path = UIBezierPath(ovalIn: CGRect(x: point.x!, y: point.y!, width: 10, height: 10)).cgPath;
            view.layer.addSublayer(circleLayer)
        }
    }
    
    func drawPath(path: UIBezierPath) {
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
        view.layer.addSublayer(shapeLayer)
    }
    
    func createBezierPath(points: [Point]) -> UIBezierPath {
        let alpha = 0.5
        let path = UIBezierPath()
        for i in 0..<points.count {
            let next = (i + 1) % points.count
            let nextnext = (i + 2) % points.count
            let prev = (i - 1 + points.count) % points.count
            let p1 = points[i]
            let p0 = points[prev]
            let p2 = points[next]
            let p3 = points[nextnext]
            
            let controlPoints = CatmullRom.getControlPoints(p0, p1, p2, p3, alpha)
            
            if i == 0 {
                path.move(to: p1.toCGPoint())
            }
            
            path.addCurve(to: p2.toCGPoint(), controlPoint1: controlPoints[0].toCGPoint(), controlPoint2: controlPoints[1].toCGPoint())
        }
        
        path.close()
        return path
    }
    
    func animate(startPath: CGPath, endPath: CGPath, duration: Double) {
        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = duration
        animation.fromValue = startPath
        animation.toValue = endPath
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName(rawValue: "easeOut"))
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        shapeLayer.removeAllAnimations()
        shapeLayer.add(animation, forKey: "path")
    }
    
    func breatheIn() {
        let newPoints = generatePoints(numberOfPoints: 6, beta: 0.7)
        newPath = createBezierPath(points: newPoints)
        animate(startPath: shapeLayer.path!, endPath: newPath.cgPath, duration: 4.0)
    }
    
    func hold() {
        animate(startPath: shapeLayer.path!, endPath: shapeLayer.path!, duration: 7.0)
    }
    
    func breatheOut() {
        let newPoints = generatePoints(numberOfPoints: 6, beta: 0.4)
        newPath = createBezierPath(points: newPoints)
        animate(startPath: shapeLayer.path!, endPath: newPath.cgPath, duration: 8.0)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            shapeLayer.path = newPath.cgPath
            animationID = (animationID + 1) % 3
            switch animationID {
            case 0:
                breatheIn()
            case 1:
                hold()
            case 2:
                breatheOut()
            default:
                return
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class Point {
    var x: Double!
    var y: Double!
    
    init(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
    }
    
    func angle(_ x0: Double, _ y0: Double) -> Double {
        return atan2(x - x0, y - y0)
    }
    
    func magnitude(_ x0: Double, _ y0: Double) -> Double {
        return sqrt(pow(x - x0, 2) + pow(y - y0, 2))
    }
    
    static func fromPolar(centerX: Double, centerY: Double, radius: Double, theta: Double) -> Point {
        let x = centerX + radius * cos(theta)
        let y = centerY + radius * sin(theta)
        return Point(x, y)
    }
    
    static func distance(_ p1: Point, _ p2: Point) -> Double {
        return sqrt(pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2))
    }
    
    static func add(_ p1: Point, _ p2: Point) -> Point {
        return Point(p1.x + p2.x, p1.y + p2.y)
    }
    
    static func subtract(_ p1: Point, _ p2: Point) -> Point {
        return Point(p1.x - p2.x, p1.y - p2.y)
    }
    
    static func multiply(_ p: Point, _ x: Double) -> Point {
        return Point(p.x * x, p.y * x)
    }
    
    func toCGPoint() -> CGPoint {
        return CGPoint(x: self.x, y: self.y)
    }
}

class CatmullRom {
    static func getControlPoints(_ p0: Point, _ p1: Point, _ p2: Point, _ p3: Point, _ alpha: Double) -> [Point] {
        let d1: Double = Point.distance(p1, p0)
        let d2: Double = Point.distance(p2, p1)
        let d3: Double = Point.distance(p3, p2)
        
        var b1: Point = Point.multiply(p2, pow(d1, 2 * alpha))
        b1 = Point.subtract(b1, Point.multiply(p0, pow(d2, 2 * alpha)))
        b1 = Point.add(b1, Point.multiply(p1, (2 * pow(d1, 2 * alpha) + 3 * pow(d1, alpha) * pow(d2, alpha) + pow(d2, 2 * alpha))))
        b1 = Point.multiply(b1, 1.0 / (3 * pow(d1, alpha) * (pow(d1, alpha) + pow(d2, alpha))))
        
        var b2: Point = Point.multiply(p1, pow(d3, 2 * alpha))
        b2 = Point.subtract(b2, Point.multiply(p3, pow(d2, 2 * alpha)))
        b2 = Point.add(b2, Point.multiply(p2, (2 * pow(d3, 2 * alpha) + 3 * pow(d3, alpha) * pow(d2, alpha) + pow(d2, 2 * alpha))))
        b2 = Point.multiply(b2, 1.0 / (3 * pow(d3, alpha) * (pow(d3, alpha) + pow(d2, alpha))))
        
        return [b1, b2]
    }
}
