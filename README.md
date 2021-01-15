# sat_sca_reregister

Scripts are intented to create static ansible inventory with using hammer and Satellite database according to their Activation keys.
This is usable only when you're migrating from standard subscription model to Simple Content Access in the Satellite 6.8+ version

Usage : 

1. Run bash script on the Satellite host where capsule is hosted
2. Check for wrong ip-address in the generated file, Satellite can generate wrong IP-addresses if some host has container network instaled
3. Run Ansible playbook to reregister hosts with their initial Activation Keys
