module Test.Main where

import Prelude
import Control.Monad.Aff (Aff, attempt, launchAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log, logShow)
import Data.Either (isRight)
import Data.Maybe (Maybe(..))
import Test.Spec (it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (RunnerEffects, run)

main :: forall e. Eff (RunnerEffects _) Unit
main = run [consoleReporter] do
  it "should be true" $ do
    true `shouldEqual` true
