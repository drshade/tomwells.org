module TomWellsOrg.Blog where

import Prelude

import Data.Maybe (Maybe(..))
import TomWellsOrg.Domain (Article(..), Author, FlowComponent(..), Language(..))
import TomWellsOrg.Functions (constructDate)

tomwells ∷ Author
tomwells =
    { name: "Tom Wells"
    , email: "tom@tomwells.org"
    , bio: "Towards an AI-first, hyper-scaled, functional reactive universe!"
    }

articles ∷ Array Article
articles =
    [ agentic_dev_methodology 
    , json_schema_rant
  --  planets_free_monad
  --, imperative_is_jam
    , haskell_for_prototyping
    , its_just_a_monad
    , restful_in_peace
    , what_i_look_for_in_a_developer
    , practical_functional_programming
    , intro_to_fluid_infrastructure
    , code_101_pass_by_reference
    , livescript_rocking_your_world
    , a_word_on_monads
    ]

agentic_dev_methodology :: Article
agentic_dev_methodology = Article
    { slug: "agentic-engineering-discipline"
    , title: "Engineering Discipline for the Agent Era"
    , keywords: ["methodology", "agile", "agentic development", "ai-assisted programming"]
    , cover: { src: "/images/covers/code.png", alt: "code", caption: Nothing }
    , author: tomwells
    , date: constructDate 2025 9 23
    , summary: "No summary"
    , body:
          [ FlowParagraph "As a technology leader working for a software engineering company, it's becoming increasingly obvious that we need to revamp how we approach our work given the new agentic tools at our disposal. The old methodologies don't account for the unique challenges of human-agent collaboration in code generation."

          , FlowParagraph "I've observed teams across various maturity levels of tool adoption, from complete beginners to advanced users. What's clear is that without explicit methodology, teams either get burned by unpredictable agent behavior or fail to leverage the real potential of these tools. Through trial and error, I've developed my own approach to maintaining high productivity while retaining ownership over code that still 'feels' like it's mine."
          
          , FlowParagraph "This article outlines the core principles and practical approaches that work for me in practice."

          , FlowSection "The Problem: Agent Freedom Creates Unpredictable Outcomes"
          , FlowParagraph "Most teams start with agentic tools by giving agents maximum freedom. I think this approach is called YOLO'ing and the results are predictably problematic:"
          , FlowSourceCode
                { lang: Pseudo
                , body: 
                      "> build me an app that makes applying for a mortgage easy"
                }
          , FlowParagraph "This approach leads to throwaway code, architectural decisions you didn't intend, and systems that feel foreign in your codebase."
          , FlowParagraph "On the flip side, teams that get burned by this often overcorrect:"
          , FlowSourceCode
                { lang: Pseudo
                , body: 
                      """
> update src/Component/Utils.hs to include a function with signature 
sum :: [Int] -> Int that recursively adds up the integers in the list 
provided. An empty list should result in 0.
"""
                }
          , FlowParagraph "While safe, this approach treats agents like smart autocomplete and misses their real potential."
          , FlowSection "A Framework: The Design × Implementation Matrix"
          , FlowParagraph "The key insight is that agent autonomy isn't a single dimension. We need to think across at least two dimensions: Design × Implementation."
          , FlowImage $ { src: "/images/articles/agentic_dev_methodology/dimensions.jpeg", alt: "Dimensions of Agentic Freedom", caption: Just "Dimensions of Agentic Freedom (Design ⨯ Implementation)" }          
          , FlowBullets
              { start: "Plotting our examples:"
              , points:
                      [ "The mortgage app sits in the upper right (maximum freedom, maximum chaos)"
                      , "The Haskell function sits in the lower left (minimal freedom, minimal leverage)"
                      ]
              }
          , FlowSection "High-risk Quadrants"
          , FlowParagraph "Upper Right: Free to Design + Free to Implement -> This is where most teams start. Maximum agent autonomy means maximum unpredictability. The mortgage example demonstrates the core problem - the agent might choose completely different tech stacks, architectures, or business logic than intended. Code tends toward throwaway quality and feels disconnected from your existing systems."
          , FlowParagraph "Lower Left: Constrained Design + Constrained Implementation -> This is traditional programming with agents as smart autocomplete. Completely safe but severely limited leverage of the agent's potential. Teams that get burned in the upper right often retreat here permanently."
          
          , FlowSection "Productive Quadrants"
          , FlowParagraph "Upper Left: Constrained Design + Free to Implement -> The sweet spot for most development work. Developers define interfaces, function signatures, and architectural constraints. Agents figure out how to implement efficiently within those boundaries. Code remains fully understandable and developers retain ownership of system design."
          , FlowParagraph "Lower Right: Free to Design + Constrained Implementation -> Interesting territory where agents explore alternative designs within strict implementation boundaries. Most useful for prototyping or architecture exploration in early stages of software projects, where you want creative input but within known technical constraints."

          , FlowSection "The Compounding Error Problem"
          , FlowParagraph "Multi-step problems reveal another critical issue: error compounding when agents hand off to other agents. Each handoff introduces compression and decompression of context, losing information and amplifying misunderstandings."
          , FlowParagraph "The pattern human→agent→agent→human creates a telephone game effect. Errors and misassumptions compound rather than being caught early. Better to maintain human→agent→human cycles, staying in the loop to catch issues before they cascade."

          , FlowSection "Context Management"
          , FlowParagraph "Agents perform differently based on the scope of codebase context they receive. Too much context leads to unintended dependencies, optimization for irrelevant patterns, and code that couples to parts of the system outside the intended scope. Too little context results in code that breaks integration points, violates existing conventions, or duplicates functionality that already exists elsewhere."
          , FlowParagraph "Unlike experienced developers who intuitively filter contextual information based on relevance, agents treat all provided context with equal weight. This means developers must become explicit about context boundaries when defining each scope of work."
          , FlowParagraph "Effective context management requires specifying which files to include as reference, which APIs are relevant, which patterns to follow, and which architectural constraints apply. Done properly, this increases the probability that agents generate code that integrates cleanly while avoiding unnecessary coupling to unrelated parts of the codebase."

          , FlowSection "TL;DR - Practical Implementation"
          , FlowParagraph "Working with agents requires a fundamentally different approach to engineering methodology. Here's what works in practice:"
          , FlowBullets
                { start: "Control & Boundaries"
                , points:
                      [ "Choose your quadrant deliberately: either Human-owned Design with Agent-owned Implementation, or Agent-owned Design with Human-owned Implementation Constraints"
                      , "Minimize Agent-to-Agent handoffs to prevent error compounding"
                      , "Maintain explicit scope boundaries for each agent session"
                      ]
                }
          , FlowBullets
                { start: "Context Management"
                , points:
                      [ "Implement spec-driven development - manage context and design through explicit spec documents (e.g. new_feature.md) committed to the codebase"
                      , "Use progressive disclosure - start with minimal context and add incrementally as necessary"
                      , "Explicitly manage context on a per-increment basis (feature, epic, commit level)"
                      ]
                }
          , FlowParagraph "The key insight is that methodology matters more than the tools. Teams that develop explicit processes for human-agent collaboration consistently outperform those that treat agents as magic black boxes."
          ]
    }
      

