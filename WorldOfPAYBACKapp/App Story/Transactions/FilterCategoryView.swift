//
//  FilterCategoryView.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 25/01/2023.
//

import SwiftUI

enum FilterType: String {
    case none = "All"
    case categoryOne = "Category One"
    case categoryTwo = "Category Two"
}

struct CategoryModel: Hashable {
    let name: String
    var isSelected: Bool = false
}


//MARK: - FilterView
struct FilterCategoryView: View {
    let viewModel: TransactionsViewModel
    @Binding var isSheetPresented: Bool
    @Binding var currentSelectedFilter: String?
    
    var body: some View {
        let categoriesLabels = [CategoryModel(name: FilterType.none.rawValue),
                                CategoryModel(name: FilterType.categoryOne.rawValue),
                                CategoryModel(name: FilterType.categoryTwo.rawValue)]
        
        VStack(spacing: 20.0) {
            List(categoriesLabels, id: \.self) { category in
                CheckBoxView(viewModel: viewModel, categoryModel: category, selectedFilterType: $currentSelectedFilter)
            }
            .frame(height: 200)
            
            Button {
                isSheetPresented = false
                
            } label: {
                Text("Submit")
                    .fontWeight(.bold)
            }
            .frame(width: 150, height: 45)
            .foregroundColor(Color.white)
            .background(Color.secondary)
            .cornerRadius(10.0)
            
            Spacer()
        }
    }
}

struct FilterCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        FilterCategoryView(viewModel: TransactionsViewModel(networkManager: NetworkManager()), isSheetPresented: .constant(false), currentSelectedFilter: .constant(""))
    }
}

//MARK: - CheckBoxView
struct CheckBoxView: View {
    
    let viewModel: TransactionsViewModel
    let categoryModel: CategoryModel
    @Binding var selectedFilterType: String?
    
    var body: some View {
        HStack{
            if categoryModel.name == selectedFilterType {
                Image(systemName: "checkmark.square.fill")
                    .foregroundColor(Color(UIColor.systemBlue))
            } else {
                Image(systemName: "square")
                    .foregroundColor(Color.secondary)
            }
            
            
            Text(categoryModel.name)
                .font(.title2)
        }
        .onTapGesture {
            if categoryModel.name == selectedFilterType {
                selectedFilterType = nil
            } else {
                selectedFilterType = categoryModel.name
            }
            
            if selectedFilterType == FilterType.categoryOne.rawValue {
                viewModel.updateFilter(to: .categoryOne)
            } else if selectedFilterType == FilterType.categoryTwo.rawValue {
                viewModel.updateFilter(to: .categoryTwo)
            } else {
                viewModel.updateFilter(to: .none)
            }
        }
        
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(viewModel: TransactionsViewModel(networkManager: NetworkManager()), categoryModel: CategoryModel(name: "Category One"), selectedFilterType: .constant("mm"))
    }
}
