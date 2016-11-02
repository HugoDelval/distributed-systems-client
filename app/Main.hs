module Main where

import Control.Concurrent
import Network
import System.Environment
import System.IO
import Control.Exception.Base
import Network.HTTP
import Data.List.Split

buildHTTPMessage :: String -> String -> String -> String
buildHTTPMessage msg host port = "GET /echo.php?" ++ urlEncodeVars [("message", msg)] ++ " HTTP/1.1\r\nHost: " ++ host ++ ":" ++ port ++ "\r\n\r\n"

parseHTTPResponse :: String -> String
parseHTTPResponse httpMsg = "Response from server:\n" ++ last (splitOn "\r\n\r\n" httpMsg)

main :: IO ()
main = do
    [host, port, message] <- getArgs
    tcpHandler <- connectTo host $ PortNumber $ toEnum $ read port
    hSetBuffering tcpHandler  LineBuffering
    hPutStr tcpHandler $ buildHTTPMessage message host port
    hGetContents tcpHandler >>= putStr . parseHTTPResponse 
