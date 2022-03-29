//
// classMarks.swift
//
// created by Ketia Gaelle Kaze
// created on 2022-03-25
// version 1.0
// Copyright (c) 2022 Ketia Gaelle Kaze. All rights reserved.
// The classMark program reads a text file into a list and then converts it into an array then call the function to to generate marks for students.

import Foundation

func generateMarks(arrayStudents: [String], arrayAssignments: [String]) -> [[String]] {

  let assignmentsLen: Int = arrayAssignments.count
  let studentsLen: Int = arrayStudents.count

  var marks = Array(repeating: Array(repeating: "", count: assignmentsLen + 1), count: studentsLen + 1)

  for namesCount in 1..<arrayStudents.count + 1 {
    marks[namesCount][0] = arrayStudents[namesCount - 1]
  }

  // adds marks of the students to the array
  for studentsCount in 1..<arrayAssignments.count + 1 {
    for marksCount in 1..<arrayStudents.count + 1 {
      let random = Int.random(in: 50...100)
      marks[marksCount][studentsCount].append(String(random))
    }
  }
  return marks
}
// main part of the code

// declaring constants
let namesOfStudents = "/home/runner/Unit1-07-Swift/students.txt/"
let assignNum = "/home/runner/Unit1-07-Swift/assignments.txt/"
let text = ""

let studentsFile: String = try String(contentsOfFile: namesOfStudents)
let arrayStudentsFile: [String] = studentsFile.components(separatedBy: "\n")
let assignmentsFile: String = try String(contentsOfFile: assignNum)
let arrayAssignmentsFile: [String] = assignmentsFile.components(separatedBy: "\n")

// function call
var arrayMark: [[String]] = generateMarks(arrayStudents: arrayStudentsFile, arrayAssignments: arrayAssignmentsFile)

// assign marks to the csv file
try text.write(to: URL(fileURLWithPath: "/home/runner/Unit1-07-Swift/marks.csv/"), atomically: false, encoding: .utf8)
if let fileWriter = try? FileHandle(forUpdating: URL(fileURLWithPath: "/home/runner/Unit1-07-Swift/marks.csv")) {
  for array in arrayMark {
    let arrayToString = array.joined(separator: "  ") + "\n"
    fileWriter.seekToEndOfFile()
    fileWriter.write(arrayToString.data(using: .utf8)!)
  }
  fileWriter.closeFile()
}
print("Assigned marks to the csv file.")
