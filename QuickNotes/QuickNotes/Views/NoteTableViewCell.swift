//
//  NoteTableViewCell.swift
//  QuickNotes
//
//  Created by Nelson Gonzalez on 1/14/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

protocol NoteTableViewCellDelegate: class {
    func shareNote(for cell: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell {
    
    weak var delegate: NoteTableViewCellDelegate?
    var note: Note? {
        didSet{
            updateViews()
        }
    }
    
    private func updateViews(){
        guard let note = note else {return}
        noteLabel.text = note.text
    }
    
    @IBOutlet weak var noteLabel: UILabel!
    
   

    @IBAction func share(_ sender: UIButton) {
      delegate?.shareNote(for: self)
    }
    
    
}
