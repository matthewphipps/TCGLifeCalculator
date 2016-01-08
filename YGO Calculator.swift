import UIKit

class YGO_Calculator: UIViewController {
    //All of the labels that are made into buttons
    @IBOutlet var backGroundView: UIView!
    @IBOutlet weak var playerOne: UILabel!
    @IBOutlet weak var p1LP: UILabel!
    @IBOutlet weak var playerTwo: UILabel!
    @IBOutlet weak var p2LP: UILabel!
    @IBOutlet weak var plus: UILabel!
    @IBOutlet weak var minus: UILabel!
    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var three: UILabel!
    @IBOutlet weak var four: UILabel!
    @IBOutlet weak var five: UILabel!
    @IBOutlet weak var six: UILabel!
    @IBOutlet weak var seven: UILabel!
    @IBOutlet weak var eight: UILabel!
    @IBOutlet weak var nine: UILabel!
    @IBOutlet weak var o: UILabel!
    @IBOutlet weak var oo: UILabel!
    @IBOutlet weak var ooo: UILabel!
    
    var labelsArray = [UILabel]()
    var pluss = false
    var minuss = false
    var i = 0
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Array of all the labels
        labelsArray = [playerOne, playerTwo, plus, minus, one, two, three, four, five, six, seven, eight, nine,o, oo, ooo]
    }
    @IBAction func onTapGridLabel(sender: UITapGestureRecognizer)
    {
        var mark = -1
        for label in labelsArray
        {
            if CGRectContainsPoint(label.frame, sender.locationInView(backGroundView))//When an element is tapped on screen
            {
                if(label.backgroundColor != UIColor.redColor())//Changes element back to Red
                {
                    if(label == labelsArray[2] || label == labelsArray[3])
                    {
                        if(label == labelsArray[2])//Makes it so you can only have "+" or "-" selected not both
                        {
                            labelsArray[3].backgroundColor = UIColor.whiteColor()
                        }
                        else
                        {
                            labelsArray[2].backgroundColor = UIColor.whiteColor()
                        }
                    }
                    label.backgroundColor = UIColor.redColor()
                    mark = i
                }
                else
                {
                    label.backgroundColor = UIColor.whiteColor()
                }
            }
            i++
        }
        if(mark != -1)
        {
            if(mark > 3 && mark < 13)
            {
                for var q = 4; q < labelsArray.count && q < 13; q++
                {
                    if(q != mark)
                    {
                        if(labelsArray[q].backgroundColor == UIColor.redColor())
                        {
                            labelsArray[q].backgroundColor = UIColor.whiteColor()
                        }
                    }
                }
            }
            else if(mark > 12)
            {
                for var q = 13; q < labelsArray.count; q++
                {
                    if(q != mark)
                    {
                        if(labelsArray[q].backgroundColor == UIColor.redColor())
                        {
                            labelsArray[q].backgroundColor = UIColor.whiteColor()
                        }
                    }
                }
            }
            
        }
        i = 0
    }
    @IBAction func calculate(sender: UIButton)
    {
        var calculated = false
        let p1 = labelsArray[0].backgroundColor == UIColor.redColor()
        let p2 = labelsArray[1].backgroundColor == UIColor.redColor()
        var nCalc = false
        var num = 0
        var oMark = -1
        var add = false
        var sub = false
        for var i = 4; i < 13; i++
        {
            if(labelsArray[i].backgroundColor == UIColor.redColor())
            {
                num = Int(labelsArray[i].text!)!
                nCalc = true
            }
        }
        if(labelsArray[2].backgroundColor == UIColor.redColor())
        {
            add = true
        }
        else if(labelsArray[3].backgroundColor == UIColor.redColor())
        {
            sub = true
        }
        for var i = 13; i < labelsArray.count; i++
        {
            if(labelsArray[i].backgroundColor == UIColor.redColor())
            {
                oMark = i
            }
        }
        if(oMark == 13)
        {
            num = num * 10
        }
        else if(oMark == 14)
        {
            num = num * 100
        }
        else if(oMark == 15)
        {
            num = num * 1000
        }
        if(nCalc && (add || sub))
        {
            let test = add
            if(p1 && p2)
            {
                lifePoint(num, player: 1, op: test)
                lifePoint(num, player: 2, op: test)
            }
            else if(p1)
            {
                lifePoint(num, player: 1, op: test)
            }
            else
            {
                lifePoint(num, player: 2, op: test)
            }
            calculated = true
        }
        if(calculated)
        {
            for label in labelsArray
            {
                label.backgroundColor = UIColor.whiteColor()
            }
        }
    }
    @IBAction func reset(sender: UIButton) //Resets calculator
    {
        for label in labelsArray
        {
            label.backgroundColor = UIColor.whiteColor()
        }
        p1LP.text = "8000"
        p2LP.text = "8000"
    }
    @IBAction func halve(sender: UIButton) //halves Life Points
    {
        let p1 = labelsArray[0].backgroundColor == UIColor.redColor()
        let p2 = labelsArray[1].backgroundColor == UIColor.redColor()
        var calculated = false
        //Checks what Player is selected
        if(p1)
        {
            let lifePoints = Int(p1LP.text!)! / 2
            p1LP.text = ("\(lifePoints)")
            calculated = true
        }
        if(p2)
        {
            let lifePoints = Int(p2LP.text!)! / 2
            p2LP.text = ("\(lifePoints)")
            calculated = true
        }
        if(calculated)  //If a calculation was made it resets all of the buttons
        {
            
            for label in labelsArray
            {
                label.backgroundColor = UIColor.whiteColor()
            }
        }
        
    }
    //Used to calculate add or subtraction of Life Points
    func lifePoint(num: Int, player: Int, op: Bool)
    {
        if(!op)
        {
        if(player == 1)
        {
          let lifePoints = Int(p1LP.text!)! - num
            p1LP.text = "\(lifePoints)"
        }
        else
        {
            let lifePoints = Int(p2LP.text!)! - num
            p2LP.text = "\(lifePoints)"
        }
        }
        else
        {
            if(player == 1)
            {
                let lifePoints = Int(p1LP.text!)! + num
                p1LP.text = "\(lifePoints)"
            }
            else
            {
                let lifePoints = Int(p2LP.text!)! + num
                p2LP.text = "\(lifePoints)"
            }
        }
    }
    
}
