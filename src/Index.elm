module Index exposing (..)

import Browser
import File exposing (File)
import Html exposing (Html, button, div, form, h1, input, text)
import Html.Attributes exposing (id, type_)
import Html.Events exposing (..)
import Json.Decode as D

type Msg
 = ChangeFileName String
 | ChangeNhi String
 | ChangeReportDate String
 | ChangeCategory String
 | ChangeCreateTask Bool
 | Submit
 | Reset

main : Program () Model Msg
main = 
  Browser.sandbox
    { init = init
    , view = view 
    , update = update
    }

type alias Form = 
    { filename : String
    , nhi : String
    , reportDate : String
    , category : String
    , isCreateTask: Bool
    }

type Model 
    = EnterData Form
    | Submitting Form
    | ValidationError String
    | SeviceError String
    | Done    

init : Model
init = 
    EnterData
        { filename = "dsf"
        , nhi = ""
        , reportDate = ""
        , category = ""
        , isCreateTask = False
        }



update : Msg -> Model -> Model
update msg model =
        model
view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Sign up" ]
        , Html.form []
            [ div []
                [ text "File name"
                , input [ id "filename", type_ "text"] []
                ]
            , div []
                [ text "NHI"
                , input [ id "nhi", type_ "text"] []
                ]
            , div []
                [ text "Report date"
                , input [ id "reportdate", type_ "text"] []
                ]
            , div []
                [ text "Category"
                , input [ id "reportdate", type_ "text"] []
                ] 
        , div []
                [ input [ id "reportdate", type_ "checkbox"] []
                , text "Create task"
                ]
            , div []
                [ button [ type_ "submit"]
                    [ text "Submit" ]
                ]
            , div []
                [ button [ type_ "button"]
                    [ text "Reset" ]
                ]
            ]
        ]