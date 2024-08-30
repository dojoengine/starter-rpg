impl PromptMessageIntrospect<> of dojo::model::introspect::Introspect<PromptMessage<>> {
    #[inline(always)]
    fn size() -> Option<usize> {
        Option::None
    }

    fn layout() -> dojo::model::Layout {
        dojo::model::Layout::Struct(
            array![
                dojo::model::FieldLayout {
                    selector: 816413593781646185351656723232751444534853769734440940065672412888225674636,
                    layout: dojo::model::introspect::Introspect::<ByteArray>::layout()
                },
                dojo::model::FieldLayout {
                    selector: 1799351089425750926739610760929003019393122439843710838852417949154340589136,
                    layout: dojo::model::introspect::Introspect::<ByteArray>::layout()
                },
                dojo::model::FieldLayout {
                    selector: 1242883636335185042648196101482844477055185136100498177742807244790485718414,
                    layout: dojo::model::introspect::Introspect::<u64>::layout()
                }
            ]
                .span()
        )
    }

    #[inline(always)]
    fn ty() -> dojo::model::introspect::Ty {
        dojo::model::introspect::Ty::Struct(
            dojo::model::introspect::Struct {
                name: 'PromptMessage',
                attrs: array![].span(),
                children: array![
                    dojo::model::introspect::Member {
                        name: 'identity',
                        attrs: array!['key'].span(),
                        ty: dojo::model::introspect::Introspect::<ContractAddress>::ty()
                    },
                    dojo::model::introspect::Member {
                        name: 'event_id',
                        attrs: array!['key'].span(),
                        ty: dojo::model::introspect::Introspect::<u32>::ty()
                    },
                    dojo::model::introspect::Member {
                        name: 'event_tag',
                        attrs: array![].span(),
                        ty: dojo::model::introspect::Ty::ByteArray
                    },
                    dojo::model::introspect::Member {
                        name: 'prompt',
                        attrs: array![].span(),
                        ty: dojo::model::introspect::Ty::ByteArray
                    },
                    dojo::model::introspect::Member {
                        name: 'timestamp',
                        attrs: array![].span(),
                        ty: dojo::model::introspect::Introspect::<u64>::ty()
                    }
                ]
                    .span()
            }
        )
    }
}

#[derive(Drop, Serde)]
pub struct PromptMessageEntity {
    __id: felt252, // private field
    pub event_tag: ByteArray,
    pub prompt: ByteArray,
    pub timestamp: u64,
}

#[generate_trait]
pub impl PromptMessageEntityStoreImpl of PromptMessageEntityStore {
    fn get(world: dojo::world::IWorldDispatcher, entity_id: felt252) -> PromptMessageEntity {
        PromptMessageModelEntityImpl::get(world, entity_id)
    }

    fn update(self: @PromptMessageEntity, world: dojo::world::IWorldDispatcher) {
        dojo::model::ModelEntity::<PromptMessageEntity>::update_entity(self, world);
    }

    fn delete(self: @PromptMessageEntity, world: dojo::world::IWorldDispatcher) {
        dojo::model::ModelEntity::<PromptMessageEntity>::delete_entity(self, world);
    }


    fn get_event_tag(world: dojo::world::IWorldDispatcher, entity_id: felt252) -> ByteArray {
        let mut values = dojo::model::ModelEntity::<
            PromptMessageEntity
        >::get_member(
            world,
            entity_id,
            816413593781646185351656723232751444534853769734440940065672412888225674636
        );
        let field_value = core::serde::Serde::<ByteArray>::deserialize(ref values);

        if core::option::OptionTrait::<ByteArray>::is_none(@field_value) {
            panic!("Field `PromptMessage::event_tag`: deserialization failed.");
        }

        core::option::OptionTrait::<ByteArray>::unwrap(field_value)
    }

    fn set_event_tag(
        self: @PromptMessageEntity, world: dojo::world::IWorldDispatcher, value: ByteArray
    ) {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@value, ref serialized);

