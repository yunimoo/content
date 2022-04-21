#!/bin/bash


rm -f /etc/audit/rules.d/*

# cut out irrelevant rules for this test
sed '1,8d' test_audit.rules > /etc/audit/rules.d/test.rules
sed -i '4,7d' /etc/audit/rules.d/test.rules
{{% if product in ["ol8", "rhel8"] %}}
sed -i 's/-k modules/-F auid>=1000 -F auid!=unset -k modules/g' /etc/audit/rules.d/test.rules
{{% endif %}}
