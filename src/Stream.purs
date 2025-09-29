module TomWellsOrg.Stream where

import Prelude

import TomWellsOrg.Domain (FlowComponent(..), StreamEntry)
import TomWellsOrg.Functions (constructDate)

content ∷ Array StreamEntry
content =
    [ { date: constructDate 2025 09 29
      , entry:
            [ FlowMinorHeader "Type Safety and Composition of Agents"
            , FlowParagraph "A technical session presented to my team around building better Agents through leveraging type safety & composition. Familiar ideas to to functional programmers, and now through the lense of designing Agents."
            , FlowYouTube { id: "3O_OfNDFa_Q" }
            ]
      }
    , { date: constructDate 2024 10 9
      , entry:
            [ FlowMinorHeader "A whirl around Parsec (a popular haskell parsing module)"
            , FlowParagraph "Parsec is a swiss army knife for building parsers in haskell - it can be scary when first starting out but very simple once you get over the initial curve. In this session we take a stab at hacking our way through building a basic parser for a simple MUD like set of actions. This was an open and interactive session with a group of haskell-curious guys of various levels so we also spend some time discussion general haskell features too as questions arise!"
            , FlowYouTube { id: "ZqjmKpWEi0I" }
            ]
      }
    , { date: constructDate 2023 8 4
      , entry:
            [ FlowMinorHeader "So yeah rust... Why you should consider Rust next!"
            , FlowParagraph "A nice and quick whirl-wind around the Rust programming language, and some of the features that should put it high up on your priority list of languages to learn next!"
            , FlowYouTube { id: "LeA10SZPxJg" }
            ]
      }
    , { date: constructDate 2023 4 26
      , entry:
            [ FlowMinorHeader "A vision for building AI-driven applications"
            , FlowParagraph "A fun discussion around the state of building AI-driven applications today (in the AutoGPT / BabyAGI sense) and a vision of what we could expect to see the developer experience looking like in the future."
            , FlowYouTube { id: "9_tqXgfgE1o" }
            ]
      }
    , { date: constructDate 2023 4 16
      , entry:
            [ FlowMinorHeader "Featured on: AI as part of the developers toolkit"
            , FlowParagraph "Co-Founder of Responsive Digital, Andrew McElroy sits down for a virtual fireside chat with Synthesis Chief Disruption Officer Tom Wells to have a developer centric look at AI as well as programming language Rust."
            , FlowYouTube { id: "HWqkfflCZxQ" }
            ]
      }
    , { date: constructDate 2023 3 21
      , entry:
            [ FlowMinorHeader "Galactica Demo #shorts #gpt"
            , FlowParagraph "Galactica is a fun developer tool I developed using OpenAI GPT-4 to bring the power closer to your shell"
            , FlowLink { title: "More info on using and downloading Galactica here", link: "https://galacticai.co" }
            , FlowParagraph "Watch a short demo below"
            , FlowYouTubeShorts { id: "sy2f-kC9AEI" }
            ]
      }
    , { date: constructDate 2023 3 2
      , entry:
            [ FlowMinorHeader "Tom talks Rust - Episode 5"
            , FlowParagraph "Ownership"
            , FlowYouTube { id: "xVq5I3Ceyy8" }
            ]
      }
    , { date: constructDate 2023 3 2
      , entry:
            [ FlowMinorHeader "Tom talks Rust - Episode 4"
            , FlowParagraph "Syntax and features"
            , FlowYouTube { id: "qsauK6j3pIk" }
            ]
      }
    , { date: constructDate 2023 3 2
      , entry:
            [ FlowMinorHeader "Tom talks Rust - Episode 3"
            , FlowParagraph "Getting started"
            , FlowYouTube { id: "GddOvNtFB1E" }
            ]
      }
    , { date: constructDate 2023 3 2
      , entry:
            [ FlowMinorHeader "Tom talks Rust - Episode 2"
            , FlowParagraph "Overview and sales pitch"
            , FlowYouTube { id: "ePbp_wco-w4" }
            ]
      }
    , { date: constructDate 2023 3 2
      , entry:
            [ FlowMinorHeader "Tom talks Rust - Episode 1"
            , FlowParagraph "Introduction and setting the scene"
            , FlowYouTube { id: "0gOJVNH2Lzo" }
            ]
      }
    , { date: constructDate 2022 6 15
      , entry:
            [ FlowMinorHeader "Learn Haskell Together! Episode 1 - Lambda Calculus"
            , FlowParagraph "Working through the Haskell Book (haskellbook.com) - starting with Chapter 1!"
            , FlowYouTube { id: "LLO9tlNiWfg" }
            ]
      }
    , { date: constructDate 2022 4 14
      , entry:
            [ FlowMinorHeader "The Matt Brown Show Interview"
            , FlowParagraph "Invited to talk on the Matt Brown show around the future of payments, including Halo - our innovative tap-on-phone product"
            , FlowYouTube { id: "_qN2nEsu-RY" }
            ]
      }
    , { date: constructDate 2022 2 1
      , entry:
            [ FlowMinorHeader "Web3 for developers - Q&A Session"
            , FlowParagraph "An interesting Q&A session following the previous Web3 session."
            , FlowYouTube { id: "z0ow5r6mkkM" }
            ]
      }
    , { date: constructDate 2022 2 4
      , entry:
            [ FlowMinorHeader "Web3 for developers"
            , FlowParagraph "A deep dive into Web3 from first principles, understanding why it exists, what it is trying to solve, and then ending up with building a very simple Hello World smart-contract and wiring it up to a basic web application to form a complete dApp."
            , FlowYouTube { id: "Bh_jFToqvoU" }
            ]
      }
    , { date: constructDate 2022 1 11
      , entry:
            [ FlowMinorHeader "A re-post of my DEVconf May 2019 talk about Streaming Architecture"
            , FlowYouTube { id: "yVXpa-KhbaY" }
            ]
      }
    , { date: constructDate 2021 11 16
      , entry:
            [ FlowMinorHeader "Using Unity to generate training data for image processing ML"
            , FlowParagraph "Very rough prototype of generating annotated ship gauge images for training a machine learning model"
            , FlowYouTube { id: "KlTK8--BxXs" }
            ]
      }
    , { date: constructDate 2021 10 14
      , entry:
            [ FlowMinorHeader "Pure FP Sessions - Intro to ELM #5"
            , FlowYouTube { id: "01lt9jYqXM8" }
            ]
      }
    , { date: constructDate 2021 10 7
      , entry:
            [ FlowMinorHeader "Pure FP Sessions - Intro to ELM #4"
            , FlowYouTube { id: "40iYFCf0Jt4" }
            ]
      }
    , { date: constructDate 2021 9 16
      , entry:
            [ FlowMinorHeader "Pure FP Sessions - Intro to ELM #3"
            , FlowYouTube { id: "so_F4hFSFGY" }
            ]
      }
    , { date: constructDate 2021 9 9
      , entry:
            [ FlowMinorHeader "Pure FP Sessions - Intro to ELM #2"
            , FlowYouTube { id: "gnjc-dZ6soQ" }
            ]
      }
    , { date: constructDate 2021 9 2
      , entry:
            [ FlowMinorHeader "Pure FP Sessions - Intro to ELM #1"
            , FlowYouTube { id: "KgKi5hVTvik" }
            ]
      }
    , { date: constructDate 2021 8 4
      , entry:
            [ FlowMinorHeader "A flash-fire interview with Howard and Tom"
            , FlowYouTube { id: "M4wVVqdKfxI" }
            ]
      }
    , { date: constructDate 2021 7 29
      , entry:
            [ FlowMinorHeader "A 'fun' tech session I gave at Synthesis stretching JavaScript to use it in a pure functional way - eventually implementing what looks a bunch like the State Monad."
            , FlowYouTube { id: "S7_ahn2CGnA" }
            ]
      }
    , { date: constructDate 2021 7 22
      , entry:
            [ FlowMinorHeader "A 15 minute primer on the Synthesis Technical Innovation Strategy (tm, hehe) that has worked for us for the last 22 years!"
            , FlowYouTube { id: "RFWeMwEopvE" }
            ]
      }
    , { date: constructDate 2021 7 12
      , entry:
            [ FlowMinorHeader "I got pretty hung-up on a particular topic during an interview around the payments landscape and couldn't stop talking about the 'Distributed Economy'. Was a good opportunity to get my thoughts in order with a willing listener - turned out to be some pearls of wisedom in there (or madness??)!"
            , FlowYouTube { id: "nek4EOCOzvE" }
            ]
      }
    , { date: constructDate 2021 7 2
      , entry:
            [ FlowMinorHeader "My Future of Banking Podcast interview was translated into an article."
            , FlowLink { title: ">> Brave Banking <<", link: "https://www.bbrief.co.za/2021/07/02/brave-banking/" }
            ]
      }
    , { date: constructDate 2021 6 11
      , entry:
            [ FlowMinorHeader "I was invited to talk about the Future of Banking on the Synthesis Podcast with Howard Feldman - check it out below!"
            , FlowYouTube { id: "DrcHAMpoZSY" }
            ]
      }
    , { date: constructDate 2021 3 23
      , entry:
            [ FlowMinorHeader "Episode #12 of Learning PureScript together is out!"
            , FlowParagraph "In this one we take a round-trip around Functor, Apply, Applicative and Bind (solid foundational type classes)"
            , FlowYouTube { id: "7cmlAuk9JZc" }
            ]
      }
    , { date: constructDate 2021 3 16
      , entry:
            [ FlowMinorHeader "Episode #11 of Learning PureScript together is out!"
            , FlowYouTube { id: "9opVDV8Fkzo" }
            ]
      }
    , { date: constructDate 2021 3 10
      , entry:
            [ FlowMinorHeader "A glimpse into the future with Synthesis Labs"
            , FlowYouTube { id: "eVq11a8rS9Q" }
            ]
      }
    , { date: constructDate 2021 3 9
      , entry:
            [ FlowMinorHeader "Episode #10 of Learning PureScript together is out!"
            , FlowYouTube { id: "NplZ9s_FX84" }
            ]
      }
    , { date: constructDate 2021 2 23
      , entry:
            [ FlowMinorHeader "Episode #9 of Learning PureScript together is out!"
            , FlowYouTube { id: "U_0CCmweGvY" }
            ]
      }
    , { date: constructDate 2021 2 18
      , entry:
            [ FlowMinorHeader "Synthesis orientation session - talking about culture and some of our rituals"
            , FlowYouTube { id: "HXMDwS3W900" }
            ]
      }
    , { date: constructDate 2021 2 16
      , entry:
            [ FlowMinorHeader "Episode #8 of Learning PureScript together is out!"
            , FlowYouTube { id: "5W1UtykARsI" }
            ]
      }
    , { date: constructDate 2021 1 22
      , entry:
            [ FlowMinorHeader "Introduction to functional programming"
            , FlowYouTube { id: "hqlR8H7BsP8" }
            ]
      }
    , { date: constructDate 2020 12 2
      , entry:
            [ FlowMinorHeader "Episode #7 of Learning PureScript together is out!"
            , FlowYouTube { id: "i7Nv_eNLTCA" }
            ]
      }
    , { date: constructDate 2020 11 27
      , entry:
            [ FlowMinorHeader "Episode #6 of Learning PureScript together is out!"
            , FlowYouTube { id: "tI94CLu4p3k" }
            ]
      }
    , { date: constructDate 2020 11 25
      , entry:
            [ FlowMinorHeader "Episode #5 of Learning PureScript together is out!"
            , FlowYouTube { id: "RHkS16_9Ha8" }
            ]
      }
    , { date: constructDate 2020 11 20
      , entry:
            [ FlowMinorHeader "Exploring event-driven: Hand waving and rabbit holes!"
            , FlowYouTube { id: "QxZTTVpJUk0" }
            ]
      }
    , { date: constructDate 2020 11 20
      , entry:
            [ FlowMinorHeader "Episode #4 of Learning PureScript together is out!"
            , FlowYouTube { id: "zjZjFDe7TSY" }
            ]
      }
    , { date: constructDate 2020 11 19
      , entry:
            [ FlowMinorHeader "Episode #3 of Learning PureScript together is out!"
            , FlowYouTube { id: "Gs4NlBFDRN4" }
            ]
      }
    , { date: constructDate 2020 11 13
      , entry:
            [ FlowMinorHeader "Episode #2 of Learning PureScript together is out!"
            , FlowYouTube { id: "qyTcnR7bndo" }
            ]
      }
    , { date: constructDate 2020 11 11
      , entry:
            [ FlowMinorHeader "Episode #1 of Learning PureScript together is out!"
            , FlowYouTube { id: "bsZvjFAf9ig" }
            ]
      }
    , { date: constructDate 2020 8 19
      , entry:
            [ FlowMinorHeader "Mapping my house using photogrammetry"
            , FlowYouTube { id: "l1qAHhIXMfs" }
            ]
      }
    , { date: constructDate 2020 5 22
      , entry:
            [ FlowMinorHeader "Flink deep dive - conceptual and real examples"
            , FlowYouTube { id: "_8fHV5woDtQ" }
            ]
      }
    , { date: constructDate 2020 4 9
      , entry:
            [ FlowMinorHeader "Unity3D hands on introduction"
            , FlowYouTube { id: "2LMu2HQl_4c" }
            ]
      }
    , { date: constructDate 2020 4 8
      , entry:
            [ FlowMinorHeader "WebRTC - Overview and tutorial"
            , FlowYouTube { id: "0r3mEBktuxQ" }
            ]
      }
    ]