        self
            .set_member(
                world,
                816413593781646185351656723232751444534853769734440940065672412888225674636,
                serialized.span()
            );
    }

    fn get_prompt(world: dojo::world::IWorldDispatcher, entity_id: felt252) -> ByteArray {
        let mut values = dojo::model::ModelEntity::<
            PromptMessageEntity
        >::get_member(
            world,
            entity_id,
            1799351089425750926739610760929003019393122439843710838852417949154340589136
        );
        let field_value = core::serde::Serde::<ByteArray>::deserialize(ref values);

        if core::option::OptionTrait::<ByteArray>::is_none(@field_value) {
            panic!("Field `PromptMessage::prompt`: deserialization failed.");
        }

        core::option::OptionTrait::<ByteArray>::unwrap(field_value)
    }

    fn set_prompt(
        self: @PromptMessageEntity, world: dojo::world::IWorldDispatcher, value: ByteArray
    ) {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@value, ref serialized);

        self
            .set_member(
                world,
                1799351089425750926739610760929003019393122439843710838852417949154340589136,
                serialized.span()
            );
    }

    fn get_timestamp(world: dojo::world::IWorldDispatcher, entity_id: felt252) -> u64 {
        let mut values = dojo::model::ModelEntity::<
            PromptMessageEntity
        >::get_member(
            world,
            entity_id,
            1242883636335185042648196101482844477055185136100498177742807244790485718414
        );
        let field_value = core::serde::Serde::<u64>::deserialize(ref values);

        if core::option::OptionTrait::<u64>::is_none(@field_value) {
            panic!("Field `PromptMessage::timestamp`: deserialization failed.");
        }

        core::option::OptionTrait::<u64>::unwrap(field_value)
    }

    fn set_timestamp(self: @PromptMessageEntity, world: dojo::world::IWorldDispatcher, value: u64) {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@value, ref serialized);

        self
            .set_member(
                world,
                1242883636335185042648196101482844477055185136100498177742807244790485718414,
                serialized.span()
            );
    }
}

#[generate_trait]
pub impl PromptMessageStoreImpl of PromptMessageStore {
    fn entity_id_from_keys(identity: ContractAddress, event_id: u32) -> felt252 {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@identity, ref serialized);
        core::serde::Serde::serialize(@event_id, ref serialized);

