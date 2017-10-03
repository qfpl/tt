{ mkDerivation, base, checkers, lens, QuickCheck, stdenv, tasty
, tasty-hunit, tasty-quickcheck, time
}:
mkDerivation {
  pname = "tt";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base lens time ];
  testHaskellDepends = [
    base checkers lens QuickCheck tasty tasty-hunit tasty-quickcheck
  ];
  homepage = "https://github.com/qfpl/tt";
  description = "TT";
  license = stdenv.lib.licenses.bsd3;
}
