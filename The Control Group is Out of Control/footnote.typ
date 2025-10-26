// Custom footnote system for "The Control Group Is Out Of Control"

// State management for custom footnotes
#let footnote-list = state("footnotes", ())

// Custom footnote function - accepts formatted citation content
#let custom-footnote(citation) = context {
  let count = counter("custom-footnotes").get().at(0) + 1
  counter("custom-footnotes").step()

  footnote-list.update(list => {
    list.push((number: count, citation: citation))
    list
  })

  super[#count]
}
