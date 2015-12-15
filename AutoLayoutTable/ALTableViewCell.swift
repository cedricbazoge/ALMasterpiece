//
//  ALTableViewCell.swift
//  AutoLayoutTable
//
//  Created by Cedric Bazoge on 12/12/15.
//  Copyright © 2015 TWC. All rights reserved.
//

import UIKit

class ALTableViewCell: UITableViewCell {

    private var _masterpiece : MasterpieceModel?
    var masterpiece : MasterpieceModel? {
        get {
            return _masterpiece
        }
        set {
            if let masterpiece = newValue {
                if _masterpiece != masterpiece {
                    _masterpiece = masterpiece
                    self.loadUI()
                }
            }
        }
    }
    
    
    //Control Outlets
    @IBOutlet var thumbnail  : UIImageView!
    @IBOutlet var author     : UILabel!
    @IBOutlet var title      : UILabel!
    @IBOutlet var createDate : UILabel!
    @IBOutlet var comment    : UILabel!
    
    //Constraint Outlets
    @IBOutlet weak var constraintDescLeading  : NSLayoutConstraint!
    @IBOutlet weak var constraintDescTopSpace : NSLayoutConstraint!
    
    
    override class func requiresConstraintBasedLayout() -> Bool {
        return true
    }
    
    private func loadUI() {
        guard let masterpiece = _masterpiece else {
            return
        }
        
        self.author.text     = "Artist: \(masterpiece.artist ?? "N/A")"
        self.createDate.text = "Created: \(masterpiece.date  ?? "N/A")"
        self.title.text      = masterpiece.title             ?? "N/A"
        self.comment.text    = masterpiece.comment           ?? "N/A"
        self.thumbnail.image = masterpiece.thumbnail
        
        self.updateConstraintsIfNeeded()
    }
}
 