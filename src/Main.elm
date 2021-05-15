module Main exposing (Target)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type Target
    = BackOffice
    | FrontOffice


type BackendMessage
    = OnAir Target
    | OffAir Target

type LogEntry 
        = (Time.Posix, BackendMessage)

type Msg
    = GotMessage
    | SendMessage
    | ViewLog Bool
    | Toggle BackendMessage



{- gonna have ports to poll status -}


update model msg =
    case msg of
        GotMessage ->
            ( model, Cmd.none )

        SendMessage ->
            ( model, Cmd.none )

        ViewLog anymore ->
            ( model, Cmd.none )

        Toggle status target ->
            ( model, Cmd.none )


type alias Model =
    { backOfficeOnAir : Bool
    , frontOfficeOnAir : Bool
    , log : List LogEntry
    }


view model =
    div []
        [ officeToggleView FrontOffice model.frontOfficeOnAir
        , officeToggleView BackOffice model.backOfficeOnAir
        ]


officeToggleView target onAir =
    button
        [ class "full"
        , if onAir then
            class "red"

          else
            class "green"
        , onClick (OnAir target)
        ]
        [ targetNameHtml target ]


targetNameHtml target =
    case target of
        BackOffice ->
            text "Back Office"

        FrontOffice ->
            text "Front Office"
