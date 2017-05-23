-- Copyright 2016 Morgan Thomas
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

module Data.Group where

import Data.Monoid (class Monoid)
import Data.Monoid.Additive (Additive(..))
import Data.Monoid.Dual (Dual(..))
import Prelude

-- | A `Group` is a `Monoid` with inverses. Instances
-- | must satisfy the following law in addition to the monoid laws:
-- |
-- | - Inverse: `forall x. ginverse x <> x = mempty = x <> ginverse x`
class Monoid g <= Group g where
  ginverse :: g -> g

-- | A `CommutativeSemigroup` is a `Semigroup` with a commutative operation.
-- | Instances must satisfy the following law in addition to the group laws:
-- |
-- | - Commutativity: `forall x, y. x <> y = y <> x`
class Semigroup g <= CommutativeSemigroup g

instance commutativeSemigroupVoid :: CommutativeSemigroup Void

instance groupUnit :: Group Unit where
  ginverse _ = unit

instance commutativeSemigroupUnit :: CommutativeSemigroup Unit

instance groupDual :: (Group g) => Group (Dual g) where
  ginverse (Dual x) = Dual (ginverse x)

instance commutativeSemigroupDual :: (CommutativeSemigroup g) => CommutativeSemigroup (Dual g)

instance groupAdditive :: (Ring r) => Group (Additive r) where
  ginverse (Additive x) = Additive (negate x)

instance commutativeSemigroupAdditive :: (Ring r) => CommutativeSemigroup (Additive r)

type Abelian a b = Group a => CommutativeSemigroup a => b