        core::poseidon::poseidon_hash_span(serialized.span())
    }

    fn from_values(ref keys: Span<felt252>, ref values: Span<felt252>) -> PromptMessage {
        let mut serialized = core::array::ArrayTrait::new();
        serialized.append_span(keys);
        serialized.append_span(values);
        let mut serialized = core::array::ArrayTrait::span(@serialized);

        let entity = core::serde::Serde::<PromptMessage>::deserialize(ref serialized);

        if core::option::OptionTrait::<PromptMessage>::is_none(@entity) {
            panic!(
                "Model `PromptMessage`: deserialization failed. Ensure the length of the keys tuple is matching the number of #[key] fields in the model struct."
            );
        }

        core::option::OptionTrait::<PromptMessage>::unwrap(entity)
    }

    fn get(
        world: dojo::world::IWorldDispatcher, identity: ContractAddress, event_id: u32
    ) -> PromptMessage {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@identity, ref serialized);
        core::serde::Serde::serialize(@event_id, ref serialized);

        dojo::model::Model::<PromptMessage>::get(world, serialized.span())
    }

    fn set(self: @PromptMessage, world: dojo::world::IWorldDispatcher) {
        dojo::model::Model::<PromptMessage>::set_model(self, world);
    }

    fn delete(self: @PromptMessage, world: dojo::world::IWorldDispatcher) {
        dojo::model::Model::<PromptMessage>::delete_model(self, world);
    }


    fn get_event_tag(
        world: dojo::world::IWorldDispatcher, identity: ContractAddress, event_id: u32
    ) -> ByteArray {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@identity, ref serialized);
        core::serde::Serde::serialize(@event_id, ref serialized);

        let mut values = dojo::model::Model::<
            PromptMessage
        >::get_member(
            world,
            serialized.span(),
            816413593781646185351656723232751444534853769734440940065672412888225674636
        );

        let field_value = core::serde::Serde::<ByteArray>::deserialize(ref values);

        if core::option::OptionTrait::<ByteArray>::is_none(@field_value) {
            panic!("Field `PromptMessage::event_tag`: deserialization failed.");
        }

        core::option::OptionTrait::<ByteArray>::unwrap(field_value)
    }

    fn set_event_tag(self: @PromptMessage, world: dojo::world::IWorldDispatcher, value: ByteArray) {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@value, ref serialized);

        self
            .set_member(
                world,
                816413593781646185351656723232751444534853769734440940065672412888225674636,
                serialized.span()
            );
    }

    fn get_prompt(
        world: dojo::world::IWorldDispatcher, identity: ContractAddress, event_id: u32
    ) -> ByteArray {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@identity, ref serialized);
        core::serde::Serde::serialize(@event_id, ref serialized);

        let mut values = dojo::model::Model::<
            PromptMessage
        >::get_member(
            world,
            serialized.span(),
            1799351089425750926739610760929003019393122439843710838852417949154340589136
        );

        let field_value = core::serde::Serde::<ByteArray>::deserialize(ref values);

        if core::option::OptionTrait::<ByteArray>::is_none(@field_value) {
            panic!("Field `PromptMessage::prompt`: deserialization failed.");
        }

        core::option::OptionTrait::<ByteArray>::unwrap(field_value)
    }

    fn set_prompt(self: @PromptMessage, world: dojo::world::IWorldDispatcher, value: ByteArray) {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@value, ref serialized);

        self
            .set_member(
                world,
                1799351089425750926739610760929003019393122439843710838852417949154340589136,
                serialized.span()
            );
    }

    fn get_timestamp(
        world: dojo::world::IWorldDispatcher, identity: ContractAddress, event_id: u32
    ) -> u64 {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@identity, ref serialized);
        core::serde::Serde::serialize(@event_id, ref serialized);

        let mut values = dojo::model::Model::<
            PromptMessage
        >::get_member(
            world,
            serialized.span(),
            1242883636335185042648196101482844477055185136100498177742807244790485718414
        );

        let field_value = core::serde::Serde::<u64>::deserialize(ref values);

        if core::option::OptionTrait::<u64>::is_none(@field_value) {
            panic!("Field `PromptMessage::timestamp`: deserialization failed.");
        }

        core::option::OptionTrait::<u64>::unwrap(field_value)
    }

    fn set_timestamp(self: @PromptMessage, world: dojo::world::IWorldDispatcher, value: u64) {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@value, ref serialized);

        self
            .set_member(
                world,
                1242883636335185042648196101482844477055185136100498177742807244790485718414,
                serialized.span()
            );
    }
}

pub impl PromptMessageModelEntityImpl of dojo::model::ModelEntity<PromptMessageEntity> {
    fn id(self: @PromptMessageEntity) -> felt252 {
        *self.__id
    }

    fn values(self: @PromptMessageEntity) -> Span<felt252> {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(self.event_tag, ref serialized);
        core::serde::Serde::serialize(self.prompt, ref serialized);
        core::serde::Serde::serialize(self.timestamp, ref serialized);

        core::array::ArrayTrait::span(@serialized)
    }

    fn from_values(entity_id: felt252, ref values: Span<felt252>) -> PromptMessageEntity {
        let mut serialized = array![entity_id];
        serialized.append_span(values);
        let mut serialized = core::array::ArrayTrait::span(@serialized);

        let entity_values = core::serde::Serde::<PromptMessageEntity>::deserialize(ref serialized);
        if core::option::OptionTrait::<PromptMessageEntity>::is_none(@entity_values) {
            panic!("ModelEntity `PromptMessageEntity`: deserialization failed.");
        }
        core::option::OptionTrait::<PromptMessageEntity>::unwrap(entity_values)
    }

