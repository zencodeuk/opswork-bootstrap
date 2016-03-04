name        "opsworks_bootstrap"
description  "Bootstrap recipe for dynamic chef recipe installation"
version      "1.0.0"

supports "ubuntu"

recipe "opsworks_bootstrap::dependencies", "bootstraps the dependecies for your existing repo"


