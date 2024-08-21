// Core imports

use core::debug::PrintTrait;

// Inernal imports

use rpg::constants::{
    DEFAULT_POTION_HEAL, MAX_PLAYER_HEALTH, DEFAULT_POTION_COST, DEFAULT_PLAYER_DAMAGE,
    DEFAULT_PLAYER_HEALTH, DEFAULT_PLAYER_GOLD
};
use rpg::models::index::Player;
use rpg::types::role::{Role, RoleTrait};
use rpg::types::direction::Direction;
use rpg::types::mode::{Mode, ModeTrait};
use rpg::types::monster::{Monster, MonsterTrait};
use rpg::helpers::seeder::Seeder;

mod errors {
    const PLAYER_NOT_EXIST: felt252 = 'Player: does not exist';
    const PLAYER_ALREADY_EXIST: felt252 = 'Player: already exist';
    const PLAYER_INVALID_NAME: felt252 = 'Player: invalid name';
    const PLAYER_INVALID_CLASS: felt252 = 'Player: invalid role';
    const PLAYER_INVALID_DIRECTION: felt252 = 'Player: invalid direction';
    const PLAYER_NOT_ENOUGH_GOLD: felt252 = 'Player: not enough gold';
    const PLAYER_IS_DEAD: felt252 = 'Player: is dead';
}

#[generate_trait]
impl PlayerImpl of PlayerTrait {
    #[inline]
    fn new(id: felt252, name: felt252, time: u64, mode: Mode) -> Player {
        // [Check] Name is valid
        // [Compute] Weekly seed according to the timestamp and the mode
        // [Return] Player
        Player {
            id,
            mode: mode.into(),
            role: Role::None.into(),
            damage: DEFAULT_PLAYER_DAMAGE,
            health: DEFAULT_PLAYER_HEALTH,
            gold: DEFAULT_PLAYER_GOLD,
            score: 0,
            seed: 0,
            name
        }
    }

    #[inline]
    fn enrole(ref self: Player, role: Role) { // [Check] Role is valid
    // [Effect] Change the role
    // [Effect] Reseed with the role
    }

    #[inline]
    fn move(ref self: Player, direction: Direction) -> (Monster, Role) {
        // [Check] Direction is valid
        // [Effect] For the first move, spawn a specific monster and a role
        // [Effect] Spawn monster and role
        // [Effect] Reseed with the direction
        // [Return] Monster and role
        (Monster::None, Role::None)
    }

    #[inline]
    fn take_damage(ref self: Player, monster_role: Role, damage: u8) { // [Compute] Player role
    // [Compute] Received damage
    // [Effect] Take damage (minimum between health and received damage)
    }

    #[inline]
    fn reward(ref self: Player, gold: u16) {// [Effect] Add gold to the player balance
    // [Effect] Increase the player score
    }

    #[inline]
    fn heal(ref self: Player, quantity: u8) {// [Check] Affordable
    // [Effect] Remove gold
    // [Effect] Restore health
    }
}

#[generate_trait]
impl PlayerAssert of AssertTrait {
    #[inline]
    fn assert_exists(self: Player) {
        assert(0 != self.name, errors::PLAYER_NOT_EXIST);
    }

    #[inline]
    fn assert_not_exists(self: Player) {
        assert(0 == self.name, errors::PLAYER_ALREADY_EXIST);
    }

    #[inline]
    fn assert_not_dead(self: Player) {
        assert(self.health != 0, errors::PLAYER_IS_DEAD);
    }

    #[inline]
    fn assert_is_affordable(self: Player, cost: u16) {
        assert(self.gold >= cost, errors::PLAYER_NOT_ENOUGH_GOLD);
    }
}

