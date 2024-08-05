Feature Flags
=============

Feature flags are used across PINS applications to activate and deactivate pieces of deployed code in production.

Currently only the the feature flags for the CBOS application are defined in this repository. They are defined per environment in the `config/variables/stacks/back-office` directory. New feature flags for CBOS should be defined here and deployed rather than created throught the Azure portal.

Once deployed, the feature flags defined here are made accessible to CBOS by [this shared package](https://github.com/Planning-Inspectorate/back-office/blob/main/packages/feature-flags/src/feature-flag-client.js).
