module Paths_ListFry (
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
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/longqm/.cabal/bin"
libdir     = "/home/longqm/.cabal/lib/x86_64-linux-ghc-7.4.1/ListFry-0.1.0.0"
datadir    = "/home/longqm/.cabal/share/x86_64-linux-ghc-7.4.1/ListFry-0.1.0.0"
libexecdir = "/home/longqm/.cabal/libexec"
sysconfdir = "/home/longqm/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ListFry_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ListFry_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "ListFry_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ListFry_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ListFry_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
