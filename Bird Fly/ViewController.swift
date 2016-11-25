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
    
    var speed1 = 1
    var speed2 = 3
    
    @IBOutlet weak var text_speed: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        drawJungle()
        addBird()
        fly1To2()
        playSong()
    }
    
    func drawJungle()
    {
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .ScaleAspectFill
        self.view.addSubview(background)
    }
    func addBird()
    {
        bird = UIImageView(frame: CGRectMake(0 ,0, 50, 50))
        bird.animationImages = [UIImage(named: "bird0.png")!,
                                UIImage(named: "bird1.png")!,
                                UIImage(named: "bird2.png")!,
                                UIImage(named: "bird3.png")!,
                                UIImage(named: "bird4.png")!,
                                UIImage(named: "bird5.png")!,]
        bird.animationDuration = 0.5
         bird.animationRepeatCount = 0
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    
    @IBAction func btn_start(sender: AnyObject)
    {
        
    }
    
    func fly1To2()
    {
        UIView.animateWithDuration(2, animations: {self.bird.center = CGPointMake(self.view.bounds.size.width - 30, self.view.bounds.size.height - 20)})
        {
            (finished) in
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, 1, -1),CGAffineTransformMakeRotation(-135))
            self.fly2To3()
        }
    }
    
    func fly2To3()
    {
        UIView.animateWithDuration(2, animations: {self.bird.center = CGPointMake(30, self.view.bounds.size.height - 20)})
        {
            (finished) in
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(225))
            self.fly3To4()
        }
    }
    
    func fly3To4()
    {
        UIView.animateWithDuration(2, animations: {self.bird.center = CGPointMake(self.view.bounds.width - 30, 20)})
        {
            (finished)  in
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, 1, -1), CGAffineTransformMakeRotation(-90))
            self.fly4To1()
        }
    }
    
    func fly4To1()
    {
        UIView.animateWithDuration(2, animations: {self.bird.center = CGPointMake(0 + 30, 0 + 20)})
        {
            (finished)  in
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(0))
            self.fly1To2()
        }
    }
    
    func playSong()
    {
        let filePath = NSBundle.mainBundle().pathForResource("A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = NSURL(fileURLWithPath: filePath!)
        song = try! AVAudioPlayer(contentsOfURL: url)
        song.play()
        
    }
}