//
//  DetailViewController.swift
//  Plain Ol Notes New
//
//  Created by Yee Wong on 22/09/2014.
//  Copyright (c) 2014 Yee Wong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var tView: UITextView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            //called when there is a note already and the user clicks on it (calls prepareForSegue). We need to setup the currentKey here otherwise Data.getCurrentKey will fail at configureView()
            Data.setCurrentKey(detailItem as String)
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        let allNotes: [String : String] = Data.getAllNotes()
        let currentKey: String = Data.getCurrentKey()
        let currentNote: String = allNotes[currentKey]!
        if self.tView != nil {
            // check if the note text has changed(from K_DEFAULT_TEXT), if not change, set it to blank
            if currentNote !=  K_DEFAULT_TEXT {
                self.tView.text = currentNote
            } else {
                self.tView.text = ""
            }
            self.tView.becomeFirstResponder()
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        // save the note if the text is not blank, otherwise delete the note from allNotes dictionary
        if self.tView.text != "" {
            Data.setNoteForCurrentKey(self.tView.text)
        } else {
            Data.removeNoteForKey(Data.getCurrentKey())
        }
        Data.saveNotes()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

