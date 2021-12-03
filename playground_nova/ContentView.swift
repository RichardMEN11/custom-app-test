//
//  ContentView.swift
//  playground_nova
//
//  Created by Richard Menning on 03.12.21.
//

import SwiftUI


struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        GeometryReader {
            geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .wiki:
                    VStack {
                        Text("Wiki")
                    }
                case .leifaden:
                    Text("Leitfaden")
                case .search:
                    Text("Search")
                case .favorites:
                    Text("Favoriten")
                case .settings:
                    Text("Einstellungen")
                }
                Spacer()
                HStack {
                        
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .wiki, width: geometry.size.width/12, height: geometry.size.height/42, iconName: "praxis", tabName: "Wiki")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .leifaden, width: geometry.size.width/12, height: geometry.size.height/42, iconName: "leitfaden", tabName: "Leitfaden")
                    ZStack {
                        Circle()
                            .foregroundColor(Color("light_primary_green"))
                            .frame(width: 60, height: 60)
                        VStack {
                            Image("search")
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(width: 17.5, height: 17.5)
                              .foregroundColor(Color("SecondaryFourth"))
                            Text("Suche")
                                .font(.system(size: 12))
                                .foregroundColor(Color("SecondaryFourth"))
                                .frame(maxWidth: .infinity)
                        }
                        
                    }
                    .offset(y: -25)
                    .frame(maxWidth: 28)
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .favorites, width: geometry.size.width/12, height: geometry.size.height/42, iconName: "heart", tabName: "Favoriten")
                    TabBarIcon(viewRouter: viewRouter,
                               assignedPage: .settings, width: geometry.size.width/12, height: geometry.size.height/42, iconName: "settings", tabName: "Einstellungen")
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height/10)
                .background(Color("SecondaryFourth"))
            }
            .edgesIgnoringSafeArea(.vertical)
            .background(LinearGradient(gradient: Gradient(colors: [Color("gradient_start"), Color("gradient_end")]), startPoint: .top, endPoint: .bottom))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    
    let assignedPage: Page
    let width, height: CGFloat
    let iconName, tabName: String
    
    var body: some View {
        VStack {
            Image(iconName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .foregroundColor(viewRouter.currentPage == assignedPage ? Color("light_primary_green"): Color("light_primary_green_inactive"))
                .padding(.top, 10)
            Text(tabName)
                .font(.system(size: 12))
                .foregroundColor(viewRouter.currentPage == assignedPage ? Color("light_primary_green"): Color("light_secondary_white"))
                .frame(maxWidth: width*2.5)
        }
        .padding(.horizontal, -4)
        .onTapGesture {
                         viewRouter.currentPage = assignedPage
                     }
    }
}
