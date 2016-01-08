//
//  MTG Calculator.swift
//  TCG Life Calculator
//
//  Created by mphipps on 12/18/15.
//  Copyright © 2015 mphipps. All rights reserved.
//

import UIKit

class MTG_Calculator: UIViewController {
    @IBOutlet weak var p1: UILabel!
    @IBOutlet weak var p2: UILabel!
    @IBOutlet weak var p1Life: UILabel!
    @IBOutlet weak var p2Life: UILabel!
    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var three: UILabel!
    @IBOutlet weak var four: UILabel!
    @IBOutlet weak var five: UILabel!
    @IBOutlet weak var six: UILabel!
    @IBOutlet weak var seven: UILabel!
    @IBOutlet weak var eight: UILabel!
    @IBOutlet weak var nine: UILabel!
    @IBOutlet weak var zero: UILabel!
    @IBOutlet weak var oneOne: UILabel!
    @IBOutlet weak var twoTwo: UILabel!
    @IBOutlet weak var threeThree: UILabel!
    @IBOutlet weak var fourFour: UILabel!
    @IBOutlet weak var fiveFive: UILabel!
    @IBOutlet weak var sixSix: UILabel!
    @IBOutlet weak var sevenSeven: UILabel!
    @IBOutlet weak var eightEight: UILabel!
    @IBOutlet weak var nineNine: UILabel!
    @IBOutlet weak var plus: UILabel!
    @IBOutlet weak var minus: UILabel!
    var labelsArray = [UILabel]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelsArray = [p1, p2, plus, minus, one, two, three, four, five, six, seven, eight, nine, zero, oneOne, twoTwo, threeThree, fourFour, fiveFive, sixSix,
        sevenSeven, eightEight, nineNine]
    }
    @IBAction func onTapped(sender: UITapGestureRecognizer)
    {
        var it = 0
        for label in labelsArray
        {
            if CGRectContainsPoint(label.frame, sender.locationInView(view))
            {
                if it == 0 || it == 1 //Checks which player (or both players) is selected
                {
                    if label.backgroundColor == UIColor.cyanColor() //Use the background colors as identifiers for what is selected
                    {
                        label.backgroundColor = UIColor.whiteColor()
                    }
                    else
                    {
                        label.backgroundColor = UIColor.cyanColor()
                    }
                }
                else if it == 2 || it == 3 //If statements to be sure that no more than one label is selected in a column
                {
                    if it == 2 //Same with all if statements, if its in that column the it will reset all other options in that column
                    {
                        label.backgroundColor = UIColor.cyanColor()
                        labelsArray[3].backgroundColor = UIColor.whiteColor()
                    }
                    else
                    {
                        label.backgroundColor = UIColor.cyanColor()
                        labelsArray[2].backgroundColor = UIColor.whiteColor()
                    }
                }
                else if it > 3 && it < 13
                {
                    for var i = 4; i < 13 ; i++
                    {
                        if labelsArray[i].backgroundColor == UIColor.cyanColor()
                        {
                            labelsArray[i].backgroundColor = UIColor.whiteColor()
                        }
                    }
                    label.backgroundColor = UIColor.cyanColor()
                }
                else if it > 12
                {
                    for var i = 13; i < 23 ; i++
                    {
                        if labelsArray[i].backgroundColor == UIColor.cyanColor()
                        {
                            labelsArray[i].backgroundColor = UIColor.whiteColor()
                        }
                    }
                    label.backgroundColor = UIColor.cyanColor()
                }
            }
            it++
        }
    }
    @IBAction func Calculate(sender: UIButton)
    {
        var it = 0 //Iterator
        var add = false
        var total = 0
        if labelsArray[2].backgroundColor == UIColor.cyanColor()
        {
            add = true
        }
        for label in labelsArray
        {
            if it > 3 && it < 13 && label.backgroundColor == UIColor.cyanColor()
            {
                total += Int(label.text!)!
            }
            if it > 12 && label.backgroundColor == UIColor.cyanColor()
            {
                total *= 10
                total += Int(label.text!)!
            }
            it++
        }
        if labelsArray[0].backgroundColor == UIColor.cyanColor()
        {
            if add
            {
                let finTotal = Int(p1Life.text!)! + total
                p1Life.text = "\(finTotal)"
            }
            else
            {
                let finTotal = Int(p1Life.text!)! - total
                p1Life.text = "\(finTotal)"
            }
        }
        if labelsArray[1].backgroundColor == UIColor.cyanColor()
        {
            if add
            {
                let finTotal = Int(p2Life.text!)! + total
                p2Life.text = "\(finTotal)"
            }
            else
            {
                let finTotal = Int(p2Life.text!)! - total
                p2Life.text = "\(finTotal)"
            }
        }
        for label in labelsArray
        {
            label.backgroundColor = UIColor.whiteColor()
        }
    }
    @IBAction func reset(sender: UIButton) //Resets all of the labels and the life
    {
        p1Life.text = "20"
        p2Life.text = "20"
        for label in labelsArray
        {
            label.backgroundColor = UIColor.whiteColor()
        }
    }
}
