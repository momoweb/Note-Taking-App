//
//  Data.swift
//  Plain Ol Notes New
//
//  Created by Yee Wong on 22/09/2014.
//  Copyright (c) 2014 Yee Wong. All rights reserved.
//

import Foundation

let K_DEFAULT_TEXT = "New Note"
let K_ALL_NOTES = "note"
let K_DETAIL_VIEW = "showDetail"

class Data {
    
    // use nested structure as a work around for the restriction that class can only have computed property.
    struct Storage {
        private static var model: [String : String]?
        private static var key = ""
    }
    
    // MARK: computed properties
    class var allNotes: [String : String] {
        // if the model is empty, try to load one from User Defaults, if UD returns nil because it doesn't contain any saved dictionary. initialise an empty dictionary and set it to model
        get {
            if Storage.model == nil {
                if let ud = (NSUserDefaults.standardUserDefaults()).dictionaryForKey(K_ALL_NOTES) {
                    Storage.model = (ud as [String : String])
                } else {
                    Storage.model = [String : String]()
                }
            }
        return Storage.model!
        }
        set {
            Storage.model = newValue
        }
    }
    
    class var currentKey: String {
        get {
            return Storage.key
        }
        set {
            Storage.key = newValue
        }
    }
    
    // MARK: Class Methods
    
    class func getAllNotes() -> [String : String] {
        return self.allNotes
    }
    
    class func setCurrentKey(key: String) {
        currentKey = key
    }
    
    class func getCurrentKey() -> String {
        return currentKey
    }
    
    class func setNoteForCurrentKey(note: String) {
        self.setNote(note: note, forKey: currentKey)
    }
    
    class func setNote(#note: String, forKey key: String) {
        self.allNotes[key] = note
    }
    
    class func removeNoteForKey(key: String) {
        self.allNotes.removeValueForKey(key)
    }
    
    class func saveNotes() {
        let ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        ud.setObject(self.allNotes, forKey: K_ALL_NOTES)
    }
    
    // MARK: Test only methods
    // method to help with tests
    class func getNoteForKey(key: String) -> String? {
        return self.allNotes[key]
    }
}