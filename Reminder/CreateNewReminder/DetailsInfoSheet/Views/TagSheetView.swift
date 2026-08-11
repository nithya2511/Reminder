//
//  TagSheetView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 06.08.26.
//

import SwiftUI

struct TagSheetView : View {
    @Binding var tagText : String
    @Binding var tags : [String]
    @Binding var selectedTags : Set<String>
    let onAddTag : () -> Void
    let onToggleTag : (String) -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                if (!tags.isEmpty) {
                WrapLayout(spacing: 8, lineSpacing : 8) {
                    ForEach (tags , id:\.self) { tag in
                        Button{
                            onToggleTag(tag)
                        } label: {
                            Text("#\(tag)")
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background{
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(selectedTags.contains(tag) ? .blue : .gray)
                                }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity,  alignment:  .leading)
                .background {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(.white)
                }
            }
                
                TextField("Add New Tag... ", text: $tagText)
                    .font(.system(size: 18))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.white)
                    }
                    .submitLabel(.done)
                    .onSubmit {
                        onAddTag()
                    }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        dismiss()
                    } label: {
                            Image(systemName: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
              
            }
            .padding()
            .appBackground()
            
        }
        
    }
}


#Preview {
    @Previewable @State var tagText = ""
    @Previewable @State var tags: [String] = ["Home", "Work"]
    @Previewable @State var selectedTags: Set<String> = ["Home"]
    TagSheetView(
        tagText: $tagText,
        tags: $tags,
        selectedTags: $selectedTags,
        onAddTag: {
            let trimmedTag = tagText.trimmingCharacters(in: .whitespacesAndNewlines)

            guard !trimmedTag.isEmpty else {
                return
            }

            tags.append(trimmedTag)
            tagText = ""
        },
        onToggleTag: {
            tag in
                          if selectedTags.contains(tag) {
                              selectedTags.remove(tag)
                          } else {
                              selectedTags.insert(tag)
                          }

        }
    )
}
