// Pyramid of Scientific Evidence - CeTZ Drawing
// Vector graphic version for high-quality rendering

#import "@preview/cetz:0.4.2"

#let pyramid() = {
  cetz.canvas({
    import cetz.draw: *

    // Define colors matching the original pyramid (gradient from dark red to pink)
    let colors = (
      rgb("#8B1A1A"), // Dark red - top
      rgb("#C41E3A"), // Red
      rgb("#E6B800"), // Yellow/gold
      rgb("#FFD700"), // Bright yellow
      rgb("#90EE90"), // Light green
      rgb("#87CEEB"), // Sky blue
      rgb("#DDA0DD"), // Plum/light purple
      rgb("#BF8EB1"), // Plum/light purple
    )

    // Pyramid dimensions (scaled to match original)
    let base = 6.0
    let top = 0.0  // Point at top
    let h = 4.5
    let step = h / 8.0

    // Draw pyramid layers from bottom to top (6 levels with labels inside pyramid)
    // Each entry: (label, text-size)
    let levels = (
      ([Personal Opinion], 10pt),
      ([Expert Opinion], 10pt),
      ([Case Reports], 9pt),
      ([Case Series], 9pt),
      ([Case Control Studies], 7pt),
      ([Cohort Studies], 7pt),
    )

    for i in range(8) {
      let y1 = i * step
      let y2 = (i + 1) * step

      let w1 = base - (base - top) * i / 8.0
      let w2 = base - (base - top) * (i + 1) / 8.0

      let x1left = 0.0 - w1 / 2.0
      let x1right = w1 / 2.0
      let x2left = 0.0 - w2 / 2.0
      let x2right = w2 / 2.0

      // Draw trapezoid layer
      line(
        (x1left, y1),
        (x1right, y1),
        (x2right, y2),
        (x2left, y2),
        close: true,
        fill: colors.at(7 - i),
        stroke: (paint: rgb("#333333"), thickness: 0.5pt)
      )

      // Add text label (only for bottom 6 levels - skip top 2)
      if i < 6 {
        let ymid = y1 + step / 2.0
        let level-data = levels.at(i)
        let label = level-data.at(0)
        let text-size = level-data.at(1)

        content(
          (0, ymid),
          text(
            size: text-size,
            weight: "bold",
            fill: rgb("#0033cc"),
            align(center, label)
          )
        )
      }
    }

    // Add arrow and label for "Randomized Controlled Double Blind Studies" on LEFT
    let rct_level_y = 6 * step - 0.4  // Level 7 (RCT level - second from top)
    line(
      (-1.1, rct_level_y + 0.75),
      (-0.4, 6.5 * step),
      mark: (end: ">", fill: rgb("#000000")),
      stroke: (paint: rgb("#000000"), thickness: 2pt)
    )
    content(
      (-1, rct_level_y + 0.5),
      text(
        size: 7pt,
        weight: "bold",
        fill: rgb("#0033cc"),
        align(center)[Randomized\ Controlled Double\ Blind Studies]
      ),
      anchor: "east"
    )

    // Add arrow and label for "Systematic Reviews and Meta-analyses" on RIGHT
    let meta_level_y = 7 * step +0.3  // Top level
    line(
      (0.9, meta_level_y),
      (0.09, 7.5 * step -0.1),
      mark: (end: ">", fill: rgb("#000000")),
      stroke: (paint: rgb("#000000"), thickness: 2pt)
    )
    content(
      (1, meta_level_y ),
      text(
        size: 8pt,
        weight: "bold",
        fill: rgb("#0033cc"),
        align(center)[Systematic Reviews\ and Meta-analyses]
      ),
      anchor: "west"
    )
  })
}
