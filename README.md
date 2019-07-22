# vCenter `packer` `ansible` `inspec`

## Scope

This repo is the core example pipeline bringing vCenter, `packer`,
`ansible` and `inspec` together.

## Process

TODO: Fill this out

TODO: Add diagram of the pipeline

## Usage

### Pre-Reqs

1) `ansible` installed
2) `packer` installed
3) `packer-builder-vphere` installed from [here][builder_vsphere]

### Running the pipeline

1) Clone this repository and make any changes to the [Jenkinsfile](./Jenkinsfile)
2) Take the Jenkinsfile import it into your jenkins instance.
3) Edit the following from the [variables.json](./debian10/variables.json) example
4) Run the pipeline with changes you may want.

## License & Authors

If you would like to see the detailed LICENCE click [here](./LICENCE).

- Author: JJ Asghar <awesome@ibm.com>
- Author: Will Plusnick <pwplusni@us.ibm.com>

```text
Copyright:: 2019- IBM, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[builder_vsphere]: https://github.com/jetbrains-infra/packer-builder-vsphere
