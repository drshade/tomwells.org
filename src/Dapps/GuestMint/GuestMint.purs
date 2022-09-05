module TomWellsOrg.Dapps.GuestMint.Main where

import Prelude

import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as DOM
import Concur.React.Props (unsafeTargetValue)
import Concur.React.Props as Props
import Control.Alt ((<|>))
import Control.Monad.Except.Trans (ExceptT(..), runExceptT)
import Data.Array ((!!))
import Data.Either (Either(..))
import Data.Generic.Rep (class Generic)
import Data.Maybe (fromMaybe)
import Data.Show.Generic (genericShow)
import Effect.Aff (Aff)
import Effect.Aff.Class (liftAff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)

type NearWeb3 a = ExceptT NearFailure Aff a

data NearFailure = GeneralNearFailure String

derive instance genericNearFailure ∷ Generic NearFailure _
instance nearFailureShow ∷ Show NearFailure where
    show = genericShow

data Action = Increment | Decrement | Reset

signOutButton ∷ ∀ a. Widget HTML a
signOutButton = do
    _ ← void $ DOM.a [ Props.href "#", Props.onClick ] [ DOM.text "signout" ]
    _ ← liftAff $ runExceptT $ signOutWallet
    DOM.text "Signed out! You should probably also de-authorise the app from the near wallet for hygiene"

connectWalletThen ∷ ∀ a. Widget HTML a → Widget HTML a
connectWalletThen widget = do

    stuff ← liftAff $ runExceptT $ do
        connected ← walletConnected
        account ← accountId
        pure { connected, account }

    case stuff of
        Left err → DOM.div [] [ DOM.text $ show err ]
        Right { connected: false } → do
            _ ← void $ DOM.button [ Props.onClick ] [ DOM.text "Connect Wallet to Post" ]
            _ ← liftAff $ runExceptT $ signInWallet
            DOM.text "Requested wallet connection... waiting for Near to redirect..."
        Right { connected: true, account: account } → do
            DOM.div []
                [ widget
                , DOM.text $ " (connected as " <> account <> " - "
                , signOutButton
                , DOM.text ")"
                ]

listMessagesWidget ∷ ∀ a. Widget HTML a
listMessagesWidget = do
    stuff ← liftAff $ runExceptT messages
    case stuff of
        Left err → DOM.div [] [ DOM.text $ show err ]
        Right msgs →
            let
                renderAuthor ∷ Array String → Widget HTML a
                renderAuthor msg = DOM.span [] [ DOM.text $ fromMaybe "unknown" $ msg !! 0 ]

                renderMessage ∷ Array String → Widget HTML a
                renderMessage msg = DOM.span [] [ DOM.text $ fromMaybe "unknown" $ msg !! 1 ]
            in
                do
                    DOM.div [] $ (\msg → DOM.div [] [ renderAuthor msg, DOM.text ": ", renderMessage msg ]) <$> msgs

data AddMessageAction = Update String | Submit

addMessageWidget ∷ String → Widget HTML String
addMessageWidget msg = do
    action ← DOM.span []
        [ DOM.input [ (Update <<< unsafeTargetValue) <$> Props.onChange, Props.placeholder "Write a message" ]
        , DOM.button [ Submit <$ Props.onClick ] [ DOM.text "Send" ]
        ]
    case action of
        Update newMsg → addMessageWidget newMsg
        Submit → pure msg

guestbook ∷ ∀ a. Widget HTML a
guestbook = do
    newMessage ← DOM.div []
        [ listMessagesWidget
        , connectWalletThen $ addMessageWidget ""
        ]
    _ ← DOM.text "Executing..." <|> (liftAff $ runExceptT $ addMessage newMessage)
    guestbook

root ∷ ∀ a. Widget HTML a
root = guestbook

type ForeignFunction a = ((NearFailure → Either NearFailure a) → (a → Either NearFailure a) → EffectFnAff (Either NearFailure a))

wrap ∷ ∀ a. ForeignFunction a → NearWeb3 a
wrap f = ExceptT $ fromEffectFnAff $ f Left Right

messages ∷ NearWeb3 (Array (Array String))
messages = wrap _messages

addMessage ∷ String → NearWeb3 Unit
addMessage message = wrap (_addMessage message)

walletConnected ∷ NearWeb3 Boolean
walletConnected = wrap _walletConnected

signInWallet ∷ NearWeb3 Unit
signInWallet = wrap _signInWallet

signOutWallet ∷ NearWeb3 Unit
signOutWallet = wrap _signOutWallet

accountId ∷ NearWeb3 String
accountId = wrap _accountId

foreign import _messages ∷ ForeignFunction (Array (Array String))
foreign import _addMessage ∷ String → ForeignFunction Unit

foreign import _walletConnected ∷ ForeignFunction Boolean
foreign import _signInWallet ∷ ForeignFunction Unit
foreign import _signOutWallet ∷ ForeignFunction Unit
foreign import _accountId ∷ ForeignFunction String
