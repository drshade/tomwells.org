// Visual style for the 2-page CV. Echoes tomwells.org: monochrome, IBM Plex,
// one accent lifted from the site's blue->pink ascii-art gradient.

#let accent = rgb(128, 20, 140)
#let ink = rgb(20, 20, 20)
#let muted = rgb(110, 110, 110)
#let rule = rgb(215, 215, 215)
#let gradient-rule = gradient.linear(rgb(0, 20, 140), rgb(255, 20, 140))

#let mono(body, size: 8.5pt, fill: muted, weight: "regular") = text(
  font: "IBM Plex Mono", size: size, fill: fill, weight: weight, body,
)

// Section heading: mono, small caps feel, accent, with a hairline.
#let section(title) = {
  v(3pt)
  block(breakable: false, sticky: true, below: 7pt)[
    #mono(upper(title), size: 8pt, fill: accent, weight: "semibold")
    #v(-5pt)
    #line(length: 100%, stroke: 0.5pt + rule)
  ]
}

// A dated entry: left gutter carries the dates in mono, right carries content.
#let entry(dates, title, org: none, body) = block(breakable: false, below: 10pt)[
  #grid(
    columns: (72pt, 1fr),
    column-gutter: 10pt,
    mono(dates, size: 7.5pt),
    [
      #block(below: 4pt)[
        #text(weight: "semibold", size: 10pt, title)
        #if org != none [#h(6pt) #text(fill: muted, size: 9pt, org)]
      ]
      #body
    ],
  )
]

// Compact labelled row for the strengths grid.
#let strength(label, body) = grid(
  columns: (72pt, 1fr),
  column-gutter: 10pt,
  mono(label, size: 7.5pt, fill: ink, weight: "medium"),
  body,
)

// Inline tag list, mono, separated by middots.
#let tags(..items) = mono(items.pos().join(" · "), size: 7.5pt, fill: ink)

#let cv(body) = {
  set page(
    paper: "a4",
    margin: (x: 17mm, top: 14mm, bottom: 14mm),
    footer: context [
      #set align(center)
      #mono(size: 7pt)[
        tomwells.org/cv
        #h(10pt) · #h(10pt)
        built #datetime.today().display("[year]-[month]-[day]")
        #h(10pt) · #h(10pt)
        page #counter(page).display() of #counter(page).final().first()
      ]
    ],
  )
  set text(font: "IBM Plex Sans", size: 8.8pt, fill: ink)
  set par(justify: false, leading: 0.6em)
  show link: it => box(text(fill: accent, it))
  show heading: it => block(it)
  body
}

#let header(name, title, photo: none, contacts: (), location: none) = {
  grid(
    columns: if photo != none { (1fr, 64pt) } else { (1fr,) },
    column-gutter: 14pt,
    [
      #text(font: "IBM Plex Mono", size: 24pt, weight: "bold", name)
      #v(-4pt)
      #text(size: 11pt, fill: muted, title)
      #v(4pt)
      #mono(size: 7.5pt, fill: ink, contacts.map(box).join(h(8pt) + "·" + h(8pt)))
      #if location != none [
        #v(-6pt)
        #mono(size: 7.5pt, location)
      ]
    ],
    if photo != none {
      box(clip: true, radius: 3pt, image(photo, width: 64pt))
    },
  )
  v(4pt)
  line(length: 100%, stroke: 1.5pt + gradient-rule)
  v(2pt)
}

// GitHub-style contribution calendar (dark theme card), drawn from
// cv/assets/contributions.json (refresh with cv/scripts/fetch-contributions.sh).
#let gh-bg = rgb("#0d1117")
#let gh-border = rgb("#30363d")
#let gh-text = rgb("#8b949e")
#let gh-levels = (rgb("#161b22"), rgb("#0e4429"), rgb("#006d32"), rgb("#26a641"), rgb("#39d353"))

#let thousands(n) = {
  let s = str(n)
  let out = ""
  let i = 0
  for ch in s.rev() {
    if i > 0 and calc.rem(i, 3) == 0 { out = "," + out }
    out = ch + out
    i += 1
  }
  out
}

#let contributions(data) = block(
  width: 100%, fill: gh-bg, stroke: 0.5pt + gh-border, radius: 5pt, inset: (x: 9pt, y: 8pt),
  layout(size => {
    let weeks = data.weeks
    let n = weeks.len()
    let cell = size.width / (n + (n - 1) * 0.25)
    let gap = cell * 0.25
    let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
    let month-of(day) = int(day.date.slice(5, 7))

    // Month labels: one wherever the month changes between consecutive weeks.
    let labels = []
    let prev = month-of(weeks.at(0).at(0))
    for (w, week) in weeks.enumerate() {
      let m = month-of(week.at(0))
      if m != prev and w > 0 and w < n - 2 {
        labels += place(dx: w * (cell + gap), mono(months.at(m - 1), size: 6pt, fill: gh-text))
      }
      prev = m
    }
    block(height: 7.5pt, width: 100%, labels)

    // Day rows: pad the partial first/last weeks so Sunday is always the top row.
    let cells = ()
    for d in range(7) {
      for (w, week) in weeks.enumerate() {
        let pad-top = if w == 0 { 7 - week.len() } else { 0 }
        let idx = d - pad-top
        if idx >= 0 and idx < week.len() {
          cells.push(rect(width: cell, height: cell, radius: 0.6pt, fill: gh-levels.at(week.at(idx).level), stroke: none))
        } else {
          cells.push(box(width: cell, height: cell))
        }
      }
    }
    grid(columns: n, rows: 7, gutter: gap, ..cells)

    v(3pt)
    mono(size: 6.5pt, fill: gh-text)[
      #thousands(data.total) contributions in the last year, as of #data.fetched
      #h(1fr)
      Less
      #h(2pt)
      #gh-levels.map(c => box(rect(width: 5pt, height: 5pt, radius: 0.6pt, fill: c, stroke: none))).join(h(1.5pt))
      #h(2pt)
      More
    ]
  }),
)