    fn get(world: dojo::world::IWorldDispatcher, entity_id: felt252) -> PromptMessageEntity {
        let mut values = dojo::world::IWorldDispatcherTrait::entity(
            world,
            dojo::model::Model::<PromptMessage>::selector(),
            dojo::model::ModelIndex::Id(entity_id),
            dojo::model::Model::<PromptMessage>::layout()
        );
        Self::from_values(entity_id, ref values)
    }

    fn update_entity(self: @PromptMessageEntity, world: dojo::world::IWorldDispatcher) {
        dojo::world::IWorldDispatcherTrait::set_entity(
            world,
            dojo::model::Model::<PromptMessage>::selector(),
            dojo::model::ModelIndex::Id(self.id()),
            self.values(),
            dojo::model::Model::<PromptMessage>::layout()
        );
    }

    fn delete_entity(self: @PromptMessageEntity, world: dojo::world::IWorldDispatcher) {
        dojo::world::IWorldDispatcherTrait::delete_entity(
            world,
            dojo::model::Model::<PromptMessage>::selector(),
            dojo::model::ModelIndex::Id(self.id()),
            dojo::model::Model::<PromptMessage>::layout()
        );
    }

    fn get_member(
        world: dojo::world::IWorldDispatcher, entity_id: felt252, member_id: felt252,
    ) -> Span<felt252> {
        match dojo::utils::find_model_field_layout(
            dojo::model::Model::<PromptMessage>::layout(), member_id
        ) {
            Option::Some(field_layout) => {
                dojo::world::IWorldDispatcherTrait::entity(
                    world,
                    dojo::model::Model::<PromptMessage>::selector(),
                    dojo::model::ModelIndex::MemberId((entity_id, member_id)),
                    field_layout
                )
            },
            Option::None => core::panic_with_felt252('bad member id')
        }
    }

    fn set_member(
        self: @PromptMessageEntity,
        world: dojo::world::IWorldDispatcher,
        member_id: felt252,
        values: Span<felt252>,
    ) {
        match dojo::utils::find_model_field_layout(
            dojo::model::Model::<PromptMessage>::layout(), member_id
        ) {
            Option::Some(field_layout) => {
                dojo::world::IWorldDispatcherTrait::set_entity(
                    world,
                    dojo::model::Model::<PromptMessage>::selector(),
                    dojo::model::ModelIndex::MemberId((self.id(), member_id)),
                    values,
                    field_layout
                )
            },
            Option::None => core::panic_with_felt252('bad member id')
        }
    }
}

#[cfg(target: "test")]
pub impl PromptMessageModelEntityTestImpl of dojo::model::ModelEntityTest<PromptMessageEntity> {
    fn update_test(self: @PromptMessageEntity, world: dojo::world::IWorldDispatcher) {
        let world_test = dojo::world::IWorldTestDispatcher {
            contract_address: world.contract_address
        };

        dojo::world::IWorldTestDispatcherTrait::set_entity_test(
            world_test,
            dojo::model::Model::<PromptMessage>::selector(),
            dojo::model::ModelIndex::Id(self.id()),
            self.values(),
            dojo::model::Model::<PromptMessage>::layout()
        );
    }

    fn delete_test(self: @PromptMessageEntity, world: dojo::world::IWorldDispatcher) {
        let world_test = dojo::world::IWorldTestDispatcher {
            contract_address: world.contract_address
        };

        dojo::world::IWorldTestDispatcherTrait::delete_entity_test(
            world_test,
            dojo::model::Model::<PromptMessage>::selector(),
            dojo::model::ModelIndex::Id(self.id()),
            dojo::model::Model::<PromptMessage>::layout()
        );
    }
}

