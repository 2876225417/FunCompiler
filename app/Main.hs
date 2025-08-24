module Main where

import FunCompiler.Lexer (lexer) -- 从 "import Lib" 改为 "import FunCompiler.Lexer"
import System.Environment (getArgs)
import System.Exit (die)

main :: IO ()
main = do
  args <- getArgs
  case args of
    [filename] -> do
      content <- readFile filename
      putStrLn $ "正在分析文件 (Lexing file): " ++ filename
      let tokens = lexer content
      print tokens
    _ -> die "使用方法 (Usage): FunCompiler-exe <filename.c>"

