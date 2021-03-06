module Main where

import Language.Lua.Lexer

import Control.Monad
import Data.Loc
import Text.Printf

main :: IO ()
main = forever $ do
    tks <- streamToList . runLexer luaLexer "stdin" <$> getLine
    putStr "[ "
    mapM_ (\(L loc tk) -> printf "%s @ %s, " (show tk) (show loc)) tks
    putStrLn "]"
