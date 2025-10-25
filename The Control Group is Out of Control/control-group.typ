// The Control Group Is Out Of Control - Typst Layout
// 24" × 36" poster (portrait orientation)
// Clean modern style with ETBembo font

#set page(
  width: 24in,
  height: 36in,
  margin: (x: 0.75in, y: 0.75in),
)

#set text(
  font: "ETBembo",
  size: 12pt,
  fill: rgb("#1a1a1a"),
  lang: "en",
  hyphenate: true,
)

#set par(
  justify: true,
  leading: 0.65em,
  spacing: 1.2em,
)

// Styling for Roman numeral sections (I., II., etc.)
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

  // Check if it's a Roman numeral section marker
  if body-text != none and body-text.len() <= 6 and body-text.match(regex("^[IVX]+\\.?$")) != none {
    set text(size: 15pt, weight: "bold")
    block(above: 1.2em, below: 0.6em, it)
  } else {
    text(weight: "bold", it.body)
  }
}

// Blockquotes
#show quote.where(block: true): it => {
  set text(size: 11pt, style: "italic")
  set par(leading: 0.65em)
  block(
    inset: (left: 1.5em, right: 1.5em, top: 0.5em, bottom: 0.5em),
    fill: none,
    stroke: none,
    it.body
  )
}

// Emphasized text
#show emph: it => text(style: "italic", it.body)

// Links - convert to footnotes using built-in footnote
#show link: it => {
  let url = if type(it.dest) == str {
    it.dest
  } else {
    str(it.dest)
  }

  // Display the link text with a footnote containing the URL
  [#it.body#footnote[#url]]
}

// Reduce spacing for list items
#show enum: it => {
  set par(spacing: 0.8em)
  it
}

// Header with title and attribution
#block(
  width: 100%,
  breakable: false,
)[
  #set align(center)
  #set text(size: 48pt, weight: "regular", font: "ETBembo")
  #block(below: 0.4em)[The Control Group Is Out Of Control]

  #set text(size: 16pt, weight: "regular")
  #block(below: 0.3em)[
    Scott Alexander
  ]

  #set text(size: 12pt, style: "italic")
  #block(below: 0.8em)[
    April 28, 2014
  ]

  #line(length: 50%, stroke: 0.5pt + rgb("#666666"))
]

#v(0.8em)

// Multi-column layout for readability
#columns(4, gutter: 1.2em)[
  // Include the essay content
  #include "control-group-content.typ"
]
