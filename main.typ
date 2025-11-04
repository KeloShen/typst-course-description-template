#import "template.typ": template, course

#show: template.with(
  university: "Xidian University",
  major: "Software Engineering",
  school: "School of Computer Science and Technology",
  name: "Your Name",
  id: "Your Student ID",
  // The cover image settings
  cover: (
    logo_path: "XDU_Logo/logo_xdu_badge_with_name2.png",
    logo_width: 60%,
    logo_with_university_name: true,
  ),
  // The watermark image settings as the background of the document
  watermark: (
    img_path: "XDU_Logo/logo_xdu_badge_translucent.png",
    img_width: 160mm,
  ),
)

= Semester 1

#course(
  name: [Course Name 1],
  id: [Course ID 1],
  semester: [Semester 1],
  credit: [Credit 1],
  prerequisite: [prerequisite 1],
  description: [
    The main body of Course Description 1 \
    #lorem(100)
  ],
  references: [

  ]
)

#course(
  name: [Course Name 2],
  id: [Course ID 2],
  semester: [Semester 1],
  credit: [Credit 2],
  prerequisite: [prerequisite 1],
  description: [
    The main body of Course Description 2 \
    #lorem(100)
  ],
)

= Semester 2

#course(
  name: [Course Name 3],
  id: [Course ID 3],
  semester: [Semester 2],
  credit: [Credit 3],
  prerequisite: [prerequisite 1],
  description: [
    The main body of Course Description 3 \
    #lorem(100)
  ],
)
