impl BigBrainModelIntrospect<> of dojo::model::introspect::Introspect<BigBrainModel<>> {
    #[inline(always)]
    fn size() -> Option<usize> {
        Option::Some(1)
    }

    fn layout() -> dojo::model::Layout {
        dojo::model::Layout::Struct(
            array![
                dojo::model::FieldLayout {
                    selector: 1035317697387829112242539993499346172133053409841681584854038786890250064640,
                    layout: dojo::model::introspect::Introspect::<u8>::layout()
                }
            ]
                .span()
        )
    }

    #[inline(always)]
    fn ty() -> dojo::model::introspect::Ty {
        dojo::model::introspect::Ty::Struct(
            dojo::model::introspect::Struct {
                name: 'BigBrainModel',
                attrs: array![].span(),
                children: array![
                    dojo::model::introspect::Member {
                        name: 'id',
                        attrs: array!['key'].span(),
                        ty: dojo::model::introspect::Introspect::<felt252>::ty()
                    },
                    dojo::model::introspect::Member {
                        name: 'chad_factor',
                        attrs: array![].span(),
                        ty: dojo::model::introspect::Introspect::<u8>::ty()
                    }
                ]
                    .span()
            }
        )
    }
}

#[derive(Drop, Serde)]
pub struct BigBrainModelEntity {
    __id: felt252, // private field
    pub chad_factor: u8,
}

#[generate_trait]
pub impl BigBrainModelEntityStoreImpl of BigBrainModelEntityStore {
    fn get(world: dojo::world::IWorldDispatcher, entity_id: felt252) -> BigBrainModelEntity {
        BigBrainModelModelEntityImpl::get(world, entity_id)
    }


    fn get_chad_factor(world: dojo::world::IWorldDispatcher, entity_id: felt252) -> u8 {
        let mut values = dojo::model::ModelEntity::<
            BigBrainModelEntity
        >::get_member(
            world,
            entity_id,
            1035317697387829112242539993499346172133053409841681584854038786890250064640
        );
        let field_value = core::serde::Serde::<u8>::deserialize(ref values);

        if core::option::OptionTrait::<u8>::is_none(@field_value) {
            panic!("Field `BigBrainModel::chad_factor`: deserialization failed.");
        }

        core::option::OptionTrait::<u8>::unwrap(field_value)
    }

    fn set_chad_factor(
        self: @BigBrainModelEntity, world: dojo::world::IWorldDispatcher, value: u8
    ) {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@value, ref serialized);

        self
            .set_member(
                world,
                1035317697387829112242539993499346172133053409841681584854038786890250064640,
                serialized.span()
            );
    }
}

#[generate_trait]
pub impl BigBrainModelStoreImpl of BigBrainModelStore {
    fn entity_id_from_keys(id: felt252) -> felt252 {
        let mut serialized = core::array::ArrayTrait::new();
        core::array::ArrayTrait::append(ref serialized, id);

        core::poseidon::poseidon_hash_span(serialized.span())
    }

    fn from_values(ref keys: Span<felt252>, ref values: Span<felt252>) -> BigBrainModel {
        let mut serialized = core::array::ArrayTrait::new();
        serialized.append_span(keys);
        serialized.append_span(values);
        let mut serialized = core::array::ArrayTrait::span(@serialized);

        let entity = core::serde::Serde::<BigBrainModel>::deserialize(ref serialized);

        if core::option::OptionTrait::<BigBrainModel>::is_none(@entity) {
            panic!(
                "Model `BigBrainModel`: deserialization failed. Ensure the length of the keys tuple is matching the number of #[key] fields in the model struct."
            );
        }

        core::option::OptionTrait::<BigBrainModel>::unwrap(entity)
    }

    fn get(world: dojo::world::IWorldDispatcher, id: felt252) -> BigBrainModel {
        let mut serialized = core::array::ArrayTrait::new();
        core::array::ArrayTrait::append(ref serialized, id);

        dojo::model::Model::<BigBrainModel>::get(world, serialized.span())
    }


    fn get_chad_factor(world: dojo::world::IWorldDispatcher, id: felt252) -> u8 {
        let mut serialized = core::array::ArrayTrait::new();
        core::array::ArrayTrait::append(ref serialized, id);

        let mut values = dojo::model::Model::<
            BigBrainModel
        >::get_member(
            world,
            serialized.span(),
            1035317697387829112242539993499346172133053409841681584854038786890250064640
        );

        let field_value = core::serde::Serde::<u8>::deserialize(ref values);

        if core::option::OptionTrait::<u8>::is_none(@field_value) {
            panic!("Field `BigBrainModel::chad_factor`: deserialization failed.");
        }

        core::option::OptionTrait::<u8>::unwrap(field_value)
    }

