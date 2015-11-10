Vagrant.configure('2') do |config|
    config.vm.box = 'azure'
    config.vm.boot_timeout = 3600

    config.vm.provider :azure do |azure, override|
        # Mandatory Settings
        azure.mgmt_certificate = 'c:\certs\cert.pem'
        azure.mgmt_endpoint = 'https://management.core.windows.net'
        azure.subscription_id = 'f6a5d374-621d-4294-940d-d9ddf9e28e86'
        azure.vm_image = 'progressive-dev-win10-winrm-enabled'
        azure.vm_name = 'VAGRANT-DEV' # max 15 characters. contains letters, number and hyphens. can start with letters and can end with letters and numbers

        # vm_password is optional when specifying the private_key_file with Linux VMs
        # When building a Windows VM and using WinRM this setting is used to authenticate via WinRM (PowerShell Remoting)
        azure.vm_password = 'Greyboy88' # min 8 characters. should contain a lower case letter, an uppercase letter, a number and a special character

        # Optional Settings
        # azure.storage_acct_name = 'NAME OF YOUR STORAGE ACCOUNT' # optional. A new one will be generated if not provided.
        azure.vm_user = 'JBuchter' # defaults to 'vagrant' if not provided
        # azure.cloud_service_name = 'PROVIDE A NAME FOR YOUR CLOUD SERVICE' # same as vm_name. leave blank to auto-generate
        # azure.deployment_name = 'PROVIDE A NAME FOR YOUR DEPLOYMENT' # defaults to cloud_service_name
        azure.vm_location = 'East US' # e.g., West US

        # Optional *Nix Settings
        # azure.ssh_port = 'A VALID PUBLIC PORT' # defaults to 22
        # azure.private_key_file = 'Path to your ssh private key file (~/.ssh/id_rsa) to use for passwordless auth. If the id_rsa file is password protected, you will be prompted for the password.'

        # Optional Windows Settings
        azure.winrm_transport = [ 'http', 'https' ] # this will open up winrm ports on both http (5985) and http (5986) ports
        # azure.winrm_https_port = 'A VALID PUBLIC PORT' # customize the winrm https port, instead of 5986
        # azure.winrm_http_port = 'A VALID PUBLIC PORT' # customize the winrm http port, insted of 5985
        azure.tcp_endpoints = '3389:53389' # opens the Remote Desktop internal port that listens on public port 53389. Without this, you cannot RDP to a Windows VM.
    end
    config.vm.provision 'shell', path: "shell/main.cmd"
    config.vm.provision 'shell', path: "shell/InstallBoxstarter.bat"
    config.vm.provision 'shell', path: "shell/RunBoxstarterGist.bat"
end
