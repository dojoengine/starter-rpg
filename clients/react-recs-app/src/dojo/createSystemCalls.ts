import { AccountInterface } from "starknet";
import {
  Entity,
  Has,
  HasValue,
  World,
  defineSystem,
  getComponentValue,
} from "@dojoengine/recs";
import { uuid } from "@latticexyz/utils";
import { ClientComponents } from "./createClientComponents";
import { Direction, updatePositionWithDirection } from "../utils";
import { getEntityIdFromKeys } from "@dojoengine/utils";
import type { IWorld } from "./typescript/contracts.gen";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  { client }: { client: IWorld },
  {}: ClientComponents,
  world: World
) {
  return {};
}