json_schema_rant ∷ Article
json_schema_rant = Article
    { slug: "json-schema-rant"
    , title: "Smart tools, dumb design choices"
    , keywords: ["json schema", "mcp", "anthropic", "api design", "validation"]
    , cover: { src: "/images/covers/code.png", alt: "code", caption: Nothing }
    , author: tomwells
    , date: constructDate 2025 9 2
    , summary: "No summary"
    , body:
          [ FlowParagraph "While learning about building Agents, MCP, etc I've come across a few patterns which tingle my spidey-sense, such as:"
          , FlowSourceCode
                { lang: JavaScript
                , body:
                      """
{
    ...
    "tools": [
      {
        "name": "get_weather",
        "description": "Get the current weather in a given location",
        "input_schema": {
          "type": "object",
          "properties": {
            "location": {
              "type": "string",
              "description": "The city and state, e.g. San Francisco, CA"
            }
          },
          "required": ["location"]
        }
      }
    ],
    ...
}
"""
                }
          , FlowParagraph "This is a direct paste from the Anthropic documentation, specifically for defining tools available to the LLM for invocation. Unsurprisingly this schema is almost identical to the MCP specification for tool calling too (as MCP was really popularised by Anthropic)."
          , FlowParagraph "On the surface this probably looks fine to most developers - but it reveals a fundamental problem with how the AI tooling ecosystem approaches API definition. Reinventing the wheel poorly."
          
          , FlowSection "The Core Problem"
          , FlowParagraph "JSON is just a data format that doesn't implicitly support schema validation. As long as you get the syntax right (keys are strings, objects use curly brackets, etc.), you can produce compliant JSON. This simplicity might fool you into thinking that's all there is, leading to the temptation to invent your own schema conventions when you need validation - exactly what Anthropic has done with their \"input_schema\" approach."
          , FlowParagraph "This ad-hoc approach creates immediate problems:"
          
          , FlowSection "Problem 1: Ambiguous Edge Cases"
          , FlowParagraph "Basic questions become unanswerable: \"How do I define a function with no arguments?\" Do I omit the \"input_schema\" property entirely? Include it as \"type\": \"empty\"? Use \"type\": \"object\" with empty \"properties\": {}? The specification doesn't clarify, and neither do the implementations. This ambiguity breeds compatibility issues as different tools make different assumptions."
          
          , FlowSection "Problem 2: Primitive Constraints"
          , FlowParagraph "The \"required\": [...] array is too primitive to handle even simple real-world cases. Consider wanting to support weather lookup by either city or state:"
          , FlowSourceCode
                { lang: JavaScript
                , body:
                      """
{ "state":"CA" } 
or 
{"city":"San Francisco"}
"""
                }
          , FlowParagraph "This \"either A or B\" pattern cannot be properly expressed using Anthropic's subset. You're forced into weak workarounds like making both fields optional, losing the constraint that exactly one must be provided."
          
          , FlowSection "The Solution Already Exists"
          , FlowParagraph "But! There is a standard called \"JSON Schema\" (https://json-schema.org/), which absolutely does support this:"
          , FlowSourceCode
                { lang: JavaScript
                , body:
                      """
{
    "oneOf": [
        {
            "type": "object",
            "properties": { "city": { "type": "string" } },
            "required": ["city"]
        },
        {
            "type": "object", 
            "properties": { "state": { "type": "string" } },
            "required": ["state"]
        }
    ]
}
"""
                }
          
          , FlowSection "Rich Validation Features"
          , FlowParagraph "Plus a bunch of other important features such as validation too - e.g.:"
          , FlowSourceCode
                { lang: JavaScript
                , body:
                      """
{
    "type": "string",
    "pattern": "^[A-Z]{2}$",
    "description": "Two-letter US state code (e.g., CA, NY)"
}
"""
                }
          , FlowParagraph "or"
          , FlowSourceCode
                { lang: JavaScript
                , body:
                      """
{
    "type": "string",
    "minLength": 2,
    "maxLength": 2,
    "pattern": "^[A-Z]+$",
    "description": "Two-letter state code"
}
"""
                }
          , FlowParagraph "or"
          , FlowSourceCode
                { lang: JavaScript
                , body:
                      """
{
    "type": "string",
    "enum": ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"],
    "description": "Valid US state abbreviation"
}
"""
                }
          , FlowParagraph "All of the above are much much better than simply hoping that the LLM will specify the right format. Not only that - but you are actually self-documenting the field too and being very specific in what will be accepted."
          
          , FlowSection "The Frustrating Reality"
          , FlowParagraph "The frustration here is that neither the Anthropic API nor most MCP clients currently support these JSON Schema features. Whether this is due to implementation complexity, compatibility concerns, or oversight, the result is the same - we're stuck with primitive subsets that can't express basic patterns. We are doomed to re-invent - and probably will eventually end up with JSON Schema (or something like it) being supported by these APIs - as we slowly re-learn all the lessons from our past."
          , FlowParagraph "/rant"
          ]
    }

