//
//  NoteViewController.swift
//  QuickNotes
//
//  Created by Nelson Gonzalez on 1/14/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
  let notesController = NoteController()
    
    @IBOutlet weak var textView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        textView.text = nil
       
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let noteText = textView.text, !noteText.isEmpty else {return}
        notesController.createNote(withText: noteText)
        tableView.reloadData()
        textView.text = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NoteDetail" {
            guard let noteDetailVC = segue.destination as? NoteDetailViewController,
            let cell = sender as? NoteTableViewCell else {return}
            
            noteDetailVC.note = cell.note
            
            
        }
    }
    
}

extension NoteViewController: UITableViewDataSource, UITableViewDelegate, NoteTableViewCellDelegate {

    //MARK: - UITableViewDatasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesController.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
        
        guard let noteCell = cell as? NoteTableViewCell else { return cell }
        
        let note = notesController.notes[indexPath.row]
        noteCell.note = note
        noteCell.delegate = self
        return noteCell
    }
    
    func shareNote(for cell: NoteTableViewCell) {
//        print("Shared note was called...\(cell.note)")
        guard let note = cell.note else { return }
        
        let text = note.text
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    
    
    
    
}
