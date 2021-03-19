module TomWellsOrg.Blog where

import Prelude

import Data.Maybe (Maybe(..))
import TomWellsOrg.Domain (Article(..), Author, FlowComponent(..))
import TomWellsOrg.Functions (constructDate)

tomwells :: Author
tomwells = 
    { name: "Tom Wells"
    , email: "tom@tomwells.org"
    , bio: "Towards an AI-first, hyper-scaled, functional reactive universe!"
    }

articles :: Array Article
articles =
    [ restful_in_peace
    , what_i_look_for_in_a_developer
    , practical_functional_programming
    , intro_to_fluid_infrastructure
    , code_101_pass_by_reference
    , livescript_rocking_your_world
    , a_word_on_monads
    ]

practical_functional_programming :: Article
practical_functional_programming = Article
    { slug: "practical-functional-programming"
    , title: "Practical functional programming"
    , keywords: ["functional programming"]
    , cover: { src: "/images/covers/code.png", alt: "code", caption: Nothing }
    , author: tomwells
    , date: constructDate 2015 12 3
    , summary: "No summary yet"
    , body: 
        [ FlowParagraph "I *cringe* when I see this sort of code:"
        , FlowParagraph """
            var names = new List<string> { "tom", "dan", "warren" };

            // Find the longest name in the list
            //
            var longest = names.First();
            foreach (var name in names) {
                if (name.Length > longest.Length) {
                    longest = name;
                }
            }"""
        , FlowParagraph "Why is it so cringe-worthy? Because it's buggy and full of assumptions. Its very hard to write code like that this that isn't buggy, and really this is grade 11 style programming (no disrespect to any talented grade 11'ers out there!). "
        , FlowParagraph "Mainstream languages (e.g. Java, C#, etc) are introducing more and more features which promote a functional programming paradigm and when used correctly can rid the world of this style of code."
        , FlowParagraph ".NET developers who use LINQ and Lambda expressions have been doing it (possibly unknowingly) for years, and writing nice clean code by making use of higher-order functions:"

        , FlowParagraph """
            var names = new List<string> { "tom", "dan", "warren" };

            // Find the longest name in the list
            //
            var longest = names
                            .OrderByDescending((name) => name.Length)
                            .First();

            Console.Out.WriteLine ("The longest name is: {0}", longest);"""
        , FlowParagraph "This version is so much safer - and much simpler to understand. There is no mutation occurring either. Either the variable _longest_ exists or it doesn't. No halfway state while the code is running."
        , FlowParagraph "Use this stuff! You can find equivalents in most mainstream languages, my favourite being prelude for livescript."
        ]
    }

