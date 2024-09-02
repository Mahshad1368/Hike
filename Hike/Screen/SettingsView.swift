//
//  SttingView.swift
//  Hike
//
//  Created by Mahshad Jafari on 26.08.24.
//

import SwiftUI

struct SettingsView: View {
//MARK: - PROPERTIES
    private let alternateAppIcons: [String] = [ "AppIcon-Map",
                                                "AppIcon-Campfire", "AppIcon-MagnifyingGlass", "AppIcon-Mushroom", "AppIcon-Backpack",
                                                "AppIcon-Camera"]

    var body: some View {
        List {
            Section {
                //MARK: - SECTION: HEADER
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack (spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choise")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ], startPoint: .top,
                        endPoint: .bottom
                    )
                ).padding(.top, 8)
                VStack (spacing: 10) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    
                    Text("The hike which looks gorfeouse in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
     
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }//: HEADER
            
            .listRowSeparator(.hidden)
            
            
            //MARK: - SECTION: ICONS
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 12) {
                        
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                print("Icon \(alternateAppIcons[item]) was pressed.")
                               
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    
                                    if error != nil {
                                        print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                    }else {
                                        print("Success! You have changed the app' s icon to \(alternateAppIcons[item])")
                                    }
                            
                                }
                                
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                                   }
                                   .buttonStyle(.borderless)
                        }
                    }
                }//: SCROLL VIEW
                .padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 16)
            }//: SECTION
            .listRowSeparator(.hidden)
        
            //MARK: - SECTION: ABOUT
            Section (
                header: Text("ABIUT THE APP"),
                footer: HStack {
                    Spacer()
                    
                    Text("Copyright © All right reserved.")
                    
                }
                    .padding(.vertical, 8)
            
            ) {
                //1. Basic Labled Content
        
//                LabeledContent("Application", value: "Hike")
                
                //2. Advanced Labled Content
                CustomListRowView(rowLable: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListRowView(rowLable: "Compatibility", rowIcon: "info.circle", rowContent: "iOS,iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLable: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLable: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLable: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)
                
                CustomListRowView(rowLable: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petters", rowTintColor: .pink)
                
                CustomListRowView(rowLable: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLable: "Credo Academy", rowLinkDestination: "https://credo.academy")
     
                
            }//: SECTION
        }//: LIST
    }
}

#Preview {
    SettingsView()
}
