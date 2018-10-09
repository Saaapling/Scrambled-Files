module Penguins where
  data WherePenguinsLive =
      Galapagos
    | Antarctica
    | Austrailia
    | SouthAfrica
    | SouthAmerica
    deriving (Eq, Show)

  data Penguin =
    Peng WherePenguinsLive
    deriving (Eq, Show)

  isSouthAfrica :: WherePenguinsLive -> Bool
  isSouthAfrica SouthAfrica = True
  isSouthAfrica _ = False

  gimmeWhereTheyLive :: Penguin -> WherePenguinsLive
  gimmeWhereTheyLive (Peng whereitlives) = whereitlives

  humbolt = Peng SouthAmerica
  gentoo = Peng Antarctica
  macaroni = Peng Antarctica
  little = Peng Austrailia
  galapagos = Peng Galapagos

  galapagosPenguin :: Penguin -> Bool
  galapagosPenguin (Peng Galapagos) = True
  galapagosPenguin _ = False

  antarcticPenguin :: Penguin -> Bool
  antarcticPenguin (Peng Antarctica) = True
  antarcticPenguin _ = False

  antarcticOrGalapagos :: Penguin -> Bool
  antarcticOrGalapagos p = (galapagosPenguin p) || (antarcticPenguin p)
