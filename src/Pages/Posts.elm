module Pages.Posts exposing (..)

import Http
import Task exposing (Task)

import Models.Post exposing (Post)
import Request

type Msg
  = SetPostTitle String
  | SetPostDescription String
  | AddPost

type alias Model =
  { posts : List Post
  , newPostTitle : String
  , newPostDescription : String
  , errorMsg : String
  }

initialModel : Model
initialModel =
    { posts = []
    , newPostTitle = ""
    , newPostDescription = ""
    , errorMsg = ""
    }

init : Task Http.Error (List Post)
init =
  Request.fetchPosts

--init : Cmd Msg
--init =
--  Request.fetchPosts
--    |> Task.attempt FetchPostsLoaded


    --FetchPostsLoaded (Err msg) ->
    --  ({ model | errorMsg = Just "Failed to fetch posts" }, Cmd.none)
    --FetchPostsLoaded (Ok posts) ->
    --  ({ model | posts = posts }, Cmd.none)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    SetPostTitle title ->
      ({ model | newPostTitle = title }, Cmd.none)
    SetPostDescription description ->
      ({ model | newPostDescription = description }, Cmd.none)
    AddPost ->
      let
        newPost =
          { id = 1
          , title = model.newPostTitle
          , description = model.newPostDescription
          }
      in
        ({ model | posts = model.posts }, Cmd.none)