-- planets_free_monad :: Article
-- planets_free_monad = Article
--       {
            
--       }

haskell_for_prototyping ∷ Article
haskell_for_prototyping = Article
    { slug: "haskell_for_prototyping"
    , title: "Haskell for extreme idea brainstorming"
    , keywords: []
    , cover: { src: "/images/covers/code_haskell_3.png", alt: "code", caption: Nothing }
    , author: tomwells
    , date: constructDate 2022 3 4
    , summary: "No summary yet"
    , body:
          [ FlowParagraph "A friend, named Gavin, wanted me to help him with a cool chess analysis thing he was playing with - and I suggested we extreme program a prototype using haskell - it was pretty amazing to pair program with because it's so frikkin simple to describe data structures / algorithms with. "
          , FlowParagraph "For background, Gavin wouldn't call himself a programmer, and he doesn't have much interest in writing code generally - but he is certainly a hacker and not afraid to dive in, as he does have a good grasp of technology, understanding data structures, algorithms etc - just very little career experience writing code."
          , FlowParagraph "So to start off - we simply described the 'data structures' of chess and we came up with the following:"
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
data Position =   H1 | H2 | H3 | H4 | H5 | H6 | H7 | H8
                | G1 | G2 | G3 | G4 | G5 | G6 | G7 | G8
                | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8
                | E1 | E2 | E3 | E4 | E5 | E6 | E7 | E8
                | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8
                | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8
                | B1 | B2 | B3 | B4 | B5 | B6 | B7 | B8
                | A1 | A2 | A3 | A4 | A5 | A6 | A7 | A8

data Colour = White | Black
data Type   = Pawn | Bishop | Knight | Rook | Queen | King

type Col    = Int
type Row    = Int
type Coord  = (Col, Row)

type Piece  = (Colour, Type)
type Board  = Map.Map Position Piece
"""
                }
          , FlowParagraph "I guess we could have just implicitly used (x,y) coordinates for board positions, but I felt it would be cooler to just enumerate all the positions by name, especially as it's such a limited set. I personally ummm-ed and ahhh-ed around this for a while (i guess while Gavin groaned silently on the other side of the discord call). Eventually came up with the above and decided it would be best to simply just build some functions to convert from (x,y) coords to and from board positions, as well as do some basic maths on them (eg. adding them). I'm pretty sure I dropped the word 'isomorphic' at this point of the conversation, which no doubt made me feel cleverer to myself, but almost certainly at the cost of another groan over discord."
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
toCoord :: Position -> Coord
toCoord pos = positionCoords Map.! pos

fromCoord :: Coord -> Maybe Position
fromCoord colrow = 
    fst <$> List.find (\(p, colrow') -> colrow == colrow') (Map.toList positionCoords)

-- Escape hatch for when we are feeling really lazy!
unsafeFromCoord :: Coord -> Position
unsafeFromCoord = fromJust . fromCoord

-- Make coords (+)able
(|+|) :: (Col, Row) -> (Col, Row) -> (Col, Row)
(col1, row1) |+| (col2, row2) = (col1 + col2, row1 + row2)
infixl 6 |+|
"""
                }
          , FlowParagraph "So once we have that out of the way, it's just a matter of encoding all the possible moves a chess piece can make. And how unbelievably terse is this:"
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
calc :: [Coord] -> Position -> [Position]
calc deltas pos = mapMaybe (\d -> fromCoord $ toCoord pos |+| d) deltas

moves :: Piece -> Position -> [Position]
moves (White, Pawn)  = calc [(-1, 1), (1, 1)]
moves (Black, Pawn)  = calc [(-1, -1), (1, -1)]
moves (_, Knight)    = calc [(-1, 2), (1, 2), (-2, -1), (-2, 1), (-1, -2), (1, -2), (2, 1), (2, -1)]
moves (_, Rook)      = calc $ join [[(x, 0), (-x, 0), (0, x), (0, -x)] | x <- [1..8]]
moves (_, Bishop)    = calc $ join [[(x, x), (-x, x), (x, -x), (-x, -x)] | x <- [1..8]]
moves (_, Queen)     = calc $ join [[(x, 0), (-x, 0), (0, x), (0, -x), (x, x), (-x, x), (x, -x), (-x, -x)] | x <- [1..8]]
moves (_, King)      = calc [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
"""
                }
          , FlowParagraph "Ok, so this is a bit of a cheat - because it doesn't take into account any other pieces - it's just all the possible moves. But this is good enough for our basic analysis we were wanting to play with (which i don't have time to explain, and is out of scope of this article!)."
          , FlowParagraph "The point being - it was really easy and quick to collaboratively code up and have a conversation around a particular chess analysis within a very short period (just over 2 hours) - simply using a language which is so expressive and easily understandable by a non-programmer. And although it wasn't about the code being written, it was a very nice way of 'whiteboarding' some chess analysis ideas that Gavin had, by giving him a few easy to understand type primitives, and then jointly thinking about the algorithms that might be interesting to apply to those types."
          , FlowParagraph "Some example outputs of being able to print a simple chess board:"
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
_______1_____2_____3_____4_____5_____6_____7_____8
H|    BR    BK    BB    BK    BQ    BB    BK    BR
G|    BP    BP    BP    BP    BP    BP    BP    BP
F|
E|
D|
C|
B|    WP    WP    WP    WP    WP    WP    WP    WP
A|    WR    WK    WB    WK    WQ    WB    WK    WR
"""
                }
          , FlowParagraph "And a more interesting version where we are printing a particular analysis of board position (a simple count of potential attacking pieces, per position):"
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
_______1_____2_____3_____4_____5_____6_____7_____8
H|  BR=1  BK=0  BB=0  BK=0  BQ=1  BB=0  BK=0  BR=1
G|  BP=1  BP=0  BP=0  BP=0  BP=1  BP=0  BP=0  BP=1
F|    =2    =0    =0    =0    =1    =0    =0    =2
E|    =2    =1    =0    =0    =1    =0    =1    =1
D|    =1    =1    =1    =0    =1    =1    =0    =2
C|    =4    =2    =4    =3    =4    =3    =3    =4
B|  WP=1  WP=1  WP=1  WP=4  WP=4  WP=1  WP=1  WP=1
A|  WR=2  WK=3  WB=4  WK=3  WQ=3  WB=3  WK=3  WR=2
"""
                }
          , FlowParagraph "Maybe the only thing I might be differently is start with PureScript, or maybe some sort of Haskell Notebook style editor - as the visualisation of data started to suck up too much time and got in our way."
          , FlowParagraph "Anyways, cool language for this type of approach and will definitely use this style again."
          ]
    }

imperative_is_jam ∷ Article
imperative_is_jam = Article
    { slug: "imperative-is-jam"
    , title: "Imperative is JaM™ (just a monad)"
    , keywords: []
    , cover: { src: "/images/covers/code_haskell_3.png", alt: "code", caption: Nothing }
    , author: tomwells
    , date: constructDate 2021 9 1
    , summary: "No summary yet"
    , body:
          [ FlowParagraph "I recently presented a session entitled 'JavaScript Gymnastics' to our team, which you can find embedded below. It was very long and probably way too complicated to get through interactively and in realtime and as I reviewed the video I realise there were probably a few fundamental ideas I missed."
          , FlowYouTube { id: "S7_ahn2CGnA" }
          , FlowParagraph "The idea is that a programmer CAN STILL write an 'Imperative Program', using a pure functional style. And my 'great-idea' was to try to describe this using JavaScript, which IS an imperative language to prove that. I.e. Use an Imperative Language in a Pure Functional Style to write an Imperative Program. Sounds crazy? Yes probably. But it was also fun to see, and I don't think the results were too bad! JavaScript is pretty awesome and would still be my go-to choice if I had to pick an all-rounder language."
          , FlowParagraph "So how do you write an Imperative Program in a Pure Functional Style? Thats the State Monad. So lets start with a very simple program:"
          , FlowSourceCode
                { lang: JavaScript
                , body:
                      """
const program = () => {
    var x = 1	// store 1 as x
    var y = 2	// store 2 as y
    x = x + 1	// lookup x, compute x + 1, store as x
    y = y * 2   // lookup y, compute y * 2, store as y
    return x + y
}
"""
                }
          , FlowParagraph ""
          , FlowParagraph ""
          ]
    }

its_just_a_monad ∷ Article
its_just_a_monad = Article
    { slug: "finding-purity-again"
    , title: "Finding purity again"
    , keywords: []
    , cover: { src: "/images/covers/code_haskell_2.png", alt: "code", caption: Nothing }
    , author: tomwells
    , date: constructDate 2021 2 16
    , summary: "No summary yet"
    , body:
          [ FlowParagraph "I'm getting back into Haskell since giving up on it around 2013 - of course due to work distractions, but mainly having the wrong expectation of what it would require from my brain to wrangle the fundamentals. At the time I found the syntax easy and beautiful, the paradigm of reductive programming very natural and the ability to describe and process data structures so elegant that I was absolutely smitten going through the beginner level tutorials and scratch programs."
          , FlowParagraph "You hit the wall pretty quickly however, as you start to learn Functors, Applicatives, Monoids and finally Monads. And although those seem ok in principle, my head was at it's limit trying to embed these new ideas. Very quickly though you discover that this is the tip of the iceberg, and in practise I ended up fighting and fighting - really just trying to get code compiling. If I couldn't get the basic stuff to compile, how the hell was I going to write real stuff?"
          , FlowParagraph "There was something I did not understand, and it was fundamental. I had a hole in my brain, I was missing the building blocks, the intuition, the big picture. I gave up."
          , FlowSection "Enter Elm"
          , FlowParagraph "All was not lost however - as I found solace in other languages such as Javascript and Scala where I was able to apply a bunch of those basic ideas I had learned from Haskell. I wrote better, more pure, less buggy and more concurrent code. Life was good again for many years, until one day I was working on a project using React with Redux on the front-end connected via Websockets to KStreams based stream processing on the backend (trying to build a fully event-driven architecture) I discovered Elm. It turns out that Elm really invented the Redux pattern - and had built an entirely new language and framwork around this idea nicknamed The Elm Architecture - or TEA for short. Elm clicked immediately for me, I think in part due to it looking familiar and waking up that old dormant Haskelley part of my mind - but it was also really easy to pickup, and so perfectly fit-for-purpose it was easy to understand and just get productive."
          , FlowParagraph "It didn't take long and I was whacking out web front-ends using ELM in no time. Small internal projects, hobby projects, anything that wasn't 'customer' or needed to be 'production' or 'maintainable' much. It turns out I had a few, and within a few months I had written thousands of lines and Elm and was really ontop of it. Elm is the future!"
          , FlowSection "Exit Elm"
          , FlowParagraph "I quickly discovered its limits though - and especially the difficulty in writing single-page-apps - i.e. the kind where you have one app, but many different 'pages' with many different 'model-update-view' type loops in it based upon the context, and typically some sort of 'router' that can move you between contexts. Elm really sucks for this - and I really tried hard to make it work - but fundamentally it's predicated on the single mega update loop idea, and so you quite quickly start to make a huge mess of your data structures as you need to munge everything together into a single model, for that single update call. Blegh. So Elm is awesome, but only for really simple web apps - and I had to reclassify it in my mind as a fun academic experiment, and no longer as a potential tool for real work."
          , FlowSection "Enter Purescript"
          , FlowParagraph "Ahh this was the gateway drug for me. With Purescript I could write a very simple TEA type app, BUT I could also choose to combine many TEAs together to create a bigger single-page-app architecture. And Purescript looked basically the same as Elm from a syntax perspective so it was easy to switch quickly, and mostly could be made to fit into my mental model I had been building on. Purescript turns out to be MUCH more open and MUCH more general purpose - not limited to web application alone, but also able to be compiled to Javascript and executed by Nodejs. And although there was good Elm-like clones for Purescript, there are other potentially more interesting web models, such as Concur - which is closer to a webcomponents model, and so there is tons of choice."
          , FlowSection "Back to Haskell"
          , FlowParagraph "Through writing more console based stuff you soon encounter Effect and Aff in the Purescript world - which are the very interesting containers for holding synchronous and asynchronous 'side-effects' respectively. These are actually really easy to grasp initially, but soon become difficult when you need to do stuff a little more complex than 'hello world'. Another area that knocked me off track was understanding how you mix code in each of these 'containers', and very soon Monad Transformers (aka mtl) get mentioned and once again you are back to square 1 of feeling like a noob, and all those old feelings from 2015 come rushing back. This time however, I'm ready for it. I am more well-rounded. I can see the value. I know the curve is steep. But I am committed."
          , FlowImage $ { src: "/images/articles/just_a_monad/book.png", alt: "Practical Haskell Book", caption: Just "Practical Haskell - A Real World Guide to Programming - By Alejandro Serrano Mena" }
          , FlowParagraph "Hopefully the above helps!"
          ]
    }

new_one ∷ Article
new_one = Article
    { slug: ""
    , title: "A strategy of relevance"
    , keywords: []
    , cover: { src: "/images/articles/strategy_relevance/Cynefin_framework_by_Edwin_Stoop.jpg", alt: "The Cynefin Framework", caption: Just "By Edwin Stoop (User:Marillion!!62) - [1], CC BY-SA 4.0, https://commons.wikimedia.org/w/index.php?curid=53810658" }
    , author: tomwells
    , date: constructDate 2021 4 30
    , summary: "No summary yet"
    , body:
          [ FlowParagraph "One of the recurring challenges of running a software development company is the dreaded 'But what is our strategy?' discussion. As the lead of innovation at Synthesis, I have personally never struggled with needing to answer this as it always seemed obvious to me. But given the question rears it's head so often (and moreso in recent years - as we have grown in numbers) that it has triggered me to think more deeply about it, figure out a way to articulate it, and try to understand why it is that it's not so obvious to others."
          , FlowParagraph "Fundamentally we are a company that believes in technological evolution - we believe that technology changes quickly, "
          , FlowParagraph "One of the models I really like is called the Cynefin Framework (pronounced 'Kin-evan'), developed in the late 90's and incubated inside the IBM initially as a tool to help leaders make better decisions, but taking into account the "
          , FlowImage $ { src: "/images/articles/strategy_relevance/Cynefin_framework_by_Edwin_Stoop.jpg", alt: "The Cynefin Framework", caption: Just "The Cynefin Framework according to Wikipedia - Drawn by Edwin Stoop, CC BY-SA 4.0" }
          ]
    }

practical_functional_programming ∷ Article
practical_functional_programming = Article
    { slug: "practical-functional-programming"
    , title: "Practical functional programming"
    , keywords: [ "functional programming" ]
    , cover: { src: "/images/covers/code.png", alt: "code", caption: Nothing }
    , author: tomwells
    , date: constructDate 2015 12 3
    , summary: "No summary yet"
    , body:
          [ FlowParagraph "I *cringe* when I see this sort of code:"
          , FlowSourceCode
                { lang: CSharp
                , body:
                      """
var names = new List<string> { "tom", "dan", "warren" };

// Find the longest name in the list
//
var longest = names.First();
foreach (var name in names) {
    if (name.Length > longest.Length) {
        longest = name;
    }
}
"""
                }
          , FlowParagraph "Why is it so cringe-worthy? Because it's buggy and full of assumptions. Its very hard to write code like that this that isn't buggy, and really this is grade 11 style programming (no disrespect to any talented grade 11'ers out there!). "
          , FlowParagraph "Mainstream languages (e.g. Java, C#, etc) are introducing more and more features which promote a functional programming paradigm and when used correctly can rid the world of this style of code."
          , FlowParagraph ".NET developers who use LINQ and Lambda expressions have been doing it (possibly unknowingly) for years, and writing nice clean code by making use of higher-order functions:"

          , FlowSourceCode
                { lang: CSharp
                , body:
                      """
var names = new List<string> { "tom", "dan", "warren" };

// Find the longest name in the list
//
var longest = names
                .OrderByDescending((name) => name.Length)
                .First();

Console.Out.WriteLine ("The longest name is: {0}", longest);
"""
                }
          , FlowParagraph "This version is so much safer - and much simpler to understand. There is no mutation occurring either. Either the variable _longest_ exists or it doesn't. No halfway state while the code is running."
          , FlowParagraph "Use this stuff! You can find equivalents in most mainstream languages, my favourite being prelude for livescript."
          ]
    }

intro_to_fluid_infrastructure ∷ Article
intro_to_fluid_infrastructure = Article
    { slug: "intro-to-fluid-infrastructure"
    , title: "Intro to Fluid Infrastructure"
    , keywords: [ "infrastructure" ]
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

code_101_pass_by_reference ∷ Article
code_101_pass_by_reference = Article
    { slug: "code-101-pass-by-reference"
    , title: "Code 101: Pass by reference"
    , keywords: [ "programming" ]
    , cover: { src: "/images/covers/code.png", alt: "Code", caption: Nothing }
    , author: tomwells
    , date: constructDate 2014 6 9
    , summary: "No summary yet"
    , body:
          [ FlowParagraph "This is part 1 of a multi-part post on programming fundamentals. This stuff may seem fairly pedestrian to some folks, but then it's probably not targetted at you."
          , FlowSection "The mysterious _pass by reference_ thing"
          , FlowParagraph "And that actually there is no such thing as _'pass by reference'_ but simply that when passing a reference-type (aka. 'object' in java, c# or 'pointer to object' in c++) that it is actually the reference which is passed by value itself. I.e. a copy of a memory address points to the same piece of memory as the original memory address. This super-simple concept is fundamental to understanding almost everything there is to know about how stack and heap memory works."
          , FlowParagraph "The below code examples attempt to show what I mean. This is pseudo-code'ish, and anyone who knows java, c#, c or c++ should be able to follow."
          , FlowSourceCode
                { lang: CSharp
                , body:
                      """
void reset(int x)
{
    x = 5;
}

int a = 10;
reset(a);

print ("A is " + a); // Should print '10'
"""
                }
          , FlowParagraph "If you are surprised that '10' is printed above, then you definitely need to research this topic. Basically, a copy of the value contained by the variable 'a' is assigned to the method parameter 'x', which is in it's own right a separate variable. Thus when the value 5 is assigned to the variable 'x', it does not magically get also assigned back to 'a'. Therefore 'a' remains as it was, set to it's original value of '10' when the reset() function returns."
          , FlowParagraph "Only once you _get_ the above, can you move onto the difficulty in understanding the _'reference'_ bit."
          , FlowParagraph "So now lets make it more complex, introducing the mysterious _'reference'_ by way of an object (as before, lets assume java or c#):"
          , FlowSourceCode
                { lang: CSharp
                , body:
                      """
class Dog
{
    public Dog(int w)
    {
        this.v = w;
    }
    public int v;
}

void reset(Dog x)
{
    x = new Dog(5);
}

Dog a = new Dog(10);
reset(a);

print ("A is " + a.v); // Should print '10' still...
"""
                }
          , FlowParagraph "Ok, so now we've introduced a _'reference'_ type to overcome our issue in the previous example, and it may now come as a big surprise that this approach still has not had the desired effect of setting our value in the reset() function. Infact, the problem is _EXACTLY_ the same as our previous one. The variable 'x' is a _COPY_ of the value of the variable 'a', the only difference being that it just so happens to contain a reference to an object. When you assign some other value to 'x', it simply takes on the new value, it _does not_ magically pass this value back onto 'a'."
          , FlowParagraph "The only way to make meaningful use of the reference is to look-through to the original object:"
          , FlowSourceCode
                { lang: CSharp
                , body:
                      """
void reset(Dog x)
{
    x.v = 5;
}
"""
                }
          , FlowParagraph "If this seems basic and obvious - then good, you get it. If it doesn't, please re-produce this example and play with it until you're comfortable with the concept."
          , FlowParagraph "This particular problem is one that I love to explore in interview situations for potential developer roles - and after 3 years of running over 50 such sessions can honestly say that not more than 5-10% of developers _'get'_ this. And it may seem like something quite academic, and not important for real-world programming, and maybe only confined to languages like java, c#, c or c++ - but alas NO - this is fairly fundamental in even understanding stuff like AngularJS data binding in JS."
          ]
    }

livescript_rocking_your_world ∷ Article
livescript_rocking_your_world = Article
    { slug: "livescript-rocking-your-world"
    , title: "LiveScript <| Rocking your world.js"
    , keywords: [ "programming", "livescript" ]
    , cover: { src: "/images/covers/code.png", alt: "code", caption: Nothing }
    , author: tomwells
    , date: constructDate 2014 5 30
    , summary: "No summary yet"
    , body:
          [ FlowParagraph "I presented a TechSession(tm) to my development team last week which was meant to be about LiveScript. It turned out that in order to understand what the purpose of something like LiveScript is, you need to understand the beauty-warts of JavaScript (oxymoron intended)."
          , FlowParagraph "Basically, JavaScript is completely awesome. It's multi-paradigm (procedural or object-oriented or functional), everywhere, asynchronous and dynamic. Not everyone's cup of tea, but certainly a very strong choice for a broad range of programming tasks. However there are a couple of severe gotchas, which stem from it's long and sometimes weird history."
          , FlowSection "1. Type coercion oddliness"
          , FlowParagraph "JS is the king of coercion. It can coerce anything to a string basically, resulting in some surprising results."

          , FlowSection "2. Scope traps"
          , FlowParagraph "Variables are defined global by default (x=5;), unless you attach the magical 'var' keyword to them (var x=5;). Ouch."
          , FlowSourceCode
                { lang: JavaScript
                , body:
                      """
if ('1' == true) {
    x = 5;     // win! you have polluted global
    var y = 5; // fail! you kept it local...
}
"""
                }

          , FlowSection "3. Surprising behaviour"
          , FlowParagraph "A for-in-loop over a list returns the index into the list instead of each element, BUT a for-in-loop over an object returns the key to the object (win). Ok, ok, if you understand that the for-in-loop always returns the 'index' into the list or 'index' into the object thats totally consistent. The point is that I often find myself writing little mini for-in-loops while i'm developing to remind myself of what exactly is returned - meaning it's obviously weird :)"

          , FlowSection "4. This and that"
          , FlowParagraph "Anyone who's written object-oriented style in Javascript would have discovered that either they're going mad, or JS is broken in the 'this' department. Some people argue that 'this' is the 'functional scope' and therefore perfectly reasonable that it's set to whatever-the-hell-it-wants, but i'm not convinced that 'this' should more reasonably be a closure-captured variable of the outer scope (if it's available) and that some other magic variable called 'functional_this' should be set to the functional scope (exactly how every other closure-captured variable works!). I think it's a bug that no-one will admit to :)"

          , FlowSection "Enter [coffee|live]script"
          , FlowParagraph "So coffeescript and livescript profess to fix up all the issues in javascript - but simply abstracting another language layer over javascript, but fundamentally compiling to javascript. They both work extremely well at this and I totally recommend you use one of them over plain javascript to avoid a shed-ton of simple developer bugs resulting from all javascripts dev traps."
          , FlowParagraph "In my opinion coffee does a decent job, but promotes a more imperative style whereas livescript does an even better job, and promotes a more functional style. If you are comfortable with functional languages (specifically F# or Haskell) - then livescript will seem very familiar. If not, and you are alergic to functional, then probably best to stick with coffeescript to avoid any unnecessary high blood pressure..."
          ]
    }

a_word_on_monads ∷ Article
a_word_on_monads = Article
    { slug: "a-word-on-monads"
    , title: "A word on monads"
    , keywords: [ "haskell", "functional programming" ]
    , cover: { src: "/images/covers/code_haskell.png", alt: "code", caption: Nothing }
    , author: tomwells
    , date: constructDate 2014 4 15
    , summary: "No summary yet"
    , body:
          [ FlowParagraph "A clever guy once said that once you understand what a monad is you lose the ability to explain what it is to other people - and he's (almost) right. Monads are a weird and wonderful thing, but sometimes are easiest to understand when given an example of one."
          , FlowParagraph "I'm going to try and do this by example, so to set the scene - lets use something like the following data structure:"
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
data Person = Person {
    name :: String,
    mother :: Maybe Person,
    father :: Maybe Person
}
"""
                }
          , FlowParagraph "So it's super simple. A Person has a name, and optionally has a mother and/or father, specified by the type Maybe Person for each."
          , FlowParagraph "Ok so lets get some test data:"
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
gemma = Person {
    name = "Gemma",
    mother = Just Person {
        name = "Michelle",
        mother = Just Person { 
            name = "Sandy", 
            mother = Nothing, 
            father = Nothing 
        },
        father = Just Person { 
            name = "Tim", 
            mother = Nothing, 
            father = Nothing 
        }
    },
    father = Just Person {
        name = "Tom",
        mother = Just Person { 
            name = "Kate", 
            mother = Nothing, 
            father = Nothing 
        },
        father = Just Person { 
            name = "Bob", 
            mother = Nothing, 
            father = Nothing 
        }
    }
}
"""
                }
          , FlowParagraph "Sorry that uber terse, but it's simply:"
          , FlowSourceCode
                { lang: Pseudo
                , body:
                      """
