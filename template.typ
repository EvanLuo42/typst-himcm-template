#import "@preview/rubber-article:0.5.0": *

#let project(title: "", abstract: [], team-number: "", problem-chosen: "", year: "", body) = {
	// Set the document's basic properties
	set document(title: title)
	
	// Set font to Libertinus Serif
	set text(font: "Libertinus Serif", size: 12pt, lang: "en")
	
	// Apply rubber-article template with custom settings
	show: article.with(
		lang: "en",
		page-margins: (left: 20mm, right: 20mm, top: 20mm, bottom: 15mm),
		heading-numbering: "1.",
		header-display: false,	// Disable default header, we'll use custom HiMCM header
		page-numbering: "1 of 1",  // Use rubber-article's page numbering format
	)
	
	// Custom HiMCM Summary Sheet title page
	set page(margin: (left: 20mm, right: 20mm, top: 10mm, bottom: 20mm), header: none)
	
	// Team Information
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

	// Title
	align(center)[
		#block(text(weight: 700, 1.75em, title), below: 20pt, above: 20pt)
	]
	
	// Abstract - match body text size
	set text(size: 12pt)
	set par(justify: true)
	abstract

	pagebreak()

	// Table of contents
	set text(size: 13pt)
	outline(indent: auto)

	// Reset page counter for main content
	counter(page).update(0)
	
	// Custom header for HiMCM format showing team number and page count
	set page(
		margin: (left: 20mm, right: 20mm, top: 20mm, bottom: 15mm),
		header: context box(stroke: (bottom: 1pt), inset: 5pt)[
			Team \##team-number
			#h(1fr)
			Page #counter(page).display("1 of 1", both: true)
		],
		header-ascent: 20%,
	)
	
	body
}