intro_to_fluid_infrastructure :: Article
intro_to_fluid_infrastructure = Article
    { slug: "intro-to-fluid-infrastructure"
    , title: "Intro to Fluid Infrastructure"
    , keywords: ["infrastructure"]
    , cover: { src: "/images/articles/fluid_architecture/slide1.jpeg", alt: "Intro to fluid architecture", caption: Nothing }
    , author: tomwells
    , date: constructDate 2016 9 25
    , summary: "No summary yet"
    , body: 
        [ FlowParagraph "I gave a small talk to a couple of smart C-level people last week around my concept of Fluid Infrastructure."
        , FlowParagraph "Below are my slides with commentary:"
        , FlowImage $ { src: "/images/articles/fluid_architecture/slide2.jpeg", alt: "scale", caption: Just "a big word" }
        , FlowParagraph "Before we dive into the fun stuff, lets first deal with this big scary concept called scale. I fear that it's terribly misunderstood, and that most people imagine that only the hugest of tech companies would ever really need it. I think that's wrong."
        , FlowImage $ { src: "/images/articles/fluid_architecture/slide3.jpeg", alt: "scale", caption: Just "simple" }
        , FlowParagraph "For me, scale is a mindset around simple economics. Matching supply to meet demand."
        , FlowParagraph "I believe that traditional infrastructure teams tend to over-supply on our capacity by at least an order of magnitude (yes we do, and I will come back to this). And we tend to do this for good reasons, such as redundancy and planning for future growth. However with the availability of high quality cloud providers (such as AWS, Azure, Google, etc) the game is changing, and if we return to our simple goal of matching supply directly to demand we can swing our cost models back in our favour."
        , FlowParagraph "Lets dive into a bit more detail and see if we can unpack this a little."

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide4.jpeg", alt: "typical load average graphs", caption: Just "typical load average graphs" }
        , FlowParagraph "Lets start with something that should look very familiar to everyone - a typical load average graph. This could be anything, amount of CPU, amount of visitors to our website, transactions per second processed through a back-office, whatever makes sense."
        , FlowParagraph "Although they are all very different - they share a couple of similarities. Lots of peaks and lots of troughs (white-space) during idle periods."
        
        , FlowImage $ { src: "/images/articles/fluid_architecture/slide5.jpeg", alt: "sizing for peaks", caption: Just "sizing for peaks" }
        , FlowParagraph "This graph presents a challenge during infrastructure planning. We need to ensure we have enough capacity to process the load, but we also want to optimize our costs during idle periods. Of course, sizing for an average capacity would be bad - we would experience bad performance during high peak loads which might affect our customer and on the flip-size sizing for our peak would give us a great customer experience at the cost of very high levels of waste."
        , FlowParagraph "It's clear that we need to re-think this model. And here we can quite clearly see our order of magnitude under-utilization (over-supply)."

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide6.jpeg", alt: "redundancy amplifies waste", caption: Just "redundancy amplifies waste" }
        , FlowParagraph "The problem gets even worse when we start to model for redundancy. Even more under-utilization is locked in as we double and triple our infrastructure."
        , FlowParagraph "Is it fair that we should double or triple our costs in order to achieve a simple level of redundancy? That's kind of like buying 2 extra cars, just in case your first car breaks down. Makes no sense."

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide7.jpeg", alt: "typical scaling up", caption: Just "typical scaling up" }
        , FlowParagraph "A typical scaling up experience. We have an app that has 2 resources allocated (green - think hosts). This seems to deal with the demanded load OK initially."
        , FlowParagraph "Over time the usage of our app increases, and during a heavy business period one day we find ourselves in a position where we can't handle the load (oops #1). We quickly scramble to resolve the issue by doubling our capacity, and using our human resources we are up and running within a few days/weeks."
        , FlowParagraph "And for a growing business we simply repeat the process - double our capacity as our demand grows."
        , FlowParagraph "This scenario highlights a couple of inefficiencies:"
        , FlowParagraph "1. A slow response to demand"
        , FlowParagraph "2. Doubling capacity after each incident is too coarse, effectively doubling our costs, when really all we needed was a small burst of capacity over a short period"
        , FlowParagraph "3. We tend to never scale back down after these events. The damage to business, plus human pain and effort involved tends to justify the new higher costs. I've never met an infrastructure team that decided to reduce capacity back down to nominal levels once they were over the high load period"

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide8.jpeg", alt: "unit of scale", caption: Just "unit of scale" }
        , FlowParagraph "Two dimensions are evident when looking at how to optimize this situation."
        , FlowParagraph "1. Deployment time (x-axis) - the time taken to respond to an increase or decrease in demand, or how quickly we can react"
        , FlowParagraph "2. Size of divisible unit (y-axis) - the size of each incremental adjustment to capacity (typically the infrastructure resource, such as host, network, memory, etc)"
        , FlowParagraph "Clearly, the smaller we can make these 2 individual dimensions, the quicker we can react to demand at a more efficient cost."
        , FlowParagraph "Lets look at demonstrating this in our example:"

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide9.jpeg", alt: "lets break it down", caption: Just "lets break it down" }
        , FlowParagraph "Large machines, monthly response time."

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide10.jpeg", alt: "lets break it down", caption: Just "lets break it down" }
        , FlowParagraph "Smaller machines (1 3rd the size of previous), with a weekly response time."
        , FlowParagraph "Already in this basic example we have saved approx 28% (represented by non-green whitespace)."
        , FlowParagraph "Starting to look like a game of Tetris? :)"

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide11.jpeg", alt: "lets break it down", caption: Just "lets break it down" }
        , FlowParagraph "Even smaller, tiny machines (1 6th the size of original), with a shorter (daily?) response time."
        , FlowParagraph "We've done better than before, with a total 33% saved overall."
        , FlowParagraph "Very nice. A total 3rd chopped off the top of our infrastructure bill."
        , FlowParagraph "This stuff is also very easy - with the right kind of support from the application itself (for another blog post) this pattern can be fairly simply achieved using AWS AutoScalingGroups in EC2 with the right rules in place."
        , FlowParagraph "Although we have done well, we still haven’t achieved that order of magnitude saving that we know is possible, and this is very evident when we look at some other application usage examples."

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide12.jpeg", alt: "lets break it down", caption: Just "lets break it down" }
        , FlowParagraph "It turns out that even when we reduce our divisible unit down to a tiny resource, most applications still spend most of the time idling."
        , FlowParagraph "Unsurprisingly, the applications that idle the most are the low volume, back-office, batch type applications which make up the bulk of most organisations. They are the most wasteful, simply because they don't have enough work to do, and therefore cannot make any use of their provisioned capacity."
        , FlowParagraph "The real challenge is to attempt to collapse this infrastructure down into a single fabric. Allocating a pool of resources to many applications."
        , FlowParagraph "Of course, if we simply went ahead and tried to implement this, we would soon realize that application dependencies get in the way (i.e. each individual application relies on the base system to have dependencies installed, such as Java, .NET, etc, and these dependencies don't always play nicely in the same sandpit)."
        , FlowParagraph "The good news is that encapsulating of application dependencies is no longer a problem - and easily solved using containers!"

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide13.jpeg", alt: "enter containers", caption: Just "enter containers" }
        , FlowParagraph "Quick elevator pitch on containers:"
        , FlowParagraph "In the old-world managing an application meant managing the virtual machine operating system. Virtual machines are big heavy monsters that take long to provision (humans), hard to move around and are generally plugged into the underlying infrastructure (well known IP addresses, file-systems, etc)."
        , FlowParagraph "Containers on the other hand are able to stack up on top of container hosts fairly generically, they have zero dependencies on the underlying operating system and because they are extremely lightweight we can spin them up, shut them down and move them around our infrastructure very easily."
        , FlowParagraph "However - the most important aspect is that containers include applications and their dependencies, but zero operating system kernel. Meaning that when we move them around, they move around carrying absolutely everything they need to launch."

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide14.jpeg", alt: "container architecture", caption: Just "container architecture" }
        , FlowParagraph "A simple container architecture, lots of homogeneous (identical) hosts with various heterogeneous (varied) containers deployed above."

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide15.jpeg", alt: "combined usage", caption: Just "combined usage" }
        , FlowParagraph "Take a look at the combined usage (supply/demand) of deploying all 3 applications to the new single container fabric. We have managed to reduce our total usage down to 15% waste, simply by allowing our low usage apps consume in a shared resource environment. Pretty impressive."

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide16.jpeg", alt: "fluid infrastructure", caption: Just "fluid infrastructure" }
        , FlowParagraph "From a scalability perspective, we have an architecture that is both vertically and horizontally flexible (up & down)."
        , FlowParagraph "Launching additional containers within the same resource group gives us our vertical scalability - and enables us to make better use of existing resources, plus provide for redundancy."
        , FlowParagraph "Launching additional hosts within the resource group gives us our horizontal scalability - and enables us to grow or shrink the TOTAL capacity of the group."

        , FlowImage $ { src: "/images/articles/fluid_architecture/slide17.jpeg", alt: "objectives", caption: Just "objectives" }
        , FlowParagraph "A couple of summary points above that I believe can help to optimize your costs, the first 2 fairly easy to implement and the second 2 moving you closer to a fully fluid infrastructure using containers."

        ]
    }

