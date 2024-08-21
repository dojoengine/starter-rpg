#[starknet::component]
mod PlayableComponent {
    // Core imports

    use core::debug::PrintTrait;

    // Starknet imports

    use starknet::ContractAddress;
    use starknet::info::{get_caller_address, get_block_timestamp};

    // Dojo imports

    use dojo::world::IWorldDispatcher;
    use dojo::world::IWorldDispatcherTrait;

    // Internal imports

    use rpg::constants;
    use rpg::store::{Store, StoreTrait};
    use rpg::models::player::{Player, PlayerTrait, PlayerAssert};
    use rpg::models::dungeon::{Dungeon, DungeonTrait, DungeonAssert};
    use rpg::types::role::Role;
    use rpg::types::mode::Mode;
    use rpg::types::direction::Direction;

    // Errors

    mod errors {}

    // Storage

    #[storage]
    struct Storage {}

    // Events

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {}

    #[generate_trait]
    impl InternalImpl<
        TContractState, +HasComponent<TContractState>
    > of InternalTrait<TContractState> {
        fn spawn(
            self: @ComponentState<TContractState>,
            world: IWorldDispatcher,
            name: felt252,
            role: u8,
            mode: u8
        ) {}

        fn move(self: @ComponentState<TContractState>, world: IWorldDispatcher, direction: u8) {}

        fn attack(self: @ComponentState<TContractState>, world: IWorldDispatcher) {}

        fn heal(self: @ComponentState<TContractState>, world: IWorldDispatcher, quantity: u8) {}
    }
}