    fn set_chad_factor(self: @BigBrainModel, world: dojo::world::IWorldDispatcher, value: u8) {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(@value, ref serialized);

        self
            .set_member(
                world,
                1035317697387829112242539993499346172133053409841681584854038786890250064640,
                serialized.span()
            );
    }
}

pub impl BigBrainModelModelEntityImpl of dojo::model::ModelEntity<BigBrainModelEntity> {
    fn id(self: @BigBrainModelEntity) -> felt252 {
        *self.__id
    }

    fn values(self: @BigBrainModelEntity) -> Span<felt252> {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(self.chad_factor, ref serialized);

        core::array::ArrayTrait::span(@serialized)
    }

    fn from_values(entity_id: felt252, ref values: Span<felt252>) -> BigBrainModelEntity {
        let mut serialized = array![entity_id];
        serialized.append_span(values);
        let mut serialized = core::array::ArrayTrait::span(@serialized);

        let entity_values = core::serde::Serde::<BigBrainModelEntity>::deserialize(ref serialized);
        if core::option::OptionTrait::<BigBrainModelEntity>::is_none(@entity_values) {
            panic!("ModelEntity `BigBrainModelEntity`: deserialization failed.");
        }
        core::option::OptionTrait::<BigBrainModelEntity>::unwrap(entity_values)
    }

    fn get(world: dojo::world::IWorldDispatcher, entity_id: felt252) -> BigBrainModelEntity {
        let mut values = dojo::world::IWorldDispatcherTrait::entity(
            world,
            dojo::model::Model::<BigBrainModel>::selector(),
            dojo::model::ModelIndex::Id(entity_id),
            dojo::model::Model::<BigBrainModel>::layout()
        );
        Self::from_values(entity_id, ref values)
    }

    fn update(self: @BigBrainModelEntity, world: dojo::world::IWorldDispatcher) {
        dojo::world::IWorldDispatcherTrait::set_entity(
            world,
            dojo::model::Model::<BigBrainModel>::selector(),
            dojo::model::ModelIndex::Id(self.id()),
            self.values(),
            dojo::model::Model::<BigBrainModel>::layout()
        );
    }

    fn delete(self: @BigBrainModelEntity, world: dojo::world::IWorldDispatcher) {
        dojo::world::IWorldDispatcherTrait::delete_entity(
            world,
            dojo::model::Model::<BigBrainModel>::selector(),
            dojo::model::ModelIndex::Id(self.id()),
            dojo::model::Model::<BigBrainModel>::layout()
        );
    }

    fn get_member(
        world: dojo::world::IWorldDispatcher, entity_id: felt252, member_id: felt252,
    ) -> Span<felt252> {
        match dojo::utils::find_model_field_layout(
            dojo::model::Model::<BigBrainModel>::layout(), member_id
        ) {
            Option::Some(field_layout) => {
                dojo::world::IWorldDispatcherTrait::entity(
                    world,
                    dojo::model::Model::<BigBrainModel>::selector(),
                    dojo::model::ModelIndex::MemberId((entity_id, member_id)),
                    field_layout
                )
            },
            Option::None => core::panic_with_felt252('bad member id')
        }
    }

    fn set_member(
        self: @BigBrainModelEntity,
        world: dojo::world::IWorldDispatcher,
        member_id: felt252,
        values: Span<felt252>,
    ) {
        match dojo::utils::find_model_field_layout(
            dojo::model::Model::<BigBrainModel>::layout(), member_id
        ) {
            Option::Some(field_layout) => {
                dojo::world::IWorldDispatcherTrait::set_entity(
                    world,
                    dojo::model::Model::<BigBrainModel>::selector(),
                    dojo::model::ModelIndex::MemberId((self.id(), member_id)),
                    values,
                    field_layout
                )
            },
            Option::None => core::panic_with_felt252('bad member id')
        }
    }
}

pub impl BigBrainModelModelImpl of dojo::model::Model<BigBrainModel> {
    fn get(world: dojo::world::IWorldDispatcher, keys: Span<felt252>) -> BigBrainModel {
        let mut values = dojo::world::IWorldDispatcherTrait::entity(
            world, Self::selector(), dojo::model::ModelIndex::Keys(keys), Self::layout()
        );
        let mut _keys = keys;

        BigBrainModelStore::from_values(ref _keys, ref values)
    }