code_101_pass_by_reference :: Article
code_101_pass_by_reference = Article
    { slug: "code-101-pass-by-reference"
    , title: "Code 101: Pass by reference"
    , keywords: ["programming"]
    , cover: { src: "/images/articles/no_cover.png", alt: "No cover", caption: Nothing }
    , author: tomwells
    , date: constructDate 2014 6 9
    , summary: "No summary yet"
    , body: 
        [ FlowSection "Placeholder for code-101-pass-by-reference"
        , FlowParagraph "Need to be written!"
        ]
    }

livescript_rocking_your_world :: Article
livescript_rocking_your_world = Article
    { slug: "livescript-rocking-your-world"
    , title: "LiveScript <| Rocking your world.js"
    , keywords: ["programming", "livescript"]
    , cover: { src: "/images/articles/no_cover.png", alt: "No cover", caption: Nothing }
    , author: tomwells
    , date: constructDate 2014 5 30
    , summary: "No summary yet"
    , body: 
        [ FlowSection "Placeholder for livescript-rocking-your-world"
        , FlowParagraph "Need to be written!"
        ]
    }

a_word_on_monads :: Article
a_word_on_monads = Article
    { slug: "a-word-on-monads"
    , title: "A word on monads"
    , keywords: ["haskell", "functional programming"]
    , cover: { src: "/images/articles/no_cover.png", alt: "No cover", caption: Nothing }
    , author: tomwells
    , date: constructDate 2014 4 15
    , summary: "No summary yet"
    , body: 
        [ FlowSection "Placeholder for a-word-on-monads"
        , FlowParagraph "Need to be written!"
        ]
    }

