//
//  SwiftArmyKnifeTests.swift
//  SwiftArmyKnifeTests
//
//  Created by Zachary Buffington on 2/26/22.
//

import XCTest
@testable import SwiftArmyKnife

class JournalModelTest: XCTestCase {
    func testCreateEntry() {
        // Setup
        let model = JournalModel()
        
        // Verify the initial state
        XCTAssertTrue(model.entries.isEmpty)
        
        // Perform the test
        model.createEntry(title: "create", contents: "")
        
        // Verify final state
        XCTAssertEqual(model.entries.first?.title, "create")
    }
    func testUpdateEntry() {
        // Setup
        let model = JournalModel()
        model.createEntry(title: "", contents: "")
        let entry = model.entries.first!
        
        // Verify the initial state
        XCTAssertEqual(entry.title, "")
        XCTAssertEqual(entry.contents, "")
        
        
        //perfomr test
        model.update(entry: entry, title: "update" , contents: "update contents")
        
        // Veryify inital state
        XCTAssertEqual(entry.title, "update")
        XCTAssertEqual(entry.contents, "update contents")
    }
    func testDeleteEntry() {
        let model =  JournalModel()
        model.createEntry(title: "", contents: "")
        
        XCTAssertEqual(model.entries.count, 1)
        
        let indexSet = IndexSet(integer: 0)
        model.delete(indexSet: indexSet)
        
        XCTAssertEqual(model.entries.count, 0)
        
    }
}
