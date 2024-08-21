import { useEffect, useState } from "react";
import "./App.css";
import * as torii from "@dojoengine/torii-client";
import { dojoConfig } from "../dojoConfig";
import { Button } from "./components/ui/button";
import { setupWorld } from "./typescript/contracts.gen";
import { DojoProvider } from "@dojoengine/core";

const client = await setupWorld(
  new DojoProvider(dojoConfig.manifest, dojoConfig.rpcUrl)
);

function App() {
  const [toriiClient, setToriiClient] = useState<torii.ToriiClient | null>(
    null
  );

  useEffect(() => {
    const setupToriiClient = async () => {
      const client = await torii.createClient({
        rpcUrl: dojoConfig.rpcUrl,
        toriiUrl: dojoConfig.toriiUrl,
        relayUrl: "",
        worldAddress: dojoConfig.manifest.world.address || "",
      });
      setToriiClient(client);
    };

    setupToriiClient();
  }, []);

  useEffect(() => {
    const handleEntityUpdate = async () => {
      await toriiClient?.onEntityUpdated(
        [],
        (fetchedEntities: any, data: any) => {
          console.log(fetchedEntities, data);
        }
      );
    };

    handleEntityUpdate();
  }, [toriiClient]);

  return (
    <>
      <div>
        <h4>hi</h4>
        <Button
          onClick={async () => {
            // await client.actions.spawn({})
          }}
          variant={"default"}
        >
          Spawn
        </Button>
      </div>
    </>
  );
}

export default App;
