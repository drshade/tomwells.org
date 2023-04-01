module TomWellsOrg.CV where

import Data.Maybe (Maybe(..))
import TomWellsOrg.Domain (FlowComponent(..))

content ∷ Array FlowComponent
content =
    [ FlowImage { src: "/images/cv/its_me.jpeg", alt: "Its me!", caption: Just "It's me!" }
    , FlowMajorHeader "TL;DR"
    , FlowParagraph "I'm a well rounded technologist who is effective at bridging the development and business worlds. Able to solve problems rapidly by drawing upon my extensive knowledge base of programming languages, frameworks and experience building large hyper-scale, distributed, realtime and data-driven platforms."
    , FlowParagraph "I spend my life researching and applying ideas to projects which allows me to keep immersed in emerging technologies, tools and approaches to solving problems. These very often translate directly into revenue generating activities within my current role as Chief Disruption Officer at Synthesis, where I'm attracted to projects which have large amounts of 'unknown'. In fact, 'unknown' is one of my favourite places to be."
    , FlowParagraph "I am a great communicator, and tend to gravitate towards building strong relationships with key stakeholders in any engagement I work on. I am a proponent of Agile, Lean Startup and ideas like Loonshots and always try to steer stakeholders to focus on the user experience and end-user value on any project."
    , FlowParagraph "I spend a lot of time living in the future. I'm attracted to functional languages, machine learning, quantum computing, temporal programming, extended reality and high-bandwidth user interfaces. I thrive on diving deeply into these things, and being able to articulate their value within the context of a customer domain."

    , FlowMajorHeader "My technical strengths"
    , FlowSection "Realtime, Distributed and Streamed"
    , FlowParagraph "I coined two terms 'Inference Oriented Architecture' and 'Temporal Programming' around 2018 and 2019 respectively."
    , FlowParagraph "Inference Oriented Architecture describes an architecture which is optimised for producing model predictions based on incoming events in as realtime as possible. I had noted that most of the prevalent architectures I had seen in production machine learning systems tended to optimise for model training, rather than on inference. Although this is not a groundbreaking architecture I have found the term to be an effective tool for communicating to stakeholders the value in building for inference rather than training - as this is where the real value lies."
    , FlowParagraph "Temporal Programming is another effective term to describe the function of the modern programmer whose focus is shifting from building solutions which query and manipulate data at rest, to one which needs to extract value from a continuous and unbounded set of events. Architectures which put event streaming at the core (such as those you may find with Kafka, Flink, Spark Streaming, etc) promote an application design which must solve it's requirements through operations run against an unbounded commit log. These structures cannot be queried nor updated and are intrinsicly distributed, and so techniques such as map, reduce, windowing and partitioning which produce results continuously have to be leveraged. I have found these types of problems excellent for teaching functional paradigms."

    , FlowSection "Hyper-scale Distributed Systems"
    , FlowParagraph "I have immersed myself into the public cloud space, and in the process re-taught myself everything I know about distributed systems (and why they are hard). By 2015 I was thoroughly convinced that the future would be wrapped in a fleet of containers and deployed upon an ocean of Kubernetes nodes (back then it was CoreOS or Mesos), and that the basic premise that software must run on an addressable server is now optional. Matching supply to demand is the new software economy, and the industry equaliser. Enterprises that sit back and believe that the size of their infrastructure investment is somehow a barrier to entry are being severely disrupted."
    , FlowParagraph "I'm still pretty passionate about this stuff, use Kubernetes daily and would consider myself an expert in building for this platform. In the past I've written Operators, CRDs and extended Kubernetes to simplify deployment tasks for our general development teams. I've also been deep inside the k8s code base to debug and validate certain behaviour - and so I'd even call myself a golang novice (not my fave language though, ask me why!)."

    , FlowSection "Functional Programming"
    , FlowParagraph "I've been inspired by functional programming forever, and especially the potential to write code which has much fewer bugs, and therefore a lesser testing burden. I have spend hundreds of hours researching FP, starting initially with Scala, then ML, F#, Haskell and more recently discovered Elm & Elixir. I was fortunate enough to get a fair amount of F# into production through 2 projects circa 2009 and their success really reinforced my view that a functional style produces far more stable code bases than an equivalent OO or imperative alternative."
    , FlowParagraph "Today I would describe myself as a total functional, but super productive, programmer. However I am very comfortable working within more OO slanted languages like C#, Java, Golang etc - just don't expect to see a bunch of mutations and null references!"

    , FlowSection "Javascript"
    , FlowParagraph "Javascript displaced Python as my scripting language of choice around 2010. I'm super comfortable with nodejs, ES6, promises and the asynchronous programming paradigm - and find this complimenting my functional style completely. I spent many years with LiveScript (a functional language compiling down to Javascript - it's got an amazing prelude, and really simplies code) - but it seems to have lost it's traction, so I've gravitated back to plain old ES6 for plain old Javascript scripting. Although I might be tempted to use PureScript where possible!"

    , FlowSection "Rust"
    , FlowParagraph "Rust is my super weapon of choice for most tasks. Its a difficult language, but has everything you need to produce high quality, high performance code that works first time. There is enough of a type system to also build fairly expressive solutions."

    , FlowSection "Haskell"
    , FlowParagraph "I'd say I'm an 'intermediate' Haskeller! I am pretty comfortable with the basics, including effects, monads, transformers, plus some more advanced stuff like lenses - however I'd say I have still quite a long way to go to fully grasp category theory and some of the more advanced type theory stuff I read about. However I absolutely love this language and it has become one of my primary tools I reach for."

    , FlowSection "PureScript"
    , FlowParagraph "Is PureScript + Halogen the solution to using TEA (The ELM Architecture) in production / project type code bases? Maybe! PureScript is heavily inspired by Haskell, syntactically but also from a pure and very strongly typed perspective. What that means is that it's really powerful and allows for much less debugging and testing as most bugs that are produced sit in the 'logic' category. The downside is you need to probably get comfortable with Category Theory, Monads, Higher Kinded Types, etc to really become proficient, and this can be a big ask for general programmers on a team."
    , FlowLink
          { title: "I run a beginners course on Learning PureScript and post my videos on YouTube - take a watch!"
          , link: "https://www.youtube.com/playlist?list=PLBAMhqKy7jTvGxQSnUMmgUHTABuqXm4_a"
          }
    , FlowParagraph "Plus..."
    , FlowLink
          { title: "This blog is written 100% in PureScript! (Primarily using a very cool project called purescript-concur, plus my very own very simple blog framework)"
          , link: "https://github.com/drshade/tomwells.org"
          }

    , FlowSection "Scala"
    , FlowParagraph "Although I'm not a big fan of the clunk of Java in general (jar files, package management, classpaths, yuck) I really love the Scala language and have been following it for many years. SBT makes jar hell semi-tolerable (once you manage the learning curve), and once you're through the setup cost Scala is really a joy to use. Decent pattern matching, the Option type, a workable type system - it's not haskell or elm, but it's totally usable! Implicit magic is fantastic - it would be great to see proper discriminated unions one day, and also a few small niggles like function parameter tuple destructuring (and friends - e.g. case Some((a, b)) -> { blah } == e.g. the (a, b) is destructured. Not currently supported in 2.12."

    , FlowSection "Elm Lang"
    , FlowParagraph "Elm is a language for building web applications, nothing else. It really invented the 'redux' pattern which is now so popular in other Javascript based frameworks like React or Angular. However - because Elm is a specialist language it can provide a whole bunch of language support to keep it really simple and remove any ability for the developer to make mistakes in the pattern. It's a pure functional language - meaning absolutely no ability to generate side effects. The author (Evan Czaplicki) is obsessed with designing a language that is simple, easy to use and delightful for developers. It's an absolute pleasure to work with and it has a special place in my heart. Would I use it for real worky type stuff? Probably not. Would I use it for toy worky type stuff? Absolutely you betcha."
    , FlowParagraph "What I love about ELM is that it punishes you for over thinking, or over structuring your solution. Literally code up feature by feature, and extend your solution as you go - refactoring is really easy. It really demonstrates how powerful a proper type system can be, and will certainly make anyone a better programmer in other languages."

    , FlowSection "C, C++"
    , FlowParagraph "Although less frequently in recent years, I have been required to write a fair amount of C / C++ code - generally to be run within customized hardware security modules. It takes a couple days to get back into it, but I soon get into the groove and love the language (especially C - for it's simplicity). In my past in the early 2000s I wrote an absolute ton of pure C, back then in a pseudo object-oriented style (function pointers in structs ftw!)."
    , FlowParagraph "My belief is that C is the language that absolutely every wannabe software developer should learn, and write at least 6 months of production code in - too many good lessons and concepts to mention, concurrency, threading, memory, strings, etc - all of which are probably taken for granted in higher level languages."

    , FlowSection "Objective-C"
    , FlowParagraph "A surprisingly cool language that I needed to pickup while looking at IOS development for a proof of concept project I worked on. I ultra-love the ability to switch into C, but also the language is super modern with automatic reference counting, and asynchronous constructs optionally built in. I absolutely love the objective-c language additions - they are quirky and show their amazing history."
    , FlowParagraph "Probably nowadays Swift is a better (functional) choice!"

    , FlowSection "C#, F#, Java"
    , FlowParagraph "A great, solid, practical and easy to use bunch of languages for everyday use. These are the languages that I tend to recommend for most of the projects which I bootstrap, because of running least risk generally. Microsoft have done a great job of including a monumentally awesome standard library into the runtime, but produced an amazingly powerful core runtime."

    , FlowSection "Rats and mice - Python, Golang"
    , FlowParagraph "Comfortable working with all of these - and have in the past spent many thousands of hours in each. Python used to be my go-to scripting language in the mid-2000s to early-2010s - but I grew tired of it when I began my functional enlightenment journey as I found I struggled with implementing some, even basic FP patterns in the language. I've written a bunch of Golang, primarily within the context of Kubernetes operators and calling the Kubernetes API machinery - I have a love/hate relationship with Go. I love that it's statically linked, tiny runtime and it's a joy to build scratch based docker containers - BUT I hate it's error handling paradigm and it's huge reliance on nil, which is just so bug prone - it's just not heading us to a better place."

    , FlowMajorHeader "My passion"
    , FlowParagraph "I love building stuff. And this love is not limited to work related projects alone - however I have only one mind so it's sometimes hard to seperate. See below a list of some fun weekend projects which have swung from small prototypes to sometimes full blown obsessions:"

    , FlowSection "Galactica"
    , FlowParagraph "Caught up in the hype of OpenAI and Generative AI - I wanted to contribute something to world and so built a command line interface and developer oriented tool, primarily for my own technical teams to start using. We think it's an easy way to trial and integrate GPT-4 into any workflow, and the start of a larger initiative to build a more substantial prompt engineering and development tool for more advanced use-cases."
    , FlowLink { title: "Learn more and download Galactica here", link: "https://galacticai.co" }

    , FlowSection "unlockable.life"
    , FlowParagraph "A fun personal project dedicated to building and sharing unlockable collectibles on the blockchain (sort of like NFTs, but not tradeable, only collectible!)."
    , FlowParagraph "Without getting into a rant about how I feel about NFTs, I wanted to demonstrate a nicer and more social way of how we could use the idea of collectibles the way web3 is intented to work."
    , FlowLink { title: "A very crude prototype is still available to play with here", link: "https://unlck.xyz/" }

    , FlowSection "The Kraken!"
    , FlowParagraph "Over COVID I got really keen to solve realtime communications. Stuff like Zoom, Teams etc are great and work well - but they are missing the adhoc, water-cooler type conversations which are more casual and unplanned. Zoom & Teams both follow a 'room' type analogue where the rules are simple, you can only have 1 speaker and everyone listens to that same speaker, one at a time. This works well for traditional board-room meetings - but is terrible for less formal interactions such as those you might find at a dinner party, conference reception, waiting room, kids party, walking down the street and sitting on a bus."
    , FlowParagraph "I envisioned a persistent, unbounded digital world where players could move around freely, and communicate with other players based on their proximity. As you move close to a group of people, their audio & video would connect and you would be able to hear & see them and vice versa. As you move away, those media streams would disconnect and you would be on your way."
    , FlowParagraph "This doesn't sound too unimaginable, but from a media perspective is actually really difficult - Video & Audio communications would need to be dynamically registered as opposed to 'room' based. It turns out that most media servers don't really support this topology, so we went about building it!"
    , FlowImage { src: "/images/cv/the_kraken.png", alt: "The Kraken! Team testing...", caption: Just "The Kraken! Team testing..." }
    , FlowParagraph "The prototype above is still work-in-progress and demonstrates a hyper-scale media server architecture with no 'room' concept. Theoretically could support an unlimited number of players dynamically registering and unregistering media streams as they move around an infinitely large world."
    , FlowParagraph "Full reactive hyperscale architecture:"
    , FlowImage { src: "/images/cv/the_kraken_architecture.png", alt: "The Kraken! Architecture", caption: Just "The Kraken! Architecture" }

    , FlowSection "House mappy"
    , FlowParagraph "I was obsessed with Photogrammetry for a few weeks and produced this beauty:"
    , FlowYouTube { id: "l1qAHhIXMfs" }
    , FlowParagraph "I used an app called 'display.land' for the photogrammetry capture bits and its OK - but next I would want to replace that with a better tool, maybe AliceVision. Another idea I had was to just build a simple IOS app, use ARKit to capture a realtime point cloud, then sample the point cloud to build up lots of small textures to map to voxel-like planes in Unity. I've got a very small prototype of that running - but it's nowhere complete (grokking xcode & ios is hard!)."

    , FlowSection "Container Chaos"
    , FlowParagraph "Check this beauty out - visualizing a kubernetes cluster in unity"
    , FlowYouTube { id: "qG8GPRMKmQ8" }

    , FlowParagraph "Another idea was more of a structured 'appliance' view of kubernetes. Where various resources (such as Deployments, ReplicaSets and Pods) are represented as rackable equipment and connected to each other through 'cables'."
    , FlowImage { src: "/images/cv/appliances.png", alt: "An 'Appliance' view of kubernetes", caption: Just "An 'Appliance' view of kubernetes" }
    , FlowParagraph "Tjaards idea was a huge set of cogs dropped onto massive spindles to represent the Deployment -> Pod relationship. The speed of cogs rotating depicting how hard they are working (or something like that):"
    , FlowImage { src: "/images/cv/cogs.jpeg", alt: "Cogs and Spindles", caption: Just "Cogs and Spindles" }
    , FlowParagraph "I think this would be really cool in VR. The ability of players to immerse themselves into the cluster resource and also be able to move stuff around to make more sense to them... Hopefully more to come."

    , FlowSection "Tradeflow"
    , FlowParagraph "I've been watching bitcoin and other crypto for a very long time, and occasionally get interested in seeing whether there are any opportunities on the arbitrage side. I've experimented with market neutral strategies, and also with arbitraging the big global exchanges with the local South African ones. To this end I have developed a small but powerful trading tool to assist with performing this USD -> ZAR arbitrage in a very fast and scalable manner."

    , FlowSection "Ultra-nerf"
    , FlowParagraph "After a couple of excellent Nerf wars at the office I decided to do some upgrades of my gun. Removed the standard brushed motors, replaced them with powerful brushless (scavenged off an old fpv drone), fitted with ESCs and driven by a 16.8 4-cell LiPo battery. Added an Arduino behind the trigger to drive them, and now this thing is literally deadly."
    , FlowParagraph "Unfortunately I've been banned from Nerf games at the office now..."
    , FlowImage { src: "/images/cv/ultra-nerf.jpeg", alt: "Ultra-nerf", caption: Just "Ultra-nerf" }

    , FlowSection "Git history"
    , FlowParagraph "Working at Synthesis means we have access to over 20 years of software development commit history. Unfortunately we only switched to Git (from Subversion) around 2010, and we tried at the time to import only those repositories that were still active, deprecating the really ancient stuff unfortunately. Ok, so we have 10 years of software commit history."
    , FlowParagraph "I wanted to analyse some this, and was learning Apache Flink at the time so built a flink source that would pull down each git repository that we have, then extract and stream every commit log, author, diff etc for analysis, and then load into a timeseries influxdb database with grafana pointing at it."
    , FlowParagraph "This resulted in some cool overall stats, for example over a 5 year period:"

    , FlowImage { src: "/images/cv/total_commits.png", alt: "Total Commits", caption: Just "Totals" }
    , FlowImage { src: "/images/cv/total_commits_2.png", alt: "Files & Lines of Code", caption: Just "Files & Lines of Code Added and Removed" }
    , FlowParagraph "For interest sake, the initial first sweep took approx 90 minutes to complete a full sync of our ~1,000 repositories, with a grand total size of ~500gb. And thereafter each repository is only checked approx every 5 minutes for updates. This runs on a fairly small flink cluster of 3 task managers deployed to 3 c5.xlarge machines within our development kubernetes cluster. Flink was a perfect fit for this - but influxdb wasn't and I had to continuously remove tags from the data series to keep the cardinality low otherwise it would keel over and be nuked by our cluster due to breeching memory limits. At one point I even tried deploying influxdb to a dedicated high memory node with 32gb, but even that would fall over eventually. Influxdb is awesome from a dev integration perspective, but probably ElasticSearch is a better choice if this was required to scale to any degree..."

    , FlowSection "Etherlock"
    , FlowParagraph "During my time obsessed with Ethereum smart contracts & solidity I build a small prototype which allows any ethereum user (with wallet) to 'rent' my safe. The safe was fitted with a raspberry pi, running a small ethereum node synced to the public ethereum blockchain. It would be able to detect changes in rental ('ownership'), and then be able to respond to functions invoked on the blockchain, i.e. the ability to lock or unlock the safe."
    , FlowParagraph "I think this idea has TONS of potential. Of course you could use it to protect your stuff, but you could of course also program much more complex contracts, such as the ability for the safe to open when a buyer has paid the purchase price of whatever is inside the safe (almost like a vending machine)."
    , FlowImage { src: "/images/cv/etherlock1.jpeg", alt: "Etherlock", caption: Just "Project Etherlock" }

    , FlowSection "FPV Racing Drones"
    , FlowParagraph "I was obsessed with building and flying FPV (first person view) drones for a few years (2016/2017) and during that time built approx 8 machines over 18 months. This was when I learned to solder, and learned about things like PID controllers etc."
    , FlowImage { src: "/images/cv/drones1.jpeg", alt: "Drones", caption: Just "My collection at one point in time - includes the DJI Mavic on the far right for perspective." }
    , FlowImage { src: "/images/cv/drones2.jpeg", alt: "Drones", caption: Just "My 5\" Lumenier - really my first 'proper' racing build, using top-end components." }
    , FlowImage { src: "/images/cv/drones3.jpeg", alt: "Drones", caption: Just "An overpowered 4\" custom" }
    , FlowImage { src: "/images/cv/drones4.jpeg", alt: "Drones", caption: Just "A couple others in various sizes (above is a 4\" plus a 6\")." }

    , FlowMajorHeader "My roles"

    , FlowSection "Chief Disruption Officer"
    , FlowSection "Synthesis Software Technologies (since 2016)"
    , FlowParagraph "Leading projects in our Emerging Technology space with key early-adopter customers. Customers wanting to explore possibilities with Machine Learning, Realtime Streaming or even experimental ideas such as Extended Reality. Usually these are shaped as timeboxed proof-of-concepts executed with a small highly capable and focused team to maximize learning and exposure - thereafter and if successful can be spun into longer-term project commitments aimed at getting into the market."

    , FlowSection "Director of Information Security"
    , FlowSection "Synthesis Software Technologies (since 2007)"
    , FlowParagraph "In this role I managed a team of approx 8 developers deployed on various projects, interfacing directly with customers through the sales, contracting and implementation stages including diving into architecture and development head first to get projects up and running as effectively as possible."
    , FlowParagraph "I am passionate about writing secure, clean and bugfree code and am an agile and MVP evangelist. I used to be nuts about security, cryptography, vulnerabilities, penetration testing and the security industry and it's ecosystem. These days I prefer to focus my energy in areas which are more positive and creative, but I always have a slant towards developing applications which require higher levels of security, privacy and compliance."

    , FlowSection "Senior Software Developer"
    , FlowSection "African Defense Systems, Midrand, South Africa (Jan 2001 - Nov 2004)"
    , FlowParagraph "In this role I spent a lot of time writing military grade software against the MIL-STD-498 software development methodology. My focus areas were mainly in fire control, environmental and missile weapon simulation."

    , FlowMajorHeader "A couple notable projects"
    , FlowSection "HALOdot"
    , FlowParagraph "Technical input, guidance and advisory around the building of our L2 certified tap-on-phone kernel, which is provided as an SDK for embedding in any Android application. Assisted by some of the work I had done in prior years around EMV, Contactless and hardware security modules."

    , FlowSection "GovChat.org"
    , FlowParagraph "I worked with this brilliant and talented team for a few months helping bootstrap their ability to scale to millions of customers during the COVID-19 epidemic. GovChat has been responsible for processing over 200 million messages from South African Citizens over the 2 month period, and assisted millions of South Africas with applying for their Social Relief of Disress Grant (SRD) via the same channel. I continue to provide technical advisory to GovChat and am looking forward to seeing them grow into a hugely impactful success story."

    , FlowSection "Nedbank AVO"
    , FlowParagraph "I worked closely with the initial 'Archithon' team during the inception of the NedBank AVO platform design. This involved caralling and juxtaposing ideas from a variety of vendors and individuals into a single logical systems architecture. The app is comprehensive, providing a double-sided retail and super-app experience to customers. The architecture is a combination of micro-service and realtime streaming design, deployed to containers on AWS, with insight provided by the various AWS data and analytical services."

    , FlowSection "Discovery Vitality Global Infrastructure ± April 2018"
    , FlowParagraph "Re-architected, built and supporting a MASSIVE Kubernetes infrastructure, spanning 11 different data centres (mix of AWS, Azure & VMWare colo) upon which the Vitality V1 platform is deployed, providing geolocated and localized services to customers around the globe."

    , FlowSection "Afgri Internet Banking ± Feb 2014"
    , FlowParagraph "I bootstrapped a small, nimble and effective team to develop the next generation of Afgri's Internet Banking platform. Scrum process with a focus on MVP to manage the development, with business interaction on a daily basis to prioritise features. Technology platform leveraged AngularJS frontend, ASP.NET WebAPI backend, integration into SAP PI core banking platform."

    , FlowSection "Investec Issuer Script Generator ± Oct 2011"
    , FlowParagraph "Replacement of a heavyweight (read expensive) european EMV scripting engine with a lightweight and fit-for-purpose EMV issuer script generator tied into the card authorisation process handled by the AS400 card host. This application allows the management of cards post-issuance, supporting any number of issuer scripts to be delivered to a card while performing online authorisation, such as managing velocity counters, enabling/disabling contactless support, blocking/unblocking or even pin change. Technology platform is F# .net core service, with integration into a Thales nShield HSM for Secure Messaging encryption / signing. Administrative frontend developed in ASP.NET MVC4."

    , FlowSection "Investec Mauritius Online Banking ± Oct 2010"
    , FlowParagraph "From first line of code to live to the first client within 6 months. Fully transactional, multi-currency, multiple level authorization, auditable and secure platform that has become a key differentiator for Investec in the Mauritus market. Through the epic success of this delivery, this project has been used as blueprint for future development projects tackled by Investec. Combination of Scrum and Kanban project methodologies, managing a team of approximately 11 people. Technology platform is a very straightforward mix of ASP.NET MVC4 frontend, WCF Webservice backend, Java service layer integrating into the AS400 Bankfusion Equation core banking platform."

    , FlowSection "ABSA Zero Knowledge of PIN ± Feb 2009"
    , FlowParagraph "Secure the ABSA sign-in and registration process through termination of SSL/TLS web traffic within custom code running on Thales nShield HSM devices. Encryption of sensitive (generally PCI PSR / PCI DSS) parameters is done within the FIPS-140-3 boundary and re-originated from within the device en route to final destination. This infrastructure secures 1.3 million users, accessing ABSA web resources upto 4000 requests per minute, across multiple geographies. Technology platform is based upon the Thales nShield CodeSafe development environment which runs our C-language 'Zero Knowledge of PIN' application on an emulated FreeBSD kernel."

    , FlowSection "Artillery Fire Control System"
    , FlowParagraph "Worked in the Ground-Based Command and Control Department as a software developer on an artillery command and control system. The system was written in Java using Sun Microsystems’ NetBeans Platform and targeted at the Linux platform. I was a member of the architecture team and was instrumental in redesigning the entire system from scratch after identifying a number of critical flaws in the prototype design. My responsibility on the project involved developing the core module infrastructure of the framework in order to support a pluggable and modular application. Later I was tasked with developing a digital elevation data processing module in C++ integrated into the core product (using Java Native Interface), as well as taking on the role of software configuration manager for the project."
    , FlowParagraph "This fire control system was intended for use by the G5 and G6 Howitzer guns produced in South Africa at the time."
    , FlowImage { src: "/images/cv/g6.jpeg", alt: "G6 Howitzer", caption: Just "The G6 Howitzer" }

    , FlowSection "Combat Team Trainer"
    , FlowParagraph "Worked in the Simulator Systems Department as a Junior Software Developer on a combat-team trainer for the South African Navy’s Patrol Corvette (SANPC) Programme. I was solely responsible for the synthetic environment subsystem which provides the entire system with emulated real-world data of the vessel’s current situation. This simulation engine also allows visualization and modification of the surface situation by an instructor. I was partially responsible for writing both the surface-to-surface and surface-to-air missile console simulators which emulated the actual combat consoles linked to the vessel’s combat management system. This involved writing human-machine interface code as well as simulation of ballistics, flight-path and collision-detection code. The simulator was a complete success and I was instrumental in the delivery and rollout process which occurred over a period of 3 months in Simonstown, Cape Town."
    , FlowImage { src: "/images/cv/sanpc.jpeg", alt: "SANPC", caption: Just "South African Navy Patrol Corvette" }
    , FlowParagraph "Check out a video made of a live test-firing of the surface-to-surface missile below:"
    , FlowYouTube { id: "KrW1oQq9f3k" }

    , FlowMajorHeader "Outside of work"
    , FlowParagraph "I have a beautiful wife and 2 smart, energetic and assertive young daughters who remind me to look at the world through their inquisitive eyes every day, and keep me young. These two little beings are the reason for everything really - working hard, continuously learning and building a better world."
    , FlowParagraph "I spend a lot of time on my bicycles, either ripping up the neighbourhood trails on my singlespeed mountain bike, leading the peleton at the cradle of humankind on my road bike, exploring the drakensberg on my dual suspension mountain bike or trying to better my ironman bike split on my time-trial racing machine."
    , FlowParagraph "I've done a few 'epic' events in my life including Expedition Africa 2019 in Rodriguez (adventure race - 380km, 5 days), 2x Ironman South Africa Triathlons (3.9km swim, 180km cycle, 42km run), Joberg2c (mountain bike - 9 days, 1000km) and millions of smaller events."
    , FlowParagraph "It's important for me to always have an event planned in the future - keeps me motivated to keep in shape and to keep exploring the planet."

    ]