module TomWellsOrg.Stream where

import Prelude

import TomWellsOrg.Domain (FlowComponent(..), StreamEntry)
import TomWellsOrg.Functions (constructDate)

content ∷ Array StreamEntry
content =
    [ { date: constructDate 2023 3 2
      , entry:
            [ FlowParagraph "Tom talks Rust - Episode 5"
            , FlowParagraph "Ownership"
            , FlowYouTube { id: "xVq5I3Ceyy8" }
            ]
      }
    , { date: constructDate 2023 3 2
      , entry:
            [ FlowParagraph "Tom talks Rust - Episode 4"
            , FlowParagraph "Syntax and features"
            , FlowYouTube { id: "qsauK6j3pIk" }
            ]
      }
    , { date: constructDate 2023 3 2
      , entry:
            [ FlowParagraph "Tom talks Rust - Episode 3"
            , FlowParagraph "Getting started"
            , FlowYouTube { id: "GddOvNtFB1E" }
            ]
      }
    , { date: constructDate 2023 3 2
      , entry:
            [ FlowParagraph "Tom talks Rust - Episode 2"
            , FlowParagraph "Overview and sales pitch"
            , FlowYouTube { id: "ePbp_wco-w4" }
            ]
      }
    , { date: constructDate 2023 3 2
      , entry:
            [ FlowParagraph "Tom talks Rust - Episode 1"
            , FlowParagraph "Introduction and setting the scene"
            , FlowYouTube { id: "0gOJVNH2Lzo" }
            ]
      }
    , { date: constructDate 2022 6 15
      , entry:
            [ FlowParagraph "Learn Haskell Together! Episode 1 - Lambda Calculus"
            , FlowParagraph "Working through the Haskell Book (haskellbook.com) - starting with Chapter 1!"
            , FlowYouTube { id: "LLO9tlNiWfg" }
            ]
      }
    , { date: constructDate 2022 4 14
      , entry:
            [ FlowParagraph "The Matt Brown Show Interview"
            , FlowParagraph "Invited to talk on the Matt Brown show around the future of payments, including Halo - our innovative tap-on-phone product"
            , FlowYouTube { id: "_qN2nEsu-RY" }
            ]
      }
    , { date: constructDate 2022 2 1
      , entry:
            [ FlowParagraph "Web3 for developers - Q&A Session"
            , FlowParagraph "An interesting Q&A session following the previous Web3 session."
            , FlowYouTube { id: "z0ow5r6mkkM" }
            ]
      }
    , { date: constructDate 2022 2 4
      , entry:
            [ FlowParagraph "Web3 for developers"
            , FlowParagraph "A deep dive into Web3 from first principles, understanding why it exists, what it is trying to solve, and then ending up with building a very simple Hello World smart-contract and wiring it up to a basic web application to form a complete dApp."
            , FlowYouTube { id: "Bh_jFToqvoU" }
            ]
      }
    , { date: constructDate 2022 1 11
      , entry:
            [ FlowParagraph "A re-post of my DEVconf May 2019 talk about Streaming Architecture"
            , FlowYouTube { id: "yVXpa-KhbaY" }
            ]
      }
    , { date: constructDate 2021 11 16
      , entry:
            [ FlowParagraph "Using Unity to generate training data for image processing ML"
            , FlowParagraph "Very rough prototype of generating annotated ship gauge images for training a machine learning model"
            , FlowYouTube { id: "KlTK8--BxXs" }
            ]
      }
    , { date: constructDate 2021 10 14
      , entry:
            [ FlowParagraph "Pure FP Sessions - Intro to ELM #5"
            , FlowYouTube { id: "01lt9jYqXM8" }
            ]
      }
    , { date: constructDate 2021 10 7
      , entry:
            [ FlowParagraph "Pure FP Sessions - Intro to ELM #4"
            , FlowYouTube { id: "40iYFCf0Jt4" }
            ]
      }
    , { date: constructDate 2021 9 16
      , entry:
            [ FlowParagraph "Pure FP Sessions - Intro to ELM #3"
            , FlowYouTube { id: "so_F4hFSFGY" }
            ]
      }
    , { date: constructDate 2021 9 9
      , entry:
            [ FlowParagraph "Pure FP Sessions - Intro to ELM #2"
            , FlowYouTube { id: "gnjc-dZ6soQ" }
            ]
      }
    , { date: constructDate 2021 9 2
      , entry:
            [ FlowParagraph "Pure FP Sessions - Intro to ELM #1"
            , FlowYouTube { id: "KgKi5hVTvik" }
            ]
      }
    , { date: constructDate 2021 8 4
      , entry:
            [ FlowParagraph "A flash-fire interview with Howard and Tom"
            , FlowYouTube { id: "M4wVVqdKfxI" }
            ]
      }
    , { date: constructDate 2021 7 29
      , entry:
            [ FlowParagraph "A 'fun' tech session I gave at Synthesis stretching JavaScript to use it in a pure functional way - eventually implementing what looks a bunch like the State Monad."
            , FlowYouTube { id: "S7_ahn2CGnA" }
            ]
      }
    , { date: constructDate 2021 7 22
      , entry:
            [ FlowParagraph "A 15 minute primer on the Synthesis Technical Innovation Strategy (tm, hehe) that has worked for us for the last 22 years!"
            , FlowYouTube { id: "RFWeMwEopvE" }
            ]
      }
    , { date: constructDate 2021 7 12
      , entry:
            [ FlowParagraph "I got pretty hung-up on a particular topic during an interview around the payments landscape and couldn't stop talking about the 'Distributed Economy'. Was a good opportunity to get my thoughts in order with a willing listener - turned out to be some pearls of wisedom in there (or madness??)!"
            , FlowYouTube { id: "nek4EOCOzvE" }
            ]
      }
    , { date: constructDate 2021 7 2
      , entry:
            [ FlowParagraph "My Future of Banking Podcast interview was translated into an article."
            , FlowLink { title: ">> Brave Banking <<", link: "https://www.bbrief.co.za/2021/07/02/brave-banking/" }
            ]
      }
    , { date: constructDate 2021 6 11
      , entry:
            [ FlowParagraph "I was invited to talk about the Future of Banking on the Synthesis Podcast with Howard Feldman - check it out below!"
            , FlowYouTube { id: "DrcHAMpoZSY" }
            ]
      }
    , { date: constructDate 2021 3 23
      , entry:
            [ FlowParagraph "Episode #12 of Learning PureScript together is out!"
            , FlowParagraph "In this one we take a round-trip around Functor, Apply, Applicative and Bind (solid foundational type classes)"
            , FlowYouTube { id: "7cmlAuk9JZc" }
            ]
      }
    , { date: constructDate 2021 3 16
      , entry:
            [ FlowParagraph "Episode #11 of Learning PureScript together is out!"
            , FlowYouTube { id: "9opVDV8Fkzo" }
            ]
      }
    , { date: constructDate 2021 3 10
      , entry:
            [ FlowParagraph "A glimpse into the future with Synthesis Labs"
            , FlowYouTube { id: "eVq11a8rS9Q" }
            ]
      }
    , { date: constructDate 2021 3 9
      , entry:
            [ FlowParagraph "Episode #10 of Learning PureScript together is out!"
            , FlowYouTube { id: "NplZ9s_FX84" }
            ]
      }
    , { date: constructDate 2021 2 23
      , entry:
            [ FlowParagraph "Episode #9 of Learning PureScript together is out!"
            , FlowYouTube { id: "U_0CCmweGvY" }
            ]
      }
    , { date: constructDate 2021 2 18
      , entry:
            [ FlowParagraph "Synthesis orientation session - talking about culture and some of our rituals"
            , FlowYouTube { id: "HXMDwS3W900" }
            ]
      }
    , { date: constructDate 2021 2 16
      , entry:
            [ FlowParagraph "Episode #8 of Learning PureScript together is out!"
            , FlowYouTube { id: "5W1UtykARsI" }
            ]
      }
    , { date: constructDate 2021 1 22
      , entry:
            [ FlowParagraph "Introduction to functional programming"
            , FlowYouTube { id: "hqlR8H7BsP8" }
            ]
      }
    , { date: constructDate 2020 12 2
      , entry:
            [ FlowParagraph "Episode #7 of Learning PureScript together is out!"
            , FlowYouTube { id: "i7Nv_eNLTCA" }
            ]
      }
    , { date: constructDate 2020 11 27
      , entry:
            [ FlowParagraph "Episode #6 of Learning PureScript together is out!"
            , FlowYouTube { id: "tI94CLu4p3k" }
            ]
      }
    , { date: constructDate 2020 11 25
      , entry:
            [ FlowParagraph "Episode #5 of Learning PureScript together is out!"
            , FlowYouTube { id: "RHkS16_9Ha8" }
            ]
      }
    , { date: constructDate 2020 11 20
      , entry:
            [ FlowParagraph "Exploring event-driven: Hand waving and rabbit holes!"
            , FlowYouTube { id: "QxZTTVpJUk0" }
            ]
      }
    , { date: constructDate 2020 11 20
      , entry:
            [ FlowParagraph "Episode #4 of Learning PureScript together is out!"
            , FlowYouTube { id: "zjZjFDe7TSY" }
            ]
      }
    , { date: constructDate 2020 11 19
      , entry:
            [ FlowParagraph "Episode #3 of Learning PureScript together is out!"
            , FlowYouTube { id: "Gs4NlBFDRN4" }
            ]
      }
    , { date: constructDate 2020 11 13
      , entry:
            [ FlowParagraph "Episode #2 of Learning PureScript together is out!"
            , FlowYouTube { id: "qyTcnR7bndo" }
            ]
      }
    , { date: constructDate 2020 11 11
      , entry:
            [ FlowParagraph "Episode #1 of Learning PureScript together is out!"
            , FlowYouTube { id: "bsZvjFAf9ig" }
            ]
      }
    , { date: constructDate 2020 8 19
      , entry:
            [ FlowParagraph "Mapping my house using photogrammetry"
            , FlowYouTube { id: "l1qAHhIXMfs" }
            ]
      }
    , { date: constructDate 2020 5 22
      , entry:
            [ FlowParagraph "Flink deep dive - conceptual and real examples"
            , FlowYouTube { id: "_8fHV5woDtQ" }
            ]
      }
    , { date: constructDate 2020 4 9
      , entry:
            [ FlowParagraph "Unity3D hands on introduction"
            , FlowYouTube { id: "2LMu2HQl_4c" }
            ]
      }
    , { date: constructDate 2020 4 8
      , entry:
            [ FlowParagraph "WebRTC - Overview and tutorial"
            , FlowYouTube { id: "0r3mEBktuxQ" }
            ]
      }
    ]