.                   Sandy
                   /
         Michelle <
       /           \
Gemma <      Kate   Tim
       \    /
       Tom <
            \
             Bob
"""
                }
          , FlowParagraph "Next lets write a function which finds the the maternal grandparent (i.e. the mother of the mother):"
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
maternalgrandmother :: Person -> Maybe Person
maternalgrandmother p =
    case mother p of
        Nothing -> Nothing
        Just mom ->
            case mother mom of
                Nothing -> Nothing
                Just granny -> Just granny
"""
                }
          , FlowParagraph "The above is the simplest implementation, and simply solves the question by asking the following questions:"
          , FlowSourceCode
                { lang: Pseudo
                , body:
                      """
1. Does the person have a mother?
2a. If not, then return Nothing.
2b. If so, then does the mother have a mother?
3a. If not, then return Nothing.
3b. If so, then return that person (the granny).
"""
                }
          , FlowParagraph "And of course this would go on and on if we were looking for the grandgrandmother, and grandgrandgrandmother etc. So this is the sort of repetition where a monad might be useful. So in the above example, let me highlight the crap that we'd like to abstract out:"
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
    maternalgrandmother :: Person -> Maybe Person
    maternalgrandmother p =
    case mother p of
        Nothing -> Nothing
        Just mom ->
            case mother mom of
                Nothing -> Nothing
                Just granny -> Just granny
