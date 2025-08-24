module FunCompiler.Lexer
  ( lexer,
    Token (..),
  )
where

import Data.Char (isAlpha, isAlphaNum, isDigit, isSpace)
import Data.List (isPrefixOf)

data Token
  = KwInt -- int
  | KwChar -- char
  | KwReturn -- return
  | KwIf -- if
  | KwWhile -- while
  | Identifier String -- string
  | IntegerConstant Int -- const int
  | StringLiteral String -- string(like "words")
  | OpPlus -- operator +
  | OpMinus -- operator -
  | OpMultiply -- operator *
  | OpDivide -- operator /
  | OpAssign -- operator =
  | OpEqual -- operator ==
  | OpNotEqual -- operator !=
  | OpLess -- operator <
  | OpLessEqual -- operator <=
  | OpGreater -- operator >
  | OpGreaterEqual -- operator >=
  | Semicolon -- ;
  | Comma -- ,
  | LParen -- (
  | RParen -- )
  | LBrace -- {
  | RBrace -- }
  | EOF -- End of File
  deriving (Show, Eq)

lexer :: String -> [Token]
lexer [] = [EOF]

-- lexer input =
--   case input of
--     (c:cs) | isSpace c -> lexer cs
--     '/' : '/' : cs -> lexer (dropWhile (/= '\n') cs)
--     '/' : '*' : cs ->
--       case comsume

consumeBlockComment :: String -> Maybe String
consumeBlockComment s =
  if "*/" `isPrefixOf` s
    then Just (drop 2 s)
    else case s of
      [] -> Nothing
      (_ : t) -> consumeBlockComment t

