#let template(
  university: none,
  major: none,
  school: none,
  name: none,
  id: none,
  cover: none,
  watermark: none,
  doc,
) = {
  // Cover
  page()[
    #align(center)[
      #image(cover.logo_path, width: cover.logo_width)
      #if not cover.logo_with_university_name {
        text(weight: "semibold", size: 24pt)[#university]
        v(1fr)
      }
      #text(weight: "bold", size: 30pt, "Course Description")
      #v(1fr)
      #text(weight: "semibold", size: 16pt)[#major]
      #parbreak()
      #text(weight: "semibold", size: 18pt)[#school]
    ]
    #v(3fr)
    #set text(weight: "medium", size: 14pt)
    Name: #name #parbreak()
    Student No. #id #parbreak()
  ]

  // Page settings
  set page(
    margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
    header: [
      Course Description - #name
      #h(1fr)
      #university
    ],
    footer: context [
      #counter(page).display("1 / 1", both: true)
      #h(1fr)
      #v(0.2em)
      #align(center)[
        #text(style: "italic", size: 9pt)[
          South Campus, Xidian University, Chang'an District, Xi'an, Shaanxi Province 710126, China \
          Tel: +86 29 81891018 | Admin Email: scst[at]xidian.edu.cn
        ]
      ]
      #v(0.2em)
      #align(center)[
        #datetime.today().display()
      ]
    ],
    background: image(
      watermark.img_path,
      width: watermark.img_width,
    )
  )

  // Table of contents
  page(footer: [
    #h(1fr)
    #v(0.3em)
    #align(center)[
      #text(style: "italic", size: 9pt)[
        South Campus, Xidian University, Chang'an District, Xi'an, Shaanxi Province 710126, China \
        Tel: +86 29 81891018 \
        Admin Email: scst[at]xidian.edu.cn
      ]
    ]
    #v(0.3em)
    #align(center)[
      #datetime.today().display()
    ]
  ])[
    #outline(
      title: "Table of Contents",
      indent: 2em,
    )
  ]

  // Information page
  page(footer: [
    #h(1fr)
    #v(0.3em)
    #align(center)[
      #text(style: "italic", size: 9pt)[
        South Campus, Xidian University, Chang'an District, Xi'an, Shaanxi Province 710126, China \
        Tel: +86 29 81891018 \
        Admin Email: scst[at]xidian.edu.cn
      ]
    ]
    #v(0.3em)
    #align(center)[
      #datetime.today().display()
    ]
  ])[
    #align(center)[
      #text(weight: "bold", size: 20pt)[Information]
      #v(1em)
    ]
    #set par(justify: true)
    #set text(size: 11pt)
    
    #heading(depth: 1, numbering: none)[Data Source]
    
    All course descriptions and information are based on the official data from Xidian University's "Talent Training Program and Course Outline Publicity Platform" (人才培养方案及课程大纲公示平台). The platform can be accessed at: #link("https://pyfa.xidian.edu.cn/xdrp/#/admin/trainingProgramPublicity?schoolNum=10701")
    
    #v(1em)
    
    #heading(depth: 1, numbering: none)[ECTS Conversion]
    
    According to the European Credit Transfer and Accumulation System (ECTS) Users' Guide (#link("https://op.europa.eu/en/publication-detail/-/publication/da7467e6-8450-11e5-b8b7-01aa75ed71a1")), undergraduate students need to obtain 60 ECTS per academic year.
    
    According to the graduation requirements for the Software Engineering major at Xidian University (#link("https://pyfa.xidian.edu.cn//NEW_RES/V3/pdfPathFile/10701/2022年软件工程专业人才培养方案.pdf")), students need to complete a total of 178.5 credits over four years to graduate. Therefore, on average, students need to obtain 178.5 ÷ 4 = 44.625 credits per year.
    
    Since 44.625 credits ≈ 60 ECTS, we can conclude that: *1 credit ≈ 1.34 ECTS*.
  ]

  // Main body
  counter(page).update(1)
  set par(justify: true)
  set heading(numbering: "1.1.")
  doc
}

#let course(
  name: none,
  id: none,
  semester: none,
  credit: none,
  hours: none,
  grade: none,
  preparatory: none,
  prerequisite: none,
  content: none,
  description: none,
  assessment: none,
  references: none,
) = {
  heading(depth: 2)[#name]
  let cells = (
    ([*Course Title*], name),
    ([*Course No.*], id),
    ([*Semester*], semester),
    ([*Credit*], credit),
    ([*Course Hours*], hours),
    ([*My Grade*], grade),
    ([*Preparatory Course(s)*], preparatory),
    ([*Prerequisite(s)*], prerequisite),
    ([*Content*], content),
    ([*Course Description*], description),
    ([*Assessment*], assessment),
    ([*References*], references),
  )
  let table_args = ()
  for row in cells {
    if row.at(1) != none {
      table_args.push(row.at(0))
      table_args.push(row.at(1))
    }
  }
  table(
    columns: (auto, 1fr),
    ..table_args,
  )
}
