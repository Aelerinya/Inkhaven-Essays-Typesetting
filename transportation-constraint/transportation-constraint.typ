// Transportation as a Constraint - Typst Layout
// 24" × 36" portrait with note-taking space on both sides
// ETBembo font style

#set page(
  width: 24in,
  height: 36in,
  margin: (left: 3.5in, right: 3.5in, top: 0.75in, bottom: 0.75in),
  background: {
    // Background image at top, full width
    place(
      top,
      image("background.jpeg", width: 100%)
    )
    // Vertical gradient fade from image to white
    place(
      top,
      dy: 4in,
      rect(width: 100%, height: 8in, fill: gradient.linear(
        rgb(255, 255, 255, 0%),
        rgb(255, 255, 255, 100%),
        dir: ttb
      ))
    )
    // Left edge fade (only if image doesn't fill width)
    place(
      left + top,
      rect(width: 2in, height: 12in, fill: gradient.linear(
        rgb(255, 255, 255, 100%),
        rgb(255, 255, 255, 0%),
        dir: ltr
      ))
    )
    // Right edge fade (only if image doesn't fill width)
    place(
      right + top,
      rect(width: 2in, height: 12in, fill: gradient.linear(
        rgb(255, 255, 255, 0%),
        rgb(255, 255, 255, 100%),
        dir: ltr
      ))
    )
    // Solid white below gradient
    place(
      top,
      dy: 12in,
      rect(width: 100%, height: 24in, fill: white)
    )
    // Left notes section indicator
    place(
      left + top,
      dx: 0.5in,
      dy: 0.5in,
      text(size: 24pt, fill: rgb("#999999"), font: "ETBembo")[*Notes*]
    )
    // Right notes section indicator
    place(
      right + top,
      dx: -3in,
      dy: 0.5in,
      text(size: 24pt, fill: rgb("#999999"), font: "ETBembo")[*Notes*]
    )
    // Left vertical line separating content from notes
    place(
      left + top,
      dx: 3.25in,
      line(
        start: (0pt, 0in),
        end: (0pt, 35.5in),
        stroke: 1pt + rgb("#cccccc")
      )
    )
    // Right vertical line separating content from notes
    place(
      right + top,
      dx: -3.25in,
      line(
        start: (0pt, 0in),
        end: (0pt, 35.5in),
        stroke: 1pt + rgb("#cccccc")
      )
    )
  }
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
  spacing: 0.7em,
)

// Styling for headings
#show heading.where(level: 1): it => {
  set text(
    font: "ETBembo",
    size: 36pt,
    weight: "regular",
  )
  set align(center)
  block(
    above: 0.3em,
    below: 0.4em,
    it.body
  )
}

#show heading.where(level: 2): it => {
  set text(
    font: "ETBembo",
    size: 16pt,
    weight: "bold",
  )
  block(
    above: 0.8em,
    below: 0.4em,
    it.body
  )
}

// Links - subtle blue color
#show link: it => {
  set text(fill: rgb("#0066cc"))
  it
}

// Push header down into faded area
#v(8.5in)

// Header with title and attribution on semi-transparent background
#place(
  top,
  dy: 8.5in,
  block(
    width: 100%,
    breakable: false,
    fill: rgb(255, 255, 255, 90%),
    inset: (top: 0.6em, bottom: 0.6em, left: 1em, right: 1em),
  )[
    #set align(center)
    #set text(size: 48pt, weight: "regular", font: "ETBembo")
    #block(below: 0.4em)[Transportation as a Constraint]

    #set text(size: 13pt, weight: "regular", style: "italic", fill: rgb("#666666"))
    #block(below: 0.25em)[
      Best of LessWrong 2020
    ]

    #set text(size: 12pt, weight: "regular", style: "italic", fill: rgb("#888888"))
    #block(below: 0.4em)[
      Part of _Gears Which Turn the World_ sequence
    ]

    #set text(size: 16pt, weight: "regular")
    #block(below: 0.2em)[
      johnswentworth
    ]

    #set text(size: 11pt, style: "italic")
    #block(below: 0.4em)[
      5th Apr 2020
    ]

    #line(length: 50%, stroke: 0.5pt + rgb("#666666"))
  ]
)

#v(0.6em)

// Two-column layout for content
#columns(2, gutter: 1.5em)[
  // Include the essay content
  #include "transportation-constraint-content.typ"
]
