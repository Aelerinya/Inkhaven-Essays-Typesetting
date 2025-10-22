// Learning By Writing - Typst Layout
// 18" × 24" poster (portrait orientation)
// Based on Sequences style with ETBembo font

#set page(
  width: 18in,
  height: 24in,
  margin: (x: 0.75in, y: 0.75in),
)

#set text(
  font: "ETBembo",
  size: 12.8pt,
  fill: rgb("#1a1a1a"),
  lang: "en",
  hyphenate: true,
)

#set par(
  justify: true,
  leading: 0.65em,
  spacing: 0.72em,
)

// Styling for headings
#show heading.where(level: 1): it => {
  set text(
    font: "ETBembo",
    size: 40pt,
    weight: "regular",
  )
  set align(center)
  block(
    above: 0.4em,
    below: 0.5em,
    it.body
  )
}

#show heading.where(level: 2): it => {
  set text(
    font: "ETBembo",
    size: 18pt,
    weight: "bold",
  )
  block(
    above: 1em,
    below: 0.5em,
    it.body
  )
}

// Links - subtle blue color
#show link: it => {
  set text(fill: rgb("#0066cc"))
  it
}

// Header with title and attribution
#block(
  width: 100%,
  breakable: false,
)[
  #set align(center)
  #set text(size: 42pt, weight: "regular", font: "ETBembo")
  #block(below: 0.45em)[Learning By Writing]

  #set text(size: 15pt, weight: "regular")
  #block(below: 0.35em)[
    Holden Karnofsky
  ]

  #set text(size: 11pt, style: "italic")
  #block(below: 0.9em)[
    February 22, 2022
  ]

  #line(length: 50%, stroke: 0.5pt + rgb("#666666"))
]

#v(0.9em)

// Multi-column layout for readability
#columns(3, gutter: 1.2em)[
  // Include the essay content
  #include "learning-by-writing-content.typ"
]