pub impl PromptMessageModelImpl of dojo::model::Model<PromptMessage> {
    fn get(world: dojo::world::IWorldDispatcher, keys: Span<felt252>) -> PromptMessage {
        let mut values = dojo::world::IWorldDispatcherTrait::entity(
            world, Self::selector(), dojo::model::ModelIndex::Keys(keys), Self::layout()
        );
        let mut _keys = keys;

        PromptMessageStore::from_values(ref _keys, ref values)
    }

    fn set_model(self: @PromptMessage, world: dojo::world::IWorldDispatcher) {
        dojo::world::IWorldDispatcherTrait::set_entity(
            world,
            Self::selector(),
            dojo::model::ModelIndex::Keys(Self::keys(self)),
            Self::values(self),
            Self::layout()
        );
    }

    fn delete_model(self: @PromptMessage, world: dojo::world::IWorldDispatcher) {
        dojo::world::IWorldDispatcherTrait::delete_entity(
            world, Self::selector(), dojo::model::ModelIndex::Keys(Self::keys(self)), Self::layout()
        );
    }

    fn get_member(
        world: dojo::world::IWorldDispatcher, keys: Span<felt252>, member_id: felt252
    ) -> Span<felt252> {
        match dojo::utils::find_model_field_layout(Self::layout(), member_id) {
            Option::Some(field_layout) => {
                let entity_id = dojo::utils::entity_id_from_keys(keys);
                dojo::world::IWorldDispatcherTrait::entity(
                    world,
                    Self::selector(),
                    dojo::model::ModelIndex::MemberId((entity_id, member_id)),
                    field_layout
                )
            },
            Option::None => core::panic_with_felt252('bad member id')
        }
    }

    fn set_member(
        self: @PromptMessage,
        world: dojo::world::IWorldDispatcher,
        member_id: felt252,
        values: Span<felt252>
    ) {
        match dojo::utils::find_model_field_layout(Self::layout(), member_id) {
            Option::Some(field_layout) => {
                dojo::world::IWorldDispatcherTrait::set_entity(
                    world,
                    Self::selector(),
                    dojo::model::ModelIndex::MemberId((self.entity_id(), member_id)),
                    values,
                    field_layout
                )
            },
            Option::None => core::panic_with_felt252('bad member id')
        }
    }

    #[inline(always)]
    fn name() -> ByteArray {
        "PromptMessage"
    }

    #[inline(always)]
    fn namespace() -> ByteArray {
        "haiku"
    }

    #[inline(always)]
    fn tag() -> ByteArray {
        "haiku-PromptMessage"
    }

    #[inline(always)]
    fn version() -> u8 {
        1
    }

    #[inline(always)]
    fn selector() -> felt252 {
        1981887443317643340131839636225869792336172676716311672576337148912823253781
    }

    #[inline(always)]
    fn instance_selector(self: @PromptMessage) -> felt252 {
        Self::selector()
    }

    #[inline(always)]
    fn name_hash() -> felt252 {
        2665612278772609004862997034208089452361885049174039619503648044393891002521
    }

    #[inline(always)]
    fn namespace_hash() -> felt252 {
        159371543000137669334859047484239625827089117287201931851163638171079597795
    }

    #[inline(always)]
    fn entity_id(self: @PromptMessage) -> felt252 {
        core::poseidon::poseidon_hash_span(self.keys())
    }

    #[inline(always)]
    fn keys(self: @PromptMessage) -> Span<felt252> {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(self.identity, ref serialized);
        core::serde::Serde::serialize(self.event_id, ref serialized);

        core::array::ArrayTrait::span(@serialized)
    }

    #[inline(always)]
    fn values(self: @PromptMessage) -> Span<felt252> {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(self.event_tag, ref serialized);
        core::serde::Serde::serialize(self.prompt, ref serialized);
        core::serde::Serde::serialize(self.timestamp, ref serialized);

        core::array::ArrayTrait::span(@serialized)
    }

