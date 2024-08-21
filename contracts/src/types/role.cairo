// Internal imports

use rpg::elements::roles;

#[derive(Copy, Drop)]
enum Role {
    None,
    Fire,
    Water,
    Earth,
    Air,
}

#[generate_trait]
impl RoleImpl of RoleTrait {
    #[inline]
    fn weakness(self: Role) -> Role {
        Role::None
    }

    #[inline]
    fn strength(self: Role) -> Role {
        Role::None
    }

    #[inline]
    fn received_damage(self: Role, role: Role, damage: u8) -> u8 {
        0
    }
}

impl IntoRoleFelt252 of core::Into<Role, felt252> {
    #[inline(always)]
    fn into(self: Role) -> felt252 {
        match self {
            Role::None => 'NONE',
            Role::Fire => 'FIRE',
            Role::Water => 'WATER',
            Role::Earth => 'EARTH',
            Role::Air => 'AIR',
        }
    }
}

impl IntoRoleU8 of core::Into<Role, u8> {
    #[inline(always)]
    fn into(self: Role) -> u8 {
        match self {
            Role::None => 0,
            Role::Fire => 1,
            Role::Water => 2,
            Role::Earth => 3,
            Role::Air => 4,
        }
    }
}

impl IntoU8Role of core::Into<u8, Role> {
    #[inline(always)]
    fn into(self: u8) -> Role {
        let card: felt252 = self.into();
        match card {
            0 => Role::None,
            1 => Role::Fire,
            2 => Role::Water,
            3 => Role::Earth,
            4 => Role::Air,
            _ => Role::None,
        }
    }
}

impl RolePrint of core::debug::PrintTrait<Role> {
    #[inline(always)]
    fn print(self: Role) {
        let felt: felt252 = self.into();
        felt.print();
    }
}
