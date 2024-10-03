#set page(numbering: "1", number-align: center)
#counter(page).update(9)
// #pagebreak()

// Set rules for content
#set math.equation(numbering: num => "(" + (str(counter(heading).get().at(0)) + "." + str(num)) + ")")
#set figure(numbering: num => str(counter(heading).get().at(0)) + "." + str(num))
#let heading_supplement(item) = {
  // [#item.fields()]
  if item.depth == 1 {
    [Chapter]
  } else if item.depth == 2 {
    [Section]
  } else if item.depth == 3 {
    [Subsection]
  } else {
    []
  }
}
#set heading(numbering: "1.1.1", supplement: heading_supplement)
// #set par(first-line-indent: )

#show figure.where(
  kind: table
): set figure.caption(position: top)


// Heading styles
#show heading.where(level: 1): it => {
  if counter(heading).get().at(0) != 1 {
    pagebreak()
  }
  counter(math.equation).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(figure.where(kind: raw)).update(0)

  set par(leading: 0em)
  set text(size: 14pt, weight: "bold")
  align(center)[
    #text(size: 14pt, weight: "bold", "CHAPTER " + upper([#counter(heading).get().at(0)])) \ \
    #v(-24pt)
    #upper(it.body)
  ]

  v(36pt)
}
#show heading.where(level: 2): it => {
  set text(size: 12pt, weight: "bold")
  upper(it)
  v(6pt)
}

#show heading.where(level: 3): it => {
  set text(size: 12pt, weight: "bold")
  it
  v(6pt)
}

= Introduction <intro>
This is the introduction to our document. We will explore various topics and demonstrate the use of headings, figures, tables, and references.

== Background <background>
Here we provide some background information on our topic.

=== Historical Context <history>
This section delves into the historical context of our subject matter.

= Methodology <methodology>
In this section, we discuss the methodology used in our study.
