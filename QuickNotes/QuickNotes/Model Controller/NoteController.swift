//
//  NoteController.swift
//  QuickNotes
//
//  Created by Nelson Gonzalez on 1/14/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

class NoteController {
    
    //MARK: - properties
    //"get" outside the class but not "set" it outside the class
    private(set) var notes: [Note] = []
    
    func createNote(withText text: String) {
        let note = Note(text: text)
        notes.append(note)
    }
    
   
}
