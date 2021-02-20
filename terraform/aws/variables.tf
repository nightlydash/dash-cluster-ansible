variable "public_key_path" {
}

variable "dashd_port" {
  description = "Port for Dash Core nodes"
  default     = 20001
}

variable "dashd_rpc_port" {
  description = "Port for Dash RPC interface"
  default     = 20002
}

variable "dashd_zmq_port" {
  description = "Port for Dash Zmq interface"
  default     = 29998
}

variable "insight_port" {
  description = "Insight port"
  default     = 3001
}

variable "ssh_port" {
  description = "SSH port"
  default     = 22
}

variable "drive_port" {
  description = "Drive port"
  default     = 6000
}

variable "dapi_port" {
  description = "DAPI port"
  default     = 3000
}

variable "dapi_grpc_port" {
  description = "DAPI GRPC port"
  default     = 3010
}

variable "tendermint_p2p_port" {
  description = "Tendermint P2P port"
  default     = 26656
}

variable "tendermint_rpc_port" {
  description = "Tendermint RPC port"
  default     = 26657
}

variable "tendermint_abci_port" {
  description = "Tendermint ABCI port"
  default     = 26658
}

variable "docker_port" {
  description = "Docker API port"
  default     = 2375
}

variable "vpn_port" {
  description = "VPN port"
  default     = 1194
}

variable "kibana_port" {
  description = "Kibana port"
  default     = 5601
}

variable "platform_explorer_port" {
  description = "Platform explorer port"
  default     = 8080
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "subnet_public_cidr" {
  type = list
  default = [
    "10.0.16.0/20",
    "10.0.32.0/20",
    "10.0.48.0/20",
  ]
}

variable "seed_count" {
  default = 1
}

variable "miner_count" {
  default = 1
}

variable "masternode_count" {
  default = 3
}

variable "wallet_count" {
  description = "number of wallet nodes to create. must be at least 2"
  default     = 2
}

variable "web_count" {
  default = 1
}

variable "logs_enabled" {
  default = true
  description = "setup instance for logging"
}

variable "vpn_enabled" {
  default     = true
  description = "setup instance for vpn"
}

variable "main_domain" {
  description = "domain name will be used for base for technical records"
  default     = ""
}

variable "montitoring_sns_arn" {
  description = "ARN of SNS topic that will receive notifications from monitoring"
  default     = ""
}

variable "public_network_name" {
  description = "Name of the network that will be used to create dns records"
  default     = ""
}

variable "monitoring_enabled" {
  description = "enable monitoring with CloudWatch"
  default     = false
}

variable "core_node_disk_size" {
  description = "Default disk size for nodes, increase for testnet"
  default     = 20
}

variable "mn_node_disk_size" {
  description = "Disk size of masternodes"
  default     = 30
}

variable "web_node_disk_size" {
  description = "Disk size of web nodes"
  default     = 50
}

variable "logs_node_disk_size" {
  description = "Disk size of log nodes"
  default     = 100
}
