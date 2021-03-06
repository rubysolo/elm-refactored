module Page exposing (..)

import Pages.Login as Login
import Pages.Users as Users
import Pages.Groups as Groups
import Pages.Group as Group
import Pages.Batches as Batches

type Page
    = Blank
    | Error String
    | Home
    | Groups Groups.Model
    | Group Group.Model
    | Batches Batches.Model
    | Login Login.Model
    | Users Users.Model

