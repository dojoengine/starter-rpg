// Internal imports

use rpg::elements::monsters;

#[derive(Copy, Drop)]
enum Monster {
    None,
    Common,
    Elite,
    Boss,
}

#[generate_trait]
impl MonsterImpl of MonsterTrait {
    #[inline]
    fn damage(self: Monster) -> u8 {
        0
    }

    #[inline]
    fn health(self: Monster) -> u8 {
        0
    }

    #[inline]
    fn reward(self: Monster) -> u16 {
        0
    }
}

impl IntoMonsterFelt252 of core::Into<Monster, felt252> {
    #[inline]
    fn into(self: Monster) -> felt252 {
        match self {
            Monster::None => 'NONE',
            Monster::Common => 'COMMON',
            Monster::Elite => 'ELITE',
            Monster::Boss => 'BOSS',
        }
    }
}

impl IntoMonsterU8 of core::Into<Monster, u8> {
    #[inline]
    fn into(self: Monster) -> u8 {
        match self {
            Monster::None => 0,
            Monster::Common => 1,
            Monster::Elite => 2,
            Monster::Boss => 3,
        }
    }
}

impl IntoU8Monster of core::Into<u8, Monster> {
    #[inline]
    fn into(self: u8) -> Monster {
        let card: felt252 = self.into();
        match card {
            0 => Monster::None,
            1 => Monster::Common,
            2 => Monster::Elite,
            3 => Monster::Boss,
            _ => Monster::None,
        }
    }
}

impl MonsterPrint of core::debug::PrintTrait<Monster> {
    #[inline]
    fn print(self: Monster) {
        let felt: felt252 = self.into();
        felt.print();
    }
}
