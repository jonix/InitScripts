;; For looking up protocol names
(autoload 'protocols-lookup      "protocols" "Perform a protocol lookup" t)
(autoload 'protocols-clear-cache "protocols" "Clear the protocols cache" t)

;; For looking up services by name
(autoload 'services-lookup      "services" "Perform a service lookup" t)
(autoload 'services-clear-cache "services" "Clear the service cache"  t)

;; Looking up TLD (top level domains) by abbrevation or complete country name
(autoload 'tld "tld" "Perform a TLD lookup" t)
