// Tom Wells - 2 page CV. Build with `npm run cv`, iterate with `npm run cv:watch`.
// The long-form narrative lives at tomwells.org/cv; this is the dense summary.

#import "style.typ": *
#show: cv

#let gh = json("assets/contributions.json")

#header(
  "Tom Wells",
  "Co-founder & Chief Technology Officer, Synthesis Software Technologies",
  photo: "assets/its_me.jpeg",
  contacts: (
    link("mailto:tom@tomwells.org")[tom\@tomwells.org],
    link("https://tomwells.org")[tomwells.org],
    link("https://www.linkedin.com/in/tomwells80/")[linkedin.com/in/tomwells80],
    link("https://github.com/drshade")[github.com/drshade],
  ),
  location: "Amsterdam, The Netherlands",
)

#section("TL;DR")

Technical co-founder and Chief Technology Officer of #link("https://synthesis.co.za")[Synthesis], which today employs over 350 engineers, data scientists and other technical people. A lead-from-the-front CTO: still very active in software engineering, with a passion for functional programming, and especially now in the age of AI and agentic software engineering.

A well rounded technologist, effective at bridging the development and business worlds, who solves problems rapidly by drawing on 25 years of experience building hyper-scale, distributed, realtime and data-driven platforms. I spend my life researching and applying new ideas, which very often translate into revenue generating work; I am attracted to projects with large amounts of "unknown", and steer every engagement back to end-user value.

#section("Experience")

#entry("2005 – present", "Co-founder & Chief Technology Officer", org: "Synthesis Software Technologies")[
  #set list(marker: text(fill: muted)[•], indent: 0pt, body-indent: 5pt, spacing: 4pt)
  - Grew the team from 5 to over 350 engineers, data scientists and specialists over the course of my role, creating the specialist practices in information security, cloud and data along the way.
  - Approximately ZAR 450 million (EUR 25 million) revenue in 2026.
  - First AWS partner in Africa, and still Africa's largest AWS Premier partner; a practice I built and lead.
  - Opened and launched the Amsterdam office in 2021, targeting European expansion.
  - Synthesis was acquired by Araxi Group in 2017.
]

#entry("2001 – 2004", "Senior Software Developer", org: "African Defence Systems, Midrand")[
  Military grade software under MIL-STD-498. A new Fire Control System for the Ground-based Command and Control department (Artillery); previously surface-to-surface and surface-to-air missile systems for the Naval Simulation department on the South African Navy Patrol Corvette project.
]

#section("Agentic software engineering")

I build software with teams of AI agents, and the tooling and process that make that work: several agent harnesses run in parallel across workspaces, collaborating with each other and with me. I prove the approach first-hand, then scale it out to the technical leads across the organisation.

#strength("Orchestration")[
  A custom developed desktop plus a set of hand-written components (a Rust runtime and bar plugins) that give every agent a shared attention queue (the _Deck_: questions, review requests and completion reports for triage) and a human-wired message plane (the _Switchboard_) over which linked agents hand off work and coordinate. #link("https://github.com/drshade/battlestation")[github.com/drshade/battlestation]
]
#v(4pt)
#strength("Process")[
  A tried-and-tested SDLC process for agents and humans to follow: ADRs record decided architecture as desired state, draft PRs carry each change with its verification evidence, and independent review is the merge gate. An ADR viewer replays every architectural decision against the commits that realised it, scoring plan-versus-build _convergence_ as the codebase evolves, and a multi-agent pass scores each ADR's specification gaps. #link("https://drshade.github.io/kyyn-v2/")[drshade.github.io/kyyn-v2]
]
#v(4pt)
#strength("Knowledge")[
  An approach to capturing knowledge as facts under typed schemas, with validation, tools and recipes that evolve together through reviewable Git proposals. Knowledge work by agents and humans becomes repeatable and consistent, and the approach applies across many parts of an organisation.
]
#v(4pt)
#strength("Throughput")[
  #thousands(calc.floor(gh.total / 100) * 100)+ GitHub contributions in the past twelve months across public and private repositories, including four actively maintained open source libraries and contributions to many, many more.
  #v(5pt)
  #contributions(gh)
]

#section("Technical strengths")

