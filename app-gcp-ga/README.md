# Setup scripts

This repo will hold setup scripts for new projects

## GCP with Github Action

Scripts to:

- Create a Google cloud app enginge.
  - Flex engine with custom runtime (docker).
- Deplopyed with github actions.
- Infrastructure provisioned with terraform.
- Code agnostic (For more information see scripts/SETUP.md).
  
To add to your repo run the following script

```sh
svn export https://github.com/worthington10TW/setup/trunk/app-gcp-ga move_my_contents_to_your_project_root
```