    fn set(self: @BigBrainModel, world: dojo::world::IWorldDispatcher) {
        dojo::world::IWorldDispatcherTrait::set_entity(
            world,
            Self::selector(),
            dojo::model::ModelIndex::Keys(Self::keys(self)),
            Self::values(self),
            Self::layout()
        );
    }

    fn delete(self: @BigBrainModel, world: dojo::world::IWorldDispatcher) {
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
        self: @BigBrainModel,
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
        "BigBrainModel"
    }

    #[inline(always)]
    fn namespace() -> ByteArray {
        "dojo_starter_rpg"
    }

    #[inline(always)]
    fn tag() -> ByteArray {
        "dojo_starter_rpg-BigBrainModel"
    }

    #[inline(always)]
    fn version() -> u8 {
        1
    }

    #[inline(always)]
    fn selector() -> felt252 {
        40236202715532329402517888732709413560142766769623155477467345263059719639
    }

    #[inline(always)]
    fn instance_selector(self: @BigBrainModel) -> felt252 {
        Self::selector()
    }

    #[inline(always)]
    fn name_hash() -> felt252 {
        1066386397338389439809428506171075949704119697435060367768240185429157216504
    }

    #[inline(always)]
    fn namespace_hash() -> felt252 {
        478818318480335965857378696073169770196363091739687234837836645523859370417
    }

    #[inline(always)]
    fn entity_id(self: @BigBrainModel) -> felt252 {
        core::poseidon::poseidon_hash_span(self.keys())
    }

    #[inline(always)]
    fn keys(self: @BigBrainModel) -> Span<felt252> {
        let mut serialized = core::array::ArrayTrait::new();
        core::array::ArrayTrait::append(ref serialized, *self.id);

        core::array::ArrayTrait::span(@serialized)
    }

    #[inline(always)]
    fn values(self: @BigBrainModel) -> Span<felt252> {
        let mut serialized = core::array::ArrayTrait::new();
        core::serde::Serde::serialize(self.chad_factor, ref serialized);

        core::array::ArrayTrait::span(@serialized)
    }

    #[inline(always)]
    fn layout() -> dojo::model::Layout {
        dojo::model::introspect::Introspect::<BigBrainModel>::layout()
    }

    #[inline(always)]
    fn instance_layout(self: @BigBrainModel) -> dojo::model::Layout {
        Self::layout()
    }

    #[inline(always)]
    fn packed_size() -> Option<usize> {
        dojo::model::layout::compute_packed_size(Self::layout())
    }
}

#[starknet::interface]
pub trait Ibig_brain_model<T> {
    fn ensure_abi(self: @T, model: BigBrainModel);
}

#[starknet::contract]
pub mod big_brain_model {
    use super::BigBrainModel;
    use super::Ibig_brain_model;

    #[storage]
    struct Storage {}

    #[abi(embed_v0)]
    impl DojoModelImpl of dojo::model::IModel<ContractState> {
        fn name(self: @ContractState) -> ByteArray {
            dojo::model::Model::<BigBrainModel>::name()
        }

        fn namespace(self: @ContractState) -> ByteArray {
            dojo::model::Model::<BigBrainModel>::namespace()
        }

        fn tag(self: @ContractState) -> ByteArray {
            dojo::model::Model::<BigBrainModel>::tag()
        }

        fn version(self: @ContractState) -> u8 {
            dojo::model::Model::<BigBrainModel>::version()
        }

        fn selector(self: @ContractState) -> felt252 {
            dojo::model::Model::<BigBrainModel>::selector()
        }

        fn name_hash(self: @ContractState) -> felt252 {
            dojo::model::Model::<BigBrainModel>::name_hash()
        }

        fn namespace_hash(self: @ContractState) -> felt252 {
            dojo::model::Model::<BigBrainModel>::namespace_hash()
        }

        fn unpacked_size(self: @ContractState) -> Option<usize> {
            dojo::model::introspect::Introspect::<BigBrainModel>::size()
        }

        fn packed_size(self: @ContractState) -> Option<usize> {
            dojo::model::Model::<BigBrainModel>::packed_size()
        }

        fn layout(self: @ContractState) -> dojo::model::Layout {
            dojo::model::Model::<BigBrainModel>::layout()
        }

        fn schema(self: @ContractState) -> dojo::model::introspect::Ty {
            dojo::model::introspect::Introspect::<BigBrainModel>::ty()
        }
    }

    #[abi(embed_v0)]
    impl big_brain_modelImpl of Ibig_brain_model<ContractState> {
        fn ensure_abi(self: @ContractState, model: BigBrainModel) {}
    }
}