#strength("Generative AI & agents")[
  Since 2020, deep in generative AI and engineering for an agentic future: typed agentic workflows, MCP tooling, multi-agent orchestration and calibrated model judgements, as my open source work shows.
]
#v(4pt)
#strength("Realtime & streaming")[
  2017 – 2020: event-streaming architectures on Kafka, Flink and Spark Streaming. Coined _Inference Oriented Architecture_ and _Temporal Programming_ for realtime inference over unbounded event logs.
]
#v(4pt)
#strength("Hyper-scale cloud")[
  Public cloud and Kubernetes expert since 2015: operators, CRDs and platform extensions; deep debugging inside the k8s code base; multi-region, multi-cloud infrastructure.
]
#v(4pt)
#strength("Functional programming")[
  Total-functional, highly productive programmer: Haskell, PureScript, Rust, Scala, F\#, Elm; also fluent in C\#, Java, JavaScript, Go, Python and C. Shipped F\# to production in 2009; teach PureScript on YouTube.
]
#v(4pt)
#strength("Security & payments")[
  Cryptography, EMV and contactless, hardware security modules (Thales nShield CodeSafe), PCI DSS, secure and compliant application design.
]

#section("Notable projects")

#entry("ASML", "Core configuration management, 2025")[
  Rebuilt ASML's core configuration management system, which captures and tracks configuration from sale through design and blueprint to factory and build. A hugely complex operation: a 14-month deep dive unpacking the full process while rebuilding it in flight, with the business continuing to run. #link("https://www.asml.com")[asml.com]
]
#entry("Dynata", "Generative survey programming, 2020")[
  Programmatic survey generation for large retailers from textual client specifications, for the market research company, on GPT-2 and then GPT-3 with early access from OpenAI before its public launch, well before ChatGPT. Hugely successful. #link("https://www.dynata.com")[dynata.com]
]
#entry("HALOdot", "Tap-on-phone payments kernel, 2019")[
  Technical guidance on an L2 certified tap-on-phone kernel shipped as an Android SDK. #link("https://halodot.io")[halodot.io]
]
#entry("GovChat", "National-scale citizen messaging, 2019")[
  Helped the team scale to millions of users during COVID-19: over 200 million messages in two months, helping millions of South Africans apply for the Social Relief of Distress grant. #link("https://govchat.org")[govchat.org]
]
#entry("Nedbank AVO", "Super-app platform architecture, 2018")[
  Consolidated ideas from many vendors into a single logical architecture: micro-services plus realtime streaming, containerised on AWS. #link("https://avo.africa")[avo.africa]
]
#entry("Discovery Vitality", "Global Kubernetes infrastructure, 2018")[
  Re-architected and built a Kubernetes estate spanning 11 data centres across AWS, Azure and VMware colo, hosting the Vitality V1 platform worldwide.
]
#entry("Earlier", "Banking and payments, 2009 – 2014")[
  Afgri internet banking; Investec EMV issuer scripting (F\# on Thales nShield HSMs) and Mauritius online banking, first code to live client in six months; ABSA Zero Knowledge of PIN, securing 1.3 million users.
]

#section("Open source")

#strength("mcp-server")[Build Model Context Protocol servers in Haskell from plain data types: declare tools, prompts and resources as ADTs and the library derives the schemas, decoding and wire protocol. On Hackage. #link("https://github.com/drshade/haskell-mcp-server")[github.com/drshade/haskell-mcp-server]]
#v(3pt)
#strength("agentic")[Typed, composable agentic workflows in Haskell: a flow is a value you can inspect and draw before spending a token, mixing Claude and OpenAI with Jev for calibrated judgements. On Hackage. #link("https://github.com/drshade/haskell-agentic")[github.com/drshade/haskell-agentic]]
#v(3pt)
#strength("linguist")[GitHub's Linguist for Rust: programming language detection by filename, extension, editor modelines and content heuristics, with no setup. #link("https://github.com/drshade/linguist")[github.com/drshade/linguist]]

#section("Side projects")

#strength("kyyn.io")[Workbench and runtime for executable knowledge bases: facts, typed schemas, validation, tools and recipes evolve together via reviewable Git proposals. #link("https://kyyn.io")[kyyn.io] · #link("https://github.com/drshade/kyyn-v2")[github.com/drshade/kyyn-v2]]
#v(3pt)
#strength("Galactica")[Command line tool for integrating GPT-4 into any workflow (this was pre-Claude Code!). #link("https://galacticai.co")[galacticai.co]]

#section("Outside of work")

Husband and father of two daughters. Endurance cyclist and triathlete: two Ironman finishes, Joberg2c (1,000 km), Expedition Africa 2019 (380 km), and always a next event planned.

// Guard: this document is designed to be exactly two pages. Fail the build if it drifts.
// Pass `--input strict=0` to preview an over-long draft while trimming.
#context if sys.inputs.at("strict", default: "1") == "1" {
  assert(
    counter(page).final().first() == 2,
    message: "CV must be exactly 2 pages, got " + str(counter(page).final().first()),
  )
}