restful_in_peace :: Article
restful_in_peace = Article
    { slug: "restful-in-peace"
    , title: "REST(ful) in peace..."
    , keywords: ["architecture", "streaming", "realtime", "restful"]
    , cover: { src: "/images/articles/restful_in_peace/cover.png", alt: "REST(ful) in peace", caption: Nothing }
    , author: tomwells
    , date: constructDate 2019 5 10
    , summary: "No summary yet"
    , body: 
        [ FlowSection "REST is best? ¯\\_(ツ)_/¯"
        , FlowParagraph "We obviously all love REST - and it's become the standard least-surprising choice to make when building any type of service these days, be it monolithic, microservice, web, or whatever."
        , FlowParagraph "However! There is a fundamental change in the way we build new systems coming - already starting to emerge in the hyperscale enterprise space - but starting to make it's way into the workspaces of run-of-the-mill software projects. This fundamental change is called Streaming or Event-driven (and earlier maybe CQRS or Event Sourcing). I'm just going to stick with Streaming throughout this post."
        , FlowParagraph "Streaming Architecture really marks the beginning of a new age in software architecture, definitively putting a dagger into the back of the age of the Microservice Architecture, which we could really call the pinnacle of the Services-Oriented Architecture period in the history of system architecture."
        , FlowParagraph "Streaming is seriously disruptive. It changes everything. *Everything*. Be prepared to re-think basic concepts like stateless, databases and even the concept of request/response itself - because these are fundamentally at odds with Streaming."
        , FlowParagraph "And guess what? Life is better. And simpler. And scalable. But different - so you are allowed to feel uncomfortable! I think we, as software developers, are generally OK with technology changing and evolving rapidly, but it is less frequent that fundamental design patterns are disrupted and we have to start again; re-programming our neural pathways to think and solve problems in a completely new way."
        
        , FlowSection "\"Its SOA broken\""
        , FlowParagraph "If you're like me, you've kinda always known that services-oriented-architecture has been broken, but you've made do - it was better than nothing. You happily built XSD/WSDL based SOAP services. You were happy when REST came along, because it dropped a bunch of evil XML remote procedure calls, and introduced the seperation of noun from verb (resource & method) with the trade-off that you could no longer programmatically manage service schema (but nobody cared - XML sucked!). You jumped on microservices when it appeared, it promised to make our services scalable and simpler! But it lied... life as a microservice software developer became complicated quickly. To be a useful developer - you now needed a team of highly skilled DevOps, Kubernetes, Netflix OSS, SpringBoot, Nginx, Vault, Helm, Spinaker, ElasticSearch, Prometheus, Cassandra and Mongo unicorns as support before you could write and test your first most basic service. The foundations required for the old 'Hello, World' service in a hyper-scale microservice architecture is pretty daunting."
        , FlowParagraph "So why does a Microservice Architecture need handfuls of all these various technologies and stacks to make it work? My gut says that there must be something fundamentally broken that we are building upon. Something at the core of what we use that doesn't scale - and so all these additional technologies and stacks we throw into the mix are really just masks; that maybe shift the bottlenecks around, or spread them over a wider surface, but never really get rid of them. And that seems OK to most people - it makes for busy development teams, rockstar architecture teams, brilliant and hard-to-find devops teams - but it all seems like wasted energy; and we haven't even written 1 line of valuable code yet. My theory is that we can trace the blame right back to one very simple little tool. The concept of *Request/Response*."
        , FlowImage $ { src: "/images/articles/restful_in_peace/the_poison.png", alt: "The Poison", caption: Just "Figure 1 - The Poison" }
        , FlowParagraph "I think that Streaming takes us back to the beginning. Back to basics. But built upon a fundamentally distributed architecture - so all those hyper-scale foundations come mostly for free. Just build simple stuff using the distributed primitives provided. However - not all the primitives you have previously enjoyed and come to love are available. Stuff like our old faithful request/response. And stuff like our trusty databases. And therefore stuff like RESTful, or HTTP/1."
        
        , FlowSection "The main Event"
        , FlowParagraph "The Streaming primitive is something called *The Event*."
        , FlowImage $ { src: "/images/articles/restful_in_peace/the_remedy.png", alt: "The Remedy", caption: Just "Figure 2 - The Remedy" }
        , FlowParagraph "The interesting thing about The Event is that it has no particular direction. It doesn't move from one place to another, it's not requesting anything, nor is it in response to anything. It just pops into existence. Anywhere. And whoever might be interested in it can consume it. However, consuming The Event doesn't destroy it. It hangs around persistently, because anyone else might want to consume it too. Even more interesting is that it might be consumed by someone in the future who don't yet exist, or may not even be conceived of yet."
        , FlowParagraph "Probably even more exciting about The Event is that it is composable. Meaning that you are able to create higher-level events from the composition of lower-level events - sort of like lego - the ability to glue them together to make bigger lego blocks. This was infeasible in the request/response world. At a microservices level it is really impossible to leverage composition - a request/response pair just simply cannot be glued to another request/responses. They are un-gluable. Often the best we could do is called 'orchestration' - which is really just an abstraction around the order that particular requests and responses should be made, by one particular service - but really you were not able to take a number of Microservices and compose them to create a new higher-level service. Not without a lot of pain and suffering along the way - the juice is just not worth the squeeze."
        , FlowImage $ { src: "/images/articles/restful_in_peace/the_pulsating_rhythmical_remedy.png", alt: "The Pulsating Rhythmical Remedy", caption: Just "Figure 3 - The Pulsating Rhythmical Remedy" }
        
        , FlowSection "big_event = something >>= another >>= blah"
        , FlowParagraph "Composition is a key property of Functional Programming - and if you are already a functional programmer (or at least think about stuff in a functional way) then Streaming is a dream come true. Its really the architecture that functional programmers have been looking for - and eradicates all the frustration and conflict felt when dealing with external services or external data stores (such as RDBMSs) which are fundamentally non-composable, and non-immutable in nature. Streaming relies on a 'durable, immutable commit log' at it's core - and if that makes sense to you you're probably at least already halfway there."
        , FlowImage $ { src: "/images/articles/restful_in_peace/commit_log.png", alt: "Commit log materialising multiple table structures", caption: Just "Figure 4 - Commit log materialising multiple table structures" }
        
        , FlowSection "The commit log"
        , FlowParagraph "The Commit Log structure is far superior to a regular database table structure, and is really a higher-level structure that can be used to easily derive a table-like structure. It's a super-structure. Infact a table-like structure is just ONE of the types of derived structures you can produce from the commit log (by simply reducing and merging the latest commits) - there are also a bunch of other interesting structures you can derive, such as a group-by (as in the example), time-based windows, or some sort of aggregation (sum, mean, avg, count, etc). Of course, the real power of this structure is the practical realisation of time-travel, and the ability to calculate (or materialise) the state of the world at any point along the event timeline. No state change is discarded, it is simply appended to."
        , FlowParagraph "This power over time is really a central theme of Streaming, giving us a powerful tool for dealing with distributed data. The database world struggles with creating distributed data systems because it fundamentally does not embrace time, nor does it embrace immutability. So we have this very difficult situation where we try to reconcile a distributed set of datastores, being mutated independently and in an unsynchronized way. This makes for an impossibly hard problem - which I would propose really isn't solved today. Maybe stuff like log shipping and eventual consistency get us some of the way there. And possibly things like Google Spanner and it's use of atomic clocks to keep time atomically synchronized gives us the ability to tie-break two conflicting changes - but that seems like overkill, and probably not a practical general pattern (unless we commit to shipping an atomic clock with each of our products!)."
        , FlowParagraph "Commit logs are not a new concept - and are already used internally by popular database technologies to allow concepts such as 'transactions' (ability to rollback or commit) and 'replication' (through techniques such as log shipping) - however the database service itself does not expose the commit log to the outside world - it's simply used to retain commits transiently before records get processed into the mutable table structure. And therein lies the fault in database design - considering the commit log a transient structure, and considering the materialised tables the primary persistent structure."
        , FlowImage $ { src: "/images/articles/restful_in_peace/db_commit_log.png", alt: "Database transient commit log", caption: Just "Figure 5 - Database transient commit log" }
        , FlowParagraph "Streaming takes an alternative view, promoting the commit log as the primary data structure, offering persistence and durability in addition to the fact that it's already a distributed structure. As we already know, the flattened data structure can be re-calculated (re-materialised) at any point along the timeline of the commit log and can therefore be considered a second class citizen within Streaming. Of course, it would be impractical to constantly re-materialise these views, so there are techniques to make this less cumbersome - but fundamentally the shift is away from considering these as the master structures."
        , FlowImage $ { src: "/images/articles/restful_in_peace/streaming_commit_log.png", alt: "Streaming persistent commit log", caption: Just "Figure 6 - Streaming persistent commit log" }
        
        , FlowSection "Stream conceptual"
        , FlowParagraph "So what does a Stream look like? Conceptually its a simple list structure holding records of key=value. *Producers* append records to the end of the stream and *Consumers* consume, starting from the beginning of the stream - each consumer having a persistent offset into the stream. Multiple consumers can consume from the same stream, each having a different offset into the same stream. And each consumer can be scaled up independently depending on the workload."
        , FlowImage $ { src: "/images/articles/restful_in_peace/stream_conceptual.png", alt: "Conceptual view of a Stream", caption: Just "Figure 7 - Conceptual view of a Stream" }
        , FlowParagraph "Physically however, streams are a bit more complicated and due to their distributed nature need to split and replicate records across multiple *Partitions*. Each partition can be physically relocated to seperate nodes in the infrastructure, and can have different replication properties. As with any distributed data structure there are a number of constraints and guarantees that any developer must be aware of when designing a streaming application - these are generally around ordering and locality of data within a particular partition as opposed to within the stream - and typically the record key must be used by the developer to manipulate which partition a particular record might land in. Although this may seem quite foreign initially - this is just part of understanding the paradigm and a necessary tool for designing streaming applications."
        , FlowParagraph "So events within a stream can be composed, but composition can also occur at the higher *Stream Processing* level where a collection of individual consumers and producers can be clustered together and encapsulate their inner workings - exposing only the streams consumed and produced by the composed cluster."
        , FlowImage $ { src: "/images/articles/restful_in_peace/composition_processors.png", alt: "A composition of Stream Processors", caption: Just "Figure 8 - A composition of Stream Processors" }
        , FlowParagraph "Composing stream processors does not make the cluster any less distributed, and still allows for independent scaling of individual consumer / producers within the cluster - meaning that you really can get down to eradicate bottlenecks at a very fine grained level. The ability to create ACID-like properties between stream processors is of course also possible - and typically through use of particular streaming design patterns (such as write-once and idempotency, but some more mature streaming technologies such as Apache Kafka recently allow for things like exactly-once guarantees and transactional rollbacks even)."

        , FlowSection "A matter of perspective"
        , FlowParagraph "With any new disruptive technology there is often a plethora of wildly different views, often I think based on individual context and personal perspectives. So I went around and asked a bunch of different people how they would describe streaming and what they thought a streaming architecture looked like. Keep in mind, all of these people had had experience with building applications ontop of streaming platforms (typically either Apache Kafka, AWS Kinesis or Apache Spark Streaming)."
        , FlowImage $ { src: "/images/articles/restful_in_peace/washing_machine.png", alt: "Saša's Washing Machine", caption: Just "Figure 9 - Saša's Washing Machine" }
        , FlowParagraph "Saša's view of streaming is that it really allows you to model the world (or enterprise, or platform) as a washing machine. Events swirl around inside the drum as multiple chains of events trigger and fire endlessly incorporating external events into the mix (fabric softener) and generating events that may be consumed externally (soapy water)."
        , FlowImage $ { src: "/images/articles/restful_in_peace/laundromat.png", alt: "Saša's Laundromat", caption: Just "Figure 10 - Saša's Laundromat" }
        , FlowParagraph "Once again you could easily reason about the washing machine in a way that would allow composition of multiple washing machines (a laundromat) to form. In reality this could represent things like divisional units, or products within a larger enterprise, and of course you could compose the entire laundromat, linking multiple laundromats together into a higher-level thing. Turtles. All the way down."

        , FlowSection "A mental model"
        , FlowParagraph "Talking to our data science team about streaming got a few blank stares - with most of them really not uncomfortable with the concept. One of the guys from my team simply describes a streaming architecture as a very simple neural network, composed of input layers represented by ingress streams, multiple hidden layers abstracting the business logic of the application and producing an output layer represented by a number of streams that can be consumed by external systems. Of course things like recurrency can be represented within the streaming architecture analogous to back-propogation - so really not too unfamiliar to people who work with neural networks."
        , FlowImage $ { src: "/images/articles/restful_in_peace/neural_events.png", alt: "The data scientists neural stream", caption: Just "Figure 11 - The data scientists neural stream" }

        , FlowSection "Mr Heisenberg, look what I found"
        , FlowParagraph "Marais sees streaming as a computational graph database - where streams themselves take on a duality of information flow (analogous to a queue) and data store (analogous to a database). Observation of the stream by a particular consumer will collapse the stream - for that consumer - into either form for observation. And that sounds pretty reasonable to me - I doubt you could ever compare any other architecture to the particle/wave duality of quantum mechanics!"
        , FlowImage $ { src: "/images/articles/restful_in_peace/duality.png", alt: "Marais' Queue / Store Duality", caption: Just "Figure 12 - Marais' Queue / Store Duality" }

        , FlowSection "Its a blockchain!"
        , FlowParagraph "Paul - who is obsessed with blockchain - sees streaming as a platform for building centralised, simple forms of smart-contracts. Although blockchain is really disruptive it often doesn't pass a number of acid-tests for incorporation into an enterprise setting - the cons can often outweigh the pros for enterprise adoption. Paul sees streaming architecture as simply the ability to create a number of immutable ledgers, where smart contracts represented by stream processors process entries from the ledger and update other upstream immutable ledgers. A perfect fit."
        , FlowImage $ { src: "/images/articles/restful_in_peace/smart_contract.png", alt: "Paul's Streaming Smart Contract", caption: Just "Figure 13 - Paul's Streaming Smart Contract" }

        , FlowSection "But can it run doom?"
        , FlowParagraph "Tjaard takes a more practical and 'digital channels' view of streaming - concerning himself with how events may impact end-users of an application. He sees the world as a series of interconnected event stores, one large one centralised in the enterprise (the traditional back-end) and many smaller ones resident on each end-users device (browser, mobile, etc). This allows the front-end application to be built exclusively upon the event store resident on the customer device, unlocking features such as offline use, ability to cache and progressively load content - but of course allowing for events to flow in either direction (down from the device and up from the back-end) when connectivity exists between the two. This is really a beautiful thing in practice. A full web or mobile application driven exclusively upon events - not one request/response interaction required."
        , FlowImage $ { src: "/images/articles/restful_in_peace/symmetrical.png", alt: "Tjaard's Symmetrical Flat Event Architecture", caption: Just "Figure 14 - Tjaard's Symmetrical Flat Event Architecture" }

        , FlowSection "TL;DR"
        , FlowParagraph "And so, in conclusion I find it really exciting to get five really different views of what streaming architecture looks like. I don't think you could get such wildly different views from senior people describing a traditional microservices architecture. Of course we are very early on the streaming hype curve - probably still at the beginning of the early-adopter stage, or possibly even late innovator stage. Some of the technology in this space is usable, for example the Confluent gang and their vision for Apache Kafka and the Streams DSL is really compelling - but of course with any new technology your-mileage-may-vary and so it will always be a trade-off whether you will net benefit from adoption within your enterprise. The one thing I can tell you is that Synthesis as a technology company (and as a skills incubator) we will continue to challenge the official future and are all-in on this architecture; ready to be there to support our customers, our partners and the industry as this architecture moves up into the early majority."
        , FlowParagraph "Thanks for reading and - Stream Big!"
        ]
    }