"""
                }
          , FlowParagraph "I.e. we just want the mother of the passed in person, and then the mother of that person - any interim value that happens to be Nothing should return Nothing back to the caller. Simple. So at best we want something like this:"
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
maternalgrandmother :: Person -> Maybe Person
maternalgrandmother p = mother $ mother p
    -- with the caveat that it should return Nothing
    -- when either 'p' is Nothing, or 'mother p' is
    -- Nothing. 'mother mother p' may be Nothing too
    -- but thats ok, because we return a Maybe Person
    -- so all good there
"""
                }
          , FlowParagraph "So this is basically our ideal implementation, but we're missing the mechanism to implement the 'return Nothing when interim results are Nothing' bit. It's captured nicely in the comment, but the compiler unfortunately isn't that clever. So this is where MONADS come in!"
          , FlowParagraph "The best sorta one-liner explanation of MONADS I could give is that they attempt to abstract the mechanism of computation of expressions in a particular context. I.e. in imperative languages, statements and expressions are computed in order, top to bottom. Obviously you have flow-control constructs to guide the computation in one way or another, but implictly the program will execute the statement on the next line once it's done with the current statement. This is a given."
          , FlowParagraph "HOWEVER - in a functional context (i.e. in haskell) - this 'one statement after the next computation strategy' is NOT a given, and infact the decision of HOW to compute, and the ORDER that computation occurs is the responsibility of the current MONAD in play."
          , FlowParagraph "So without going into how to actually define your own MONAD, lets rather just look at some existing ones and how they are used. For the example above, the perfect solution is called the MAYBE MONAD (surprise!). And it simply says keep evaluating functions bound into the monad until a function evals to Nothing then return Nothing (stop evalutating subsequent bound functions), otherwise return the evalation of the final bound function."
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
maternalgrandmother2 :: Person -> Maybe Person
maternalgrandmother2 p =
    mother p >>=
        (\m -> mother m >>=
            (\g -> return (g)))
