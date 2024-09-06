<div align="center"><strong>Start to code in solidity with ETH Kipu</strong></div>

<br />

## Setup

1. Install Foundry by following the instructions from [their repository](https://github.com/foundry-rs/foundry#installation).
2. Copy the `.env.example` file to `.env` and fill in the variables.
3. Install the dependencies by running: `yarn install`.

## Running tests

ETH Kipu Starter Pack, ensures that unit tests remain completely isolated from external dependencies. Meanwhile, integration tests are usually executed on a fork of the blockchain. Both types of test examples are provided here.

In order to run both unit and integration tests, run:

```bash
yarn test
```

For unit tests, run:

```bash
yarn test:unit
```

For unit tests and have a full coverage with more fuzzing, run:

```bash
yarn test:unit:deep
```

In order to just run integration tests, run:

```bash
yarn test:integration
```

<br>

## Deploy & verify

### Setup

Configure the `.env` variables.

### Sepolia

```bash
yarn deploy:sepolia
```

The deployments are stored in ./broadcast

See the [Foundry Book for available options](https://book.getfoundry.sh/reference/forge/forge-create.html).
