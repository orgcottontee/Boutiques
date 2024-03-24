//
//  TabBarView.swift
//  Boutiques
//
//  Created by adobada on 3/23/24.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selected: TabIcon
    
    var body: some View {
        HStack {
            ForEach(TabIcon.allCases, id: \.rawValue) { tab in
                Spacer()
                Button {
                    selected = tab
                } label: {
                    Image(systemName: selected == tab ? tab.selected : tab.unselected)
                        .frame(width: 60, height: 40)
                        .scaleEffect(selected == tab ? 1.50 : 1.0)
                        .foregroundColor(selected == tab ? .accentColor : .gray)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.2)) {
                                selected = tab
                            }
                        }
                }
                Spacer()
            }
        }
    }
}

//#Preview {
//    TabBarView()
//}
