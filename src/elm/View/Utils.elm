module View.Utils exposing (..)

import Bulma.Columns exposing (..)
import Bulma.Modifiers exposing (Width(..))


ardColumnModifiers : Width -> Maybe Width -> ColumnModifiers
ardColumnModifiers offset width =
  let
    widths = columnModifiers.widths
  in
    { columnModifiers | offset = offset, widths =
      { widths | tablet = width, desktop = width, widescreen = width, fullHD = width }}
