//
//  WatstesList.swift
//  Waster
//
//  Created by Don Wolfton on 17.01.25.
//

import SwiftUI


struct WatstesList: View {
    var body: some View {
        
        HStack {
//            Button("export"){
//
//            }
            Button("export", action: {
                if showSavedDataAlert() == true {
                    
                }
            })
            .padding(.leading, 30)
            .buttonStyle(.borderedProminent)
            Spacer()
            Text("All wastes")
                .font(.headline)
            Spacer()
            Button("sort"){
                
            }
            .padding(.trailing, 30)
            .buttonStyle(.borderedProminent)
        }
        .padding(.top, 20)
        Spacer()
        WastesTableView()
            .padding(.bottom, 25)
    }
    func showSavedDataAlert() -> Bool {
        if wastesArray.isEmpty {
            let alert = UIAlertController(title: "Nothing to save", message: "Add wastes to save them into Report :)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return false
        } else {
            let allWastesData = JSONManager()
            allWastesData.saveData()
            let alert = UIAlertController(title: "Done", message: "Report is saved to Your Page :)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            return true
        }
    }
}

#Preview {
    WatstesList()
}
