//
//  ViewController.swift
//  Bird Fly
//
//  Created by khacviet on 11/24/16.
//  Copyright © 2016 khacviet. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController
{
    var bird = UIImageView()
    var song = AVAudioPlayer()
    
    @IBOutlet weak var tf_speed: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tf_speed.text = "2"

        drawJungle()
        addBird()
        fly1To2()
        playSong()
        
    }
    
    func drawJungle()
    {
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .scaleAspectFill
        self.view.addSubview(background)
    }
    func addBird()
    {
        bird = UIImageView(frame: CGRect(x: 0 ,y: 0, width: 50, height: 50))
        bird.animationImages = [UIImage(named: "bird0.png")!,
                                UIImage(named: "bird1.png")!,
                                UIImage(named: "bird2.png")!,
                                UIImage(named: "bird3.png")!,
                                UIImage(named: "bird4.png")!,
                                UIImage(named: "bird5.png")!,]
        bird.animationDuration = TimeInterval(Int(tf_speed.text!)!) / 4
         bird.animationRepeatCount = 0
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    
    @IBAction func btn_start(_ sender: AnyObject)
    {
        fly1To2()
    }
    
    func fly1To2()
    {
        UIView.animate(withDuration: TimeInterval(Int(tf_speed.text!)!), animations: {self.bird.center = CGPoint(x: self.view.bounds.size.width - 30, y: self.view.bounds.size.height - 20)}, completion: {
            (finished) in
            self.bird.transform = self.bird.transform.scaledBy(x: 1, y: -1).concatenating(CGAffineTransform(rotationAngle: -135))
            self.fly2To3()
        })
        
    }
    
    func fly2To3()
    {
        UIView.animate(withDuration: TimeInterval(Int(tf_speed.text!)!), animations: {self.bird.center = CGPoint(x: 30, y: self.view.bounds.size.height - 20)}, completion: {
            (finished) in
            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 225))
            self.fly3To4()
        })
        
    }
    
    func fly3To4()
    {
        UIView.animate(withDuration: TimeInterval(Int(tf_speed.text!)!), animations: {self.bird.center = CGPoint(x: self.view.bounds.width - 30, y: 20)}, completion: {
            (finished)  in
            self.bird.transform = self.bird.transform.scaledBy(x: 1, y: -1).concatenating(CGAffineTransform(rotationAngle: -90))
            self.fly4To1()
        })
        
    }
    
    func fly4To1()
    {
        UIView.animate(withDuration: TimeInterval(Int(tf_speed.text!)!), animations: {self.bird.center = CGPoint(x: 0 + 30, y: 0 + 20)}, completion: {
            (finished)  in
            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0))
            self.fly1To2()
        })
        
    }
    
    func playSong()
    {
        let filePath = Bundle.main.path(forResource: "A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = URL(fileURLWithPath: filePath!)
        song = try! AVAudioPlayer(contentsOf: url)
        song.play()
    }
}
