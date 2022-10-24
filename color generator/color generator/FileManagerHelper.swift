//
//  FileManagerHelper.swift
//  color generator
//
//  Created by Natalia Locatelli Barbosa on 23/10/22.
//

import Foundation

class FileManagerHelper {
    static let shared = FileManagerHelper()
    
    private func documentDirectory() -> String {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                    .userDomainMask,
                                                                    true)
        return documentDirectory[0]
    }
    
    private func append(toPath path: String,
                withPathComponent pathComponent: String) -> String? {
        if var pathURL = URL(string: path) {
            pathURL.appendPathComponent(pathComponent)
            
            return pathURL.absoluteString
        }
        
        return nil
    }
    
    func read(fromDocumentsWithFileName fileName: String) -> String {
        guard let filePath = self.append(toPath: self.documentDirectory(),
                                         withPathComponent: fileName) else {
            return ""
        }
        
        do {
            let savedString = try String(contentsOfFile: filePath)
            
            return savedString
        } catch {
            print("Error reading saved file")
            return ""
        }
    }
    
    func save(text: String,
              withFileName fileName: String) {
        guard let filePath = self.append(toPath: documentDirectory(),
                                         withPathComponent: fileName) else {
            return
        }
        
        do {
            try text.write(toFile: filePath,
                           atomically: true,
                           encoding: .utf8)
        } catch {
            print("Error", error)
            return
        }
        
        print("Save successful")
    }
}
