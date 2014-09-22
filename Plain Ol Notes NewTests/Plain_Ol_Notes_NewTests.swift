//
//  Plain_Ol_Notes_NewTests.swift
//  Plain Ol Notes NewTests
//
//  Created by Yee Wong on 22/09/2014.
//  Copyright (c) 2014 Yee Wong. All rights reserved.
//

import UIKit
import XCTest

class Plain_Ol_Notes_NewTests: XCTestCase {
        
        override func setUp() {
            super.setUp()
            // Put setup code here. This method is called before the invocation of each test method in the class.
            
        }
        
        override func tearDown() {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
            super.tearDown()
        }
        
        func testExample() {
            // This is an example of a functional test case.
            XCTAssert(true, "Pass")
        }
        
        func testGetSetCurrentKey() {
            let key = "CurrentKey"
            Data.setCurrentKey(key)
            XCTAssertEqual(Data.getCurrentKey(), key, "returned: \(Data.getCurrentKey())")
        }
        
        func testSetNoteForCurrentKey() {
            var note = "Note for currentKey"
            var currentKey = "New Key"
            Data.setCurrentKey(currentKey)
            Data.setNoteForCurrentKey(note)
            XCTAssertEqual(Data.getNoteForKey(currentKey)!, "Note for currentKey", "returned: \(Data.getNoteForKey(currentKey)!)")
        }
        
        func testSetNoteForKey() {
            let note = "Note_testSetNoteForKey"
            let key = "Key_testSetNoteForKey"
            Data.setNote(note: note, forKey: key)
            XCTAssertEqual(Data.getNoteForKey(key)!, "Note_testSetNoteForKey")
        }
        
        func testRemoveNoteForKey() {
            let note = "Note_to_remove"
            let key = "Key_to_remove"
            Data.setNote(note: note, forKey: key)
            Data.removeNoteForKey(key)
            XCTAssertNil(Data.getNoteForKey(key))
        }
        
        func testRemoveNoteForNonExistentKey() {
            Data.removeNoteForKey("fake_key")
            XCTAssertNil(Data.getNoteForKey("fake_key"))
        }
        
        
        func testPerformanceExample() {
            // This is an example of a performance test case.
            self.measureBlock() {
                // Put the code you want to measure the time of here.
            }
        }
        
}
