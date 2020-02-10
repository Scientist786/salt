This repo contains the Salt states that are applied by the [community edition of](https://www.saltstack.com/resources/community/). Currently, the states are applied only when the machine is restarted by virtue of the root crontab which executes a shell script, `update_system.sh`.

This is configured as a masterless minion, though it could easily be reconfigured as a minion with a Salt master by modifying the `minion` file in this repository.

The SiteLogic Configuration application, which can be found as the `plc_config` state in this repo, presents a user interface from which one can enter key/value pairs representing the desired configuration of the machine. That application creates YAML files, which it puts in `/home/plc/plc_config/salt/yaml`. When `update_system.sh` is executed, which is typically done by a restart of the machine, Salt reads those configuration files as Salt grains and applies the states as appropriate for the machine type, Maple Edge or TCU. In effect, the SiteLogic Configuration application is just a configuration file generator. It does not do any of the configuration.

At the moment, due to the fact that `rmc_be` is still under development and its configuration file is changing, the only way to configure the block element interfaces is via the Custom File form which has one freeform text field. You must enter valid YAML into that field an example of which can be found in `backend/example_config.yml`.

Salt can only work if the Salt packages have been installed. That is only true for images built in the last couple of months of 2018. For Salt to optimally configure a TCU versus a Maple Edge, it has to be able to determine the machine type in which it is running.

Here are the valid cases for identifying the machine type.

1. For machines built on or after March 9, 2019, machine_type is set in /opt/etc/salt/machine.yml. Use whatever machine_type is from that grain.
2. For machines built on or after December 20, 2018 and before March 9, 2019, there is a zero byte file in /root, either "tulip" or "maple_edge". Treat "tulip" as "3b_plus_fbms" and anything else as "maple_edge".
3. For machines that were built before December 20, 2018, there is no way to identify the machine_type so treat it as "maple_edge". The rationale for this is because replacing the SD card of a TCU is much easier than replacing the SD card of a Maple Edge. We can always install a fresh image on a TCU simply by replacing the SD card. We prefer to update the Maple Edge without having to reimage it.