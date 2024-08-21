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
        // [Check] Monster is either None or health is 0
        false
    }

    #[inline]
    fn take_damage(ref self: Dungeon, player_role: Role, damage: u8) { // [Compute] Monster role
    // [Compute] Received damage
    // [Effect] Take damage (minimum between health and received damage)
    }

    #[inline]
    fn get_treasury(self: Dungeon) -> u16 {
        // [Compute] Monster reward
        0
    }
}

#[generate_trait]
impl DungeonAssert of AssertTrait {
    #[inline]
    fn assert_is_done(self: Dungeon) {
        assert(self.is_done(), errors::DUNGEON_NOT_DONE);
    }

    #[inline]
    fn assert_not_done(self: Dungeon) {
        assert(!self.is_done(), errors::DUNGEON_ALREADY_DONE);
    }

    #[inline]
    fn assert_is_shop(self: Dungeon) {
        assert(self.monster == Monster::None.into(), errors::DUNGEON_NOT_SHOP);
    }
}


#[cfg(test)]
mod tests {
    // Local imports

    use super::{
        Dungeon, DungeonTrait, AssertTrait, Role, RoleTrait, Monster, MonsterTrait, Mode, ModeTrait
    };

    // Constants

    const ID: felt252 = 'ID';
    const MONSTER: Monster = Monster::Common;
    const ROLE: Role = Role::Fire;

    #[test]
    fn test_dungeon_new() {
        let dungeon: Dungeon = DungeonTrait::new(ID, MONSTER, ROLE);
        assert_eq!(dungeon.id, ID);
        assert_eq!(dungeon.monster, MONSTER.into());
        assert_eq!(dungeon.role, ROLE.into());
        assert_eq!(dungeon.damage, MONSTER.damage());
        assert_eq!(dungeon.health, MONSTER.health());
        assert_eq!(dungeon.reward, MONSTER.reward());
    }

    #[test]
    fn test_dungeon_is_done() {}

    #[test]
    fn test_dungeon_take_damage() {}
}

