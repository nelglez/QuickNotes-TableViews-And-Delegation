//
//  NoteDetailViewController.swift
//  QuickNotes
//
//  Created by Nelson Gonzalez on 1/14/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    @IBOutlet weak var noteLabel: UILabel!
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let note = note {
            noteLabel.text = note.text
        }
        
    }
    

    

}