what_i_look_for_in_a_developer :: Article
what_i_look_for_in_a_developer = Article
    { slug: "what-i-look-for-in-a-developer"
    , title: "What I look for in a developer"
    , keywords: ["programming", "interviews", "hiring", "team"]
    , cover: { src: "/images/articles/restful_in_peace/cover.png", alt: "REST(ful) in peace", caption: Nothing }
    , author: tomwells
    , date: constructDate 2016 10 17
    , summary: "No summary yet"
    , body: 
        [ FlowParagraph "I interview prospective developers for my company almost every week, and over time have developed a bit of a sixth sense for sussing out talent. Here are a couple of the hallmarks that I look out for during an interview."
        , FlowSection "Low ego"
        , FlowParagraph "Our company is made up of approximately 95% technical minded folk, from graduate level programmers all the way up to senior greybeard level programmers with over 20 years of experience. This creates an awesome diverse environment where youngsters can learn from the experience of the battled hardened, and (sometimes more importantly) the oldies can be shown a thing-or-two by the young guns. We have absolutely no draconian overlords or chain of command when it comes to technical knowledge - every single individual must be in a state of constant learning, and this is the kind of environment that we nurture and protect."
        , FlowParagraph "The natural enemy to this open and learning culture is ego (and I mean the 'self-importance' definition, not the 'self-awareness' definition). Being able to learn means being able to listen, and being able to surrender the fact that you may not know everything. If you work as a developer today and believe that you will one-day know everything - then guess what, you are delusional. Catch a wake up. Open your ears, dump the ego and stop trying to prove to the world that you know everything. You don't."
        , FlowLink $ { title: "More here (via travisandco.com)", link: "http://travisandco.com/the-low-ego-executive/" }
        , FlowSection "No sociopaths"
        , FlowParagraph "Openness, honesty, transparency, empathy, professionalism, accountability and integrity. These are +1. The sociopath personality undermines all of these things in order to benefit personally at the cost of the company culture and team dynamic. We simply cannot afford to hire even one of these profile individuals."
        , FlowLink $ { title: "How to spot a sociopath (via wikihow.com)", link: "http://www.wikihow.com/Spot-a-Sociopath" }
        , FlowSection "Does not believe in magic"
        , FlowQuote $ { quote: "Any sufficiently advanced technology is indistinguishable from magic", author: "Arthur C. Clark" }
        , FlowParagraph "All program behaviour can be traced back to some line of code, given that we can continue to remove and inspect layers as we move down the call stack. I've met too many greenhorn developers that simply give up once they cannot explain why something occurs because they are too afraid to dig one layer deeper. The assumption that there is a magical spell one level below that simply cannot be understood is complete FUD - and we MUST dive deeper if we are to become proficient programmers."
        , FlowParagraph "In the 'old days' of C/C++ running in unprotected memory, magic was a bit more real - and as programmers we had to work really hard to track down errant memory writes that could introduce complete nonsensical behaviour as return addresses were overwritten, etc. But even then, there were great tools (such as valgrind and friends) that worked as powerful counter-spells - you just needed a fellow greybeard to point you in the right direction."
        , FlowParagraph "Today, however, there is no such excuse. Languages enforce types and protect memory, garbage collect, automatically dereference, even allow you to protect regions of code for thread safety. Code is more deterministic than ever before and that's awesome. What that means is that we should have absolutely no excuses for diving a level deeper whenever we need to. Dig into the AngularJS injector code! Go read the nginx http proxy module source code! Figure out how kubernetes integrates with AWS! No magic, just normal run-of-the-mill code. Written by humans. Not wizards. I promise."
        , FlowSection "Can speak through a problem"
        , FlowParagraph "Instead of simply blurting out a few early guesses (be they wrong or right). I like a person who initially says 'I'm not sure', and then takes a bit of a think and then starts asking some leading questions to guide them to an answer. Realize that good interviewers really couldn't care if you have memorized what HTTP, DI, CICD or YACC stands for - but rather what these things are and for what reason they exist. It is not correct to say that 'HTTP is the opposite of HTTPS' - come now. Show that you understand this stuff, or admit that you don't."
        , FlowSection "Is not a one-trick pony"
        , FlowParagraph "Having the ability and desire to learn a new language, and being adept enough to do this quickly and intuitively. The fact that a developer has spent his or her entire life in Java and can recite every possible system API is great, but doesn't help much when they are deployed into a nodejs project and expected to hit the ground running. Although it's vital that one can go deep when needed, it's more important to be able to go wide and be able to look around at other languages, be able to juxtapose them, understand why they exist and how best they should be used. The ability to find the API docs counts for more than the ability to recite the API docs. Google beats brain for memorizing stuff. Everytime."
        , FlowBullets $
            { start: "Other notable one-trick ponies:"
            , points: 
                [ "Object orientation is the only programming paradigm worth using" 
                , "Threading is how you achieve concurrency"
                , "Scalability is achieved by optimizing your code"
                ] 
            }
        , FlowSection "Is a team player"
        , FlowQuote $ { quote: "The whole is greater than the sum of its parts", author: "Aristotle" }
        , FlowParagraph "We don't do single-man projects. All of our teams, are TEAMS. Teams need to self-coordinate, collaborate and align to the same goals in order to deliver at the highest levels. I always imagine myself locked in a room with the prospective candidate, and role-play 'Would I be able to work with this person for an extended project?'. I'm not looking for someone who is necessarily a follower nor a leader, but someone who is a collaborator. Someone who can follow and lead at the same time. Filling in the gaps left open by other team mates. If I can only imagine having to work really hard at collaborating with the candidate I'm probably not going to bother eventually, and either step away and let them run the show, or deliver the entire thing myself. Either option is bad and defeats the multiplier effect of the team."
        , FlowParagraph "Anything I've missed and you think should be added?"
        ]
    }