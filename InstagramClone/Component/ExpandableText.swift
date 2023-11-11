import SwiftUI

struct ExpandableText: View {
    @State private var isExpanded = false
    
    let initialText: String
    let maxLines: Int = 2
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(isExpanded ? initialText : truncatedText)
                .lineLimit(isExpanded ? nil : maxLines)
            
            if !isExpanded  {
                Button(action: {
                    isExpanded.toggle()
                }) {
                    Text("more")
                        .foregroundColor(.gray)
                }
            }
            else{
                Button(action: {
                    isExpanded.toggle()
                }) {
                    Text("more")
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    var truncatedText: String {
        let lines = initialText.split(separator: "\n")
        return lines.prefix(maxLines).joined(separator: "\n")
    }
    
    var needsExpansion: Bool {
        let lines = initialText.split(separator: "\n")
        return lines.count > maxLines
    }
}
