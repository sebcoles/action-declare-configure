# Veracode Declare Configure Action

This action runs the Declare `configure` action to create the Veracode configuration described in the Declare file. For more information read the docs [here](https://sebcoles.github.io/Veracode.OSS.Declare/actions/configure/)!

### Pre-requisites

Create a workflow `.yml` file in your `.github/workflows` directory. An [example workflow](#example-workflow---create-a-release) is available below. For more information, reference the GitHub Help Documentation for [Creating a workflow file](https://help.github.com/en/articles/configuring-a-workflow#creating-a-workflow-file).

## Inputs

### `configuration-file`

**Required** The filepath to the Declare configuration file. Defaults to `veracode.json`

### Example workflow - create a release
On every `push` to the main branch this will run the configure command against the Declare configuration. This will then add or update the Veracode configuration.

```yaml
on:
  push:
    branches:
      - main

name: Configure Veracode
jobs:
  build:
    name: Configure Veracode
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Configure Veracode
        uses: sebcoles/action-declare-configure@v1
        env:
          VERACODE_API_KEY_ID: ${{ secrets.VERACODE_API_KEY_ID }}
          VERACODE_API_KEY_SECRET: ${{ secrets.VERACODE_API_KEY_SECRET }} 
        with:
          configuration-file: "veracode.json"
```