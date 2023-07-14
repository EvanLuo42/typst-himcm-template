#let project(title: "", abstract: [], team-number: "", problem-chosen: "", year: "", body) = {
  // Set the document's basic properties.
  set document(title: title)
  set page(
    margin: (left: 20mm, right: 20mm, top: 10mm, bottom: 20mm),
  )
  
  set text(font: "Times New Roman", lang: "en", size: 12pt)

  set heading(numbering: "1.")

  // Team Infomation
  align(center)[
    #block(text("Team Control Number", size: 11pt))
    #block(text(
      team-number,
      size: 25pt,
      fill: red,
      weight: "bold"
    ))
    #block(text("Problem Chosen", size: 11pt))
    #block(text(
      problem-chosen,
      size: 25pt,
      fill: red,
      weight: "bold"
    ))
    #block(text(
      year,
      size: 15pt,
      weight: "bold"
    ), spacing: 10pt)
    #block(text(
      "HiMCM",
      size: 11pt,
      weight: "bold"
    ), spacing: 10pt)
    #block(text(
      "Summary Sheet",
      size: 11pt,
      weight: "bold"
    ), below: 15pt)
  ]
  
  line(length: 100%, stroke: gray)

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title), below: 20pt, above: 20pt)
  ]
  
  // Main body.
  set par(justify: true)

  abstract

  pagebreak()

  set text(font: "Times New Roman", lang: "en", size: 13pt)

  outline(indent: true)

  let page_counter = counter(page)
  page_counter.update(0)

  set page(
    header: box(stroke: (bottom: 1pt), inset: 5pt)[
      #text("Team #")
      #text(team-number)
      #h(1fr)
      #text("Page")
      #page_counter.display(
        "1 of 1",
        both: true,
      )
    ],
    header-ascent: 20%,
    margin: (left: 20mm, right: 20mm, top: 20mm, bottom: 15mm),
  )
  
  body
}