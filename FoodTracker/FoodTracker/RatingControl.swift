//
//  RatingControl.swift
//  FoodTracker
//
//  Created by xg on 16/1/4.
//  Copyright © 2016年 xg. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    //MARK: Properties
    var rating = 0
        {
        didSet{
            setNeedsLayout()  //the didSet property observer is called immediately after the property’s value is set. Here, you include a call to setNeedsLayout(), which will trigger a layout update every time the rating changes. This ensures that the UI is always showing an accurate representation of the rating property value.
        }
    }
    
    var ratingButtons = [UIButton]()
    
    var spacing = 5
    var stars = 5
    
    
    //MARK: Initialization
    override func layoutSubviews() {
        //Set the buttons' width and height to a square the size of the frame's height
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        //var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            //The enumerate() method returns a collection that contains elements in the ratingButtons array paired with their indexes.
            //buttonFrame.origin.x = CGFloat(index * (44 + 5))
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars{  //The underscore (_) represents a wildcard, which you can use when you don’t need to know which iteration of the loop is currently executing.
            //let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            //button.backgroundColor = UIColor.redColor()
            button.adjustsImageWhenHighlighted = false //make sure that the image doesn’t show an additional highlight during the state change
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            addSubview(button)
            ratingButtons += [button]
            
        }
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton)
    {
        print("Button Pressed 👌")
        rating = ratingButtons.indexOf(button)! + 1 //you can use the force unwrap operator (!) to access the underlying index value
        //rating比被选中button数量多一个
        
        updateButtonSelectionState()
    }
    
    func updateButtonSelectionState()
    {
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        }
    }
    
}
