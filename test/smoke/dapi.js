const { client: jaysonClient } = require('jayson/promise');
const getNetworkConfig = require('../../lib/test/getNetworkConfig');
const createRpcClientFromConfig = require('../../lib/test/createRpcClientFromConfig');

const { variables, inventory } = getNetworkConfig();


describe('DAPI', () => {
  for (const hostName of inventory.masternodes.hosts) {
    describe(hostName, () => {
      let dapiClient;
      let coreClient;

      beforeEach(() => {
        dapiClient = jaysonClient.http({
          // eslint-disable-next-line no-underscore-dangle
          host: inventory._meta.hostvars[hostName].public_ip,
          port: 3000,
        });
        coreClient = createRpcClientFromConfig(hostName);
      });

      it('should respond data from chain', async function it() {
        if (!variables.evo_services) {
          this.skip('Evolution services are not enabled');
          return;
        }

        const { result } = await dapiClient.request('getBlockHash', { height: 1 });
        const blockHashRpc = await coreClient.getBlockHash(1);

        expect(result).to.be.equal(blockHashRpc.result);
      });

      it('should respond data from insight', async function it() {
        if (!variables.evo_services) {
          this.skip('Evolution services are not enabled');
          return;
        }

        const { result } = await dapiClient.request('getBestBlockHeight', { blockHeight: 1 });

        expect(result).to.be.an('number');
        expect(result % 1).to.be.equal(0);
      });

      it('should respond data from drive', async function it() {
        if (!variables.evo_services) {
          this.skip('Evolution services are not enabled');
          return;
        }

        const { result: { error: { code } } } = await dapiClient.request('fetchDapContract', { dapId: 'fakeDapId' });

        // we expect code -32602( invalid dap id) or 100( initial sync in progress)
        expect([-32602, 100]).to.be.containing(code);
      });
    });
  }
});
