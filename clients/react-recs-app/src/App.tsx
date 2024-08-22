import "./App.css";
import { useComponentValue } from "@dojoengine/react";
import { Entity } from "@dojoengine/recs";
import { getEntityIdFromKeys } from "@dojoengine/utils";
import { useDojo } from "./dojo/useDojo";
import { Button } from "./components/ui/button";
import * as torii from "@dojoengine/torii-client";

function App() {
  const {
    setup: {
      clientComponents: { Dungeon, Player },
      client,
    },
    account: { account },
  } = useDojo();

  // entity id we are syncing
  const entityId = getEntityIdFromKeys([BigInt(account.address)]) as Entity;

  const player = useComponentValue(Player, entityId);

  console.log(player);

  return (
    <>
      <div className="bg-black text-green-600 h-screen w-screen p-10">
        <h4>RPG Starter</h4>
        <div className="mb-1">
          <Button
            onClick={async () => {
              await client.actions.spawn({
                account,
                name: BigInt(torii.cairoShortStringToFelt("Loaf")),
                role: 1,
              });
            }}
            variant={"default"}
          >
            Spawn
          </Button>
        </div>

        <div className="grid grid-cols-2 gap-1">
          <Button
            onClick={async () => {
              await client.actions.move({
                account,
                direction: 1, // North
              });
            }}
            variant={"outline"}
          >
            North
          </Button>
          <Button
            onClick={async () => {
              await client.actions.move({
                account,
                direction: 2, // South
              });
            }}
            variant={"outline"}
          >
            South
          </Button>
          <Button
            onClick={async () => {
              await client.actions.move({
                account,
                direction: 3, // East
              });
            }}
            variant={"outline"}
          >
            East
          </Button>
          <Button
            onClick={async () => {
              await client.actions.move({
                account,
                direction: 4, // West
              });
            }}
            variant={"outline"}
          >
            West
          </Button>
        </div>

        <div className="my-1">
          {" "}
          <Button
            onClick={async () => {
              await client.actions.heal({
                account,
                quantity: 1,
              });
            }}
            variant={"secondary"}
          >
            Heal
          </Button>
          <Button
            onClick={async () => {
              await client.actions.attack({
                account,
              });
            }}
            variant={"destructive"}
          >
            Attack
          </Button>
        </div>
      </div>
    </>
  );
}

export default App;
