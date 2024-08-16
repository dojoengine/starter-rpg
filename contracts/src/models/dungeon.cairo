// Core imports

use core::debug::PrintTrait;
use core::poseidon::{PoseidonTrait, HashState};
use core::hash::HashStateTrait;

// Inernal imports

use rpg::constants;
use rpg::models::index::Dungeon;
use rpg::types::mode::{Mode, ModeTrait};
use rpg::types::role::{Role, RoleTrait};
use rpg::types::monster::{Monster, MonsterTrait};

mod errors {
    const DUNGEON_NOT_DONE: felt252 = 'Dungeon: not done';
    const DUNGEON_ALREADY_DONE: felt252 = 'Dungeon: already done';
    const DUNGEON_NOT_SHOP: felt252 = 'Dungeon: not shop';
}

#[generate_trait]
impl DungeonImpl of DungeonTrait {
    #[inline]
    fn new(id: felt252, monster: Monster, role: Role) -> Dungeon {
        Dungeon {
            id,
            monster: monster.into(),
            role: role.into(),
            damage: monster.damage(),
            health: monster.health(),
            reward: monster.reward(),
        }
    }

    #[inline]
    fn is_done(self: Dungeon) -> bool {
        self.monster == Monster::None.into() || self.health == 0
    }

    #[inline]
    fn take_damage(ref self: Dungeon, player_role: Role, damage: u8) {
        let monster_role: Role = self.role.into();
        let received_damage = monster_role.received_damage(player_role, damage);
        self.health -= core::cmp::min(self.health, received_damage);
    }

    #[inline]
    fn treasury(self: Dungeon) -> u16 {
        let monster: Monster = self.monster.into();
        monster.reward()
    }
}

#[generate_trait]
impl DungeonAssert of AssertTrait {
    #[inline]
    fn assert_is_done(self: Dungeon) {
        assert(self.is_zero(), errors::DUNGEON_NOT_DONE);
    }

    #[inline]
    fn assert_not_done(self: Dungeon) {
        assert(self.is_non_zero(), errors::DUNGEON_ALREADY_DONE);
    }

    #[inline]
    fn assert_is_shop(self: Dungeon) {
        assert(self.monster == Monster::None.into(), errors::DUNGEON_NOT_SHOP);
    }
}

impl ZeroableDungeonImpl of core::Zeroable<Dungeon> {
    #[inline]
    fn zero() -> Dungeon {
        Dungeon { id: 0, monster: 0, role: 0, damage: 0, health: 0, reward: 0 }
    }

    #[inline]
    fn is_zero(self: Dungeon) -> bool {
        self.monster == Monster::None.into() || self.health == 0
    }

    #[inline]
    fn is_non_zero(self: Dungeon) -> bool {
        !self.is_zero()
    }
}

