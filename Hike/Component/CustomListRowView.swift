//
//  CustomListRowView.swift
//  Hike
//
//  Created by Mahshad Jafari on 26.08.24.
//

import SwiftUI

struct CustomListRowView: View {
    
    //MARK: - PROPERTIES
    @State var rowLable: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLable: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    var body: some View {
        LabeledContent {
            //Content
            
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
            
            } else if (rowLinkLable != nil  && rowLinkDestination != nil) {
                Link(rowLinkLable!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            }
            else {
                EmptyView()
            }
            
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                
                Text(rowLable)
            }
        }

    }
}

#Preview {
    List {
        CustomListRowView(
            rowLable: "Website",
            rowIcon: "globe",
            rowContent: nil ,
            rowTintColor: .pink,
            rowLinkLable:"Credo Academy",
            rowLinkDestination: "https://credo.academy"
        )
    }
}
