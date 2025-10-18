// Meditations on Moloch - Typst Layout
// 24" × 36" poster for Lighthaven venue display
// Literary elegant style with serif typography

#set page(
  width: 36in,
  height: 24in,
  margin: (x: 1.5in, y: 1in),
  fill: rgb("#fcfaf7"), // Warm cream paper color
)

#set text(
  font: "Libertinus Serif",
  size: 13pt,
  fill: rgb("#1a1a1a"),
  lang: "en",
  hyphenate: true,
)

#set par(
  justify: true,
  leading: 0.75em,
  spacing: 0.75em,
)

// Styling for headings
#show heading.where(level: 1): it => {
  set text(
    font: "Libertinus Serif",
    size: 32pt,
    weight: "regular",
    style: "normal",
  )
  set align(center)
  block(
    above: 0.5em,
    below: 0.8em,
    it.body
  )
}

// Section numbers (II., III., etc.)
#show strong: it => {
  let body-text = if type(it.body) == content {
    if it.body.has("text") {
      it.body.text
    } else if it.body.has("children") {
      it.body.children.map(c => if type(c) == str { c } else { "" }).join("")
    } else {
      ""
    }
  } else if type(it.body) == str {
    it.body
  } else {
    ""
  }

  if body-text != none and body-text.len() <= 6 and body-text.match(regex("^[IVX]+\\.?$")) != none {
    set text(size: 16pt, weight: "bold")
    block(above: 1.2em, below: 0.6em, it)
  } else {
    text(weight: "bold", it.body)
  }
}

// Blockquotes - for Ginsberg poem
#show quote.where(block: true): it => {
  set text(size: 12pt, style: "italic")
  set par(leading: 0.7em)
  block(
    inset: (left: 2em, right: 2em, top: 0.5em, bottom: 0.5em),
    fill: none,
    stroke: none,
    it.body
  )
}

// Emphasized text
#show emph: it => text(style: "italic", it.body)

// Links - make them visually distinct with blue color
#show link: it => {
  set text(fill: rgb("#0066cc"))
  it
}

// Header with title and attribution (above columns)
#block(
  width: 100%,
  breakable: false,
)[
  #set align(center)
  #set text(size: 72pt, weight: "regular", font: "Libertinus Serif")
  #block(below: 0.4em)[MEDITATIONS ON MOLOCH]

  #set text(size: 18pt, style: "italic", weight: "regular")
  #block(below: 1em)[
    Scott Alexander \
    #text(size: 16pt)[July 30, 2014]
  ]

  #line(length: 60%, stroke: 0.5pt + rgb("#666666"))
]

#v(1em)

// Multi-column layout for better readability
#columns(6, gutter: 1.2em)[
  // Include the essay content
  #include "meditations-on-moloch-content.typ"
]
