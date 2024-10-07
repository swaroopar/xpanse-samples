#!/bin/bash

#
# SPDX-License-Identifier: Apache-2.0
#  SPDX-FileCopyrightText: Huawei Inc.
#

# We must set the password here again since huawei cloud uses userdata to setup root password.
# when we pass a custom userdata script, then the in-built userdata script is not executed.

echo 'root:${admin_passwd}' | chpasswd

wget -O /tmp/create-agent-service.sh https://raw.githubusercontent.com/eclipse-xpanse/xpanse-agent/refs/heads/main/scripts/create-agent-service.sh

chmod 775 /tmp/create-agent-service.sh

/tmp/create-agent-service.sh --serviceId ${serviceId} --resourceName ${resourceName} --pollingInterval ${pollingInterval} --xpanseApiEndpoint ${xpanseApiEndpoint} --agentVersion ${agentVersion}