    #[inline(always)]
    fn layout() -> dojo::model::Layout {
        dojo::model::introspect::Introspect::<PromptMessage>::layout()
    }

    #[inline(always)]
    fn instance_layout(self: @PromptMessage) -> dojo::model::Layout {
        Self::layout()
    }

    #[inline(always)]
    fn packed_size() -> Option<usize> {
        dojo::model::layout::compute_packed_size(Self::layout())
    }
}

#[cfg(target: "test")]
pub impl PromptMessageModelTestImpl of dojo::model::ModelTest<PromptMessage> {
    fn set_test(self: @PromptMessage, world: dojo::world::IWorldDispatcher) {
        let world_test = dojo::world::IWorldTestDispatcher {
            contract_address: world.contract_address
        };

        dojo::world::IWorldTestDispatcherTrait::set_entity_test(
            world_test,
            dojo::model::Model::<PromptMessage>::selector(),
            dojo::model::ModelIndex::Keys(dojo::model::Model::<PromptMessage>::keys(self)),
            dojo::model::Model::<PromptMessage>::values(self),
            dojo::model::Model::<PromptMessage>::layout()
        );
    }

    fn delete_test(self: @PromptMessage, world: dojo::world::IWorldDispatcher) {
        let world_test = dojo::world::IWorldTestDispatcher {
            contract_address: world.contract_address
        };

        dojo::world::IWorldTestDispatcherTrait::delete_entity_test(
            world_test,
            dojo::model::Model::<PromptMessage>::selector(),
            dojo::model::ModelIndex::Keys(dojo::model::Model::<PromptMessage>::keys(self)),
            dojo::model::Model::<PromptMessage>::layout()
        );
    }
}

#[starknet::interface]
pub trait Iprompt_message<T> {
    fn ensure_abi(self: @T, model: PromptMessage);
}

#[starknet::contract]
pub mod prompt_message {
    use super::PromptMessage;
    use super::Iprompt_message;

    #[storage]
    struct Storage {}

    #[abi(embed_v0)]
    impl DojoModelImpl of dojo::model::IModel<ContractState> {
        fn name(self: @ContractState) -> ByteArray {
            dojo::model::Model::<PromptMessage>::name()
        }

        fn namespace(self: @ContractState) -> ByteArray {
            dojo::model::Model::<PromptMessage>::namespace()
        }

        fn tag(self: @ContractState) -> ByteArray {
            dojo::model::Model::<PromptMessage>::tag()
        }

        fn version(self: @ContractState) -> u8 {
            dojo::model::Model::<PromptMessage>::version()
        }

        fn selector(self: @ContractState) -> felt252 {
            dojo::model::Model::<PromptMessage>::selector()
        }

        fn name_hash(self: @ContractState) -> felt252 {
            dojo::model::Model::<PromptMessage>::name_hash()
        }

        fn namespace_hash(self: @ContractState) -> felt252 {
            dojo::model::Model::<PromptMessage>::namespace_hash()
        }

        fn unpacked_size(self: @ContractState) -> Option<usize> {
            dojo::model::introspect::Introspect::<PromptMessage>::size()
        }

        fn packed_size(self: @ContractState) -> Option<usize> {
            dojo::model::Model::<PromptMessage>::packed_size()
        }

        fn layout(self: @ContractState) -> dojo::model::Layout {
            dojo::model::Model::<PromptMessage>::layout()
        }

        fn schema(self: @ContractState) -> dojo::model::introspect::Ty {
            dojo::model::introspect::Introspect::<PromptMessage>::ty()
        }
    }

    #[abi(embed_v0)]
    impl prompt_messageImpl of Iprompt_message<ContractState> {
        fn ensure_abi(self: @ContractState, model: PromptMessage) {}
    }
}
