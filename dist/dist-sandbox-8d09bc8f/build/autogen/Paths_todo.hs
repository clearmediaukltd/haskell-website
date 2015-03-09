module Paths_todo (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/chris/Documents/Work/Haskell/haskell-web/.cabal-sandbox/bin"
libdir     = "/Users/chris/Documents/Work/Haskell/haskell-web/.cabal-sandbox/lib/x86_64-osx-ghc-7.8.3/todo-0.0.1"
datadir    = "/Users/chris/Documents/Work/Haskell/haskell-web/.cabal-sandbox/share/x86_64-osx-ghc-7.8.3/todo-0.0.1"
libexecdir = "/Users/chris/Documents/Work/Haskell/haskell-web/.cabal-sandbox/libexec"
sysconfdir = "/Users/chris/Documents/Work/Haskell/haskell-web/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "todo_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "todo_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "todo_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "todo_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "todo_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