"""
                }
          , FlowParagraph "This is much cleaner! The bind operator (>>=) takes care of all the ugly case handling for us. If either `mother p` or `mother m` returns Nothing, the entire expression returns Nothing. Otherwise, we get our granny wrapped in Just."
          , FlowParagraph "But we can make this even cleaner using do notation, which is syntactic sugar for chaining monadic operations:"
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
maternalgrandmother3 :: Person -> Maybe Person
maternalgrandmother3 p = do
    m <- mother p
    g <- mother m
    return g
"""
                }
          , FlowParagraph "The do notation makes the code read almost like imperative code, but with all the safety of monadic composition. Each line extracts the value from the Maybe, and if any step fails (returns Nothing), the entire computation short-circuits to Nothing."
          , FlowParagraph "Finally, we can also express this using Kleisli composition (>=>), which allows us to compose monadic functions directly:"
          , FlowSourceCode
                { lang: Haskell
                , body:
                      """
import Control.Monad ((>=>))

maternalgrandmother4 :: Person -> Maybe Person
maternalgrandmother4 = mother >=> mother
"""
                }
          , FlowParagraph "This is the most elegant solution! The Kleisli composition operator (>=>) lets us compose `mother` with itself, creating a function that goes directly from a person to their maternal grandmother. It's beautifully concise and captures the essence of what we're trying to do: apply the mother function twice in sequence."
          , FlowParagraph "All three approaches demonstrate the power of monads: they abstract away the boilerplate of checking for Nothing at each step, allowing us to focus on the essential logic of our computation. Whether you prefer the explicit bind operations, the readable do notation, or the elegant Kleisli composition depends on your style and the complexity of your monadic chain."
          ]
    }

restful_in_peace ∷ Article
restful_in_peace = Article
    { slug: "restful-in-peace"
    , title: "REST(ful) in peace..."
    , keywords: [ "architecture", "streaming", "realtime", "restful" ]
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

what_i_look_for_in_a_developer ∷ Article
what_i_look_for_in_a_developer = Article
    { slug: "what-i-look-for-in-a-developer"
    , title: "What I look for in a developer"
    , keywords: [ "programming", "interviews", "hiring", "team" ]
    , cover: { src: "/images/covers/code.png", alt: "code", caption: Nothing }
